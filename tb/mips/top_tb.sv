`include "../../bennettclock/bennettClock.sv"
`include "../../bennettclock/bennettClock_square.sv"
`include "../../bennettclock/bennettClock_noX.sv"


module mips_tb();
supply1 VDD;
supply0 VSS;

localparam WIDTH = 11; // Need 11 phases: DUT uses clkpos[1:10], so Bennett must generate [0:10]
// Clock Related Signals
logic SRAM_clkneg;
logic SRAM_clkpos;
logic [0:1] padclkneg;
logic [0:1] padclkpos;

logic clk;
logic reset;
logic [0:WIDTH-1] clkneg;
logic [0:WIDTH-1] clkpos;
logic Mclk;
logic instFlag;
logic srclkneg, srclkpos;

// Input signals
logic [15:0] in;
logic Fclk;
logic MemWrite;
logic Reset;

tri [15:0] io;
logic lbrd;
logic nand_in1, nand_in2;
logic not_in1, not_in2;
logic Tclk;

// Output signals
logic [15:0] PC;
logic nand_out;
logic not_out1, not_out2;
logic OP3_spy, OP5_spy;

logic io_en;

// Bennett clock instantiation
bennett_clock_square #(
    .WIDTH(WIDTH)
) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);

assign clkneg = ~clkpos;
assign SRAM_clkneg = (Mclk ^ clkpos[6]) & clkpos[6];
assign SRAM_clkpos = ~SRAM_clkneg;
assign Tclk  = (clkpos[8] === 1'bX ) ? 1'b0 : clkpos[8];
assign Fclk = instFlag;
assign padclkpos = VDD;
assign padclkneg = VSS;
assign not_in1 = nand_in1;
assign not_in2 = nand_in2;
// Tri-state logic for inout
assign io  = (io_en) ? in : 1'bz;

// DUT
mips_driver_pad dut (
    .MemWrite(MemWrite),
    .OP3_spy(OP3_spy),
    .OP5_spy(OP5_spy),
    .PC(PC[15:0]),
    .nand_out(nand_out),
    .not_out1(not_out1),
    .not_out2(not_out2),

    .io(io[15:0]),
    .Fclk(Fclk),
    .Reset(Reset),
    .SRAM_clkneg(SRAM_clkneg),
    .SRAM_clkpos(SRAM_clkpos),
    .Tclk(Tclk),
    .VDD(VDD),
    .VSS(VSS),
    .clkneg(clkneg[1:10]),
    .clkpos(clkpos[1:10]),
    .nand_in1(nand_in1),
    .nand_in2(nand_in2),
    .not_in1(not_in1),
    .not_in2(not_in2),
    .padclkneg(padclkneg),
    .padclkpos(padclkpos)
);

// Clock generation: 10ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// VCD dump
initial begin
    $dumpfile("mips.vcd");
    $dumpvars(0, mips_tb);
end

// Convenience: count instruction cycles
integer instr_cycle;
initial instr_cycle = 0;
always @(posedge Fclk) begin
    instr_cycle <= instr_cycle + 1;
end

// Helper task: peek into SRAM (register file) contents
// Hierarchy: dut.I0.I24.array.sram[i]
task display_sram;
    input string label;
    integer j;
    begin
        $display("\n============================================");
        $display(" SRAM Register File Peek: %s", label);
        $display(" Time = %0t ns", $time);
        $display("============================================");
        for (j = 0; j < 32; j = j + 1) begin
            if (dut.I0.I24.array.sram[j] !== 16'h0000)
                $display("  Reg[%2d] = %h (%0d)", j, dut.I0.I24.array.sram[j], dut.I0.I24.array.sram[j]);
        end
        $display("  (registers with value 0 omitted)");
        $display("============================================\n");
    end
endtask

// Helper task: display full SRAM dump
task display_sram_full;
    input string label;
    integer j;
    begin
        $display("\n============================================");
        $display(" SRAM Full Dump: %s", label);
        $display(" Time = %0t ns", $time);
        $display("============================================");
        for (j = 0; j < 32; j = j + 1) begin
            $display("  Reg[%2d] = %b (%h)", j, dut.I0.I24.array.sram[j], dut.I0.I24.array.sram[j]);
        end
        $display("============================================\n");
    end
endtask

// Helper task: display behavioral InstrDataReg state
task display_instr_state;
    begin
        $display("[%0t] InstrDataReg State: PC=%0d, phase=%b, instr_reg=%h",
            $time,
            dut.I0.I3.pc,
            dut.I0.I3.phase,
            dut.I0.I3.instr_reg);
        $display("  -> out = %h, a3 = %0d, io = %h, out_wd = %h",
            dut.I0.I3.out,
            dut.I0.I3.a3,
            dut.I0.I3.io,
            dut.I0.I3.out_wd);
    end
endtask

// Monitor key signals on each instruction cycle
always @(posedge Fclk) begin
    $display("-----------------------------------------------");
    $display("[%0t] Instruction Cycle #%0d", $time, instr_cycle);
    $display("  PC = %h, MemWrite = %b", PC, MemWrite);
    $display("  OP5_spy = %b, OP3_spy = %b", OP5_spy, OP3_spy);
    $display("  IRWr0 = %b, IRWr1 = %b", dut.I0.IRWr0, dut.I0.IRWr1);
    $display("  InstrReg PC = %0d, instr = %h",
        dut.I0.I3.pc, dut.I0.I3.instr_reg);
end

// Main test sequence
integer k;
initial begin
    // Initialize inputs
    Reset = 1;
    in = 16'b0;
    io_en = 0;
    nand_in1 = 0;
    nand_in2 = 0;
    reset = 1;

    $display("========================================");
    $display(" MIPS Processor Testbench");
    $display(" Preloaded Instructions:");
    $display("   [0] ADDI $1, $0, 5");
    $display("   [1] ADDI $2, $0, 3");
    $display("   [2] ADDI $3, $0, 10");
    $display("   [3] ADDI $4, $0, 15");
    $display("   [4] ADDI $5, $0, 7");
    $display("   [5] ADDI $6, $0, 1");
    $display("========================================\n");

    // Pre-test: Full SRAM dump (should be all zeros)
    #1;
    display_sram_full("BEFORE RESET");

    // Release Bennett clock reset first, keep DUT Reset high
    // so the FSM flip-flops latch the reset state on the first Fclk pulse.
    // With WIDTH=11, one Bennett cycle ~220ns. Need Reset=1 when Fclk fires.
    #50;
    reset = 0;  // Start Bennett clock
    $display("[%0t] Bennett clock reset released", $time);

    // Wait for 2 full Bennett cycles so Reset=1 is captured by Fclk
    @(posedge Fclk);
    @(negedge Fclk);
    $display("[%0t] First Fclk pulse captured with Reset=1", $time);
    @(posedge Fclk);
    @(negedge Fclk);
    $display("[%0t] Second Fclk pulse captured with Reset=1", $time);

    // Now release DUT Reset
    Reset = 0;
    $display("[%0t] DUT Reset released", $time);

    // DEBUG: trace clkpos and key signals for first ~500ns after reset
    for (k = 0; k < 50; k = k + 1) begin
        #10;
        $display("[%0t] clkpos=%b clkneg=%b Fclk=%b Tclk=%b Mclk=%b instFlag=%b",
            $time, clkpos, clkneg, Fclk, Tclk, Mclk, instFlag);
        $display("       IRWr0=%b IRWr1=%b Reset=%b PC=%h MemWrite=%b",
            dut.I0.IRWr0, dut.I0.IRWr1, Reset, PC, MemWrite);
    end

    // Peek at SRAM periodically
    #2000;
    display_sram("After initial run");
    display_instr_state();

    #5000;
    display_sram("After more time");
    display_instr_state();

    #5000;
    // Final SRAM dump
    display_sram_full("FINAL STATE");
    display_instr_state();

    $display("\n========================================");
    $display(" Simulation Complete");
    $display(" Total instruction cycles: %0d", instr_cycle);
    $display("========================================");

    $finish;
end

endmodule
