`include "../../bennettclock/bennettClock.sv"
`include "../../bennettclock/bennettClock_square.sv"
`include "../../bennettclock/bennettClock_noX.sv"


module mips_tb();
supply1 VDD;
supply0 VSS;

localparam WIDTH = 10;

// Clock signals
logic SRAM_clkneg, SRAM_clkpos;
logic [0:1] padclkneg, padclkpos;
logic clk, reset;
// [WIDTH-1:0] matches the [9:0] output of bennett_clock_noX and CU_tb convention.
logic [WIDTH-1:0] clkneg, clkpos;
logic Mclk, instFlag;

// DUT IO
logic Reset;
tri [15:0] io;
logic nand_in1, nand_in2;
logic not_in1, not_in2;

// DUT outputs
logic [15:0] PC;
logic MemWrite;
logic nand_out;
logic not_out1, not_out2;
logic OP3_spy, OP5_spy;

wire Fclk = instFlag;
wire Tclk = (clkpos[8] === 1'bX) ? 1'b0 : clkpos[8];

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
assign padclkpos = {VDD, VDD};  // both bits high so pad driver inv_fo64/pad_driver_IO work
assign padclkneg = {VSS, VSS};  // both bits low
assign not_in1 = nand_in1;
assign not_in2 = nand_in2;


// The testbench acts as the external instruction memory.
// MemWrite=0: processor reads — we drive io with the appropriate instruction word.
// MemWrite=1: processor writes — io driven by chip, testbench tristates.
//
// IRWr0=1 in Fetch1 state: lower instruction half captured at posedge Tclk.
// IRWr1=1 in Fetch2 state: upper instruction half captured at posedge Tclk.
// Drive io = upper half when IRWr1 active, lower half otherwise (in read mode).
//
// Memory is 16-bit word addressed. PC increments by 2 each fetch half
// (byte addressed), so the array index is pc_internal >> 1.
// =========================================================================

reg [15:0] imem [0:63];
wire [15:0] pc_internal = dut.I0.I7.out;

initial begin : init_imem
    integer j;
    for (j = 0; j < 64; j = j + 1) imem[j] = 16'h0000;

    // Instruction 0: ADDI $1, $0, 5   (0x2001_0005)
    imem[0] = 16'h0005;   // lower half  (PC = 0)
    imem[1] = 16'h2001;   // upper half  (PC = 2)

    // Instruction 1: ADDI $2, $0, 3   (0x2002_0003)
    imem[2] = 16'h0003;   // lower half  (PC = 4)
    imem[3] = 16'h2002;   // upper half  (PC = 6)

    // Instruction 2: ADDI $3, $0, 10  (0x2003_000A)
    imem[4] = 16'h000A;   // lower half  (PC = 8)
    imem[5] = 16'h2003;   // upper half  (PC = 10)
end

// Continuously drive io in read mode (MemWrite != 1).
// IRWr1 active (Fetch2 state): drive upper instruction half.
// Otherwise: drive lower instruction half (active during Fetch1 capture,
// and harmless during Execute/Write states where IRWr0=IRWr1=0).
wire [5:0] pc_word = (pc_internal !== 16'bx) ? (pc_internal >> 1) : 6'b0;
assign io = (dut.MemWrite_chip !== 1'b1) ?
                ((dut.I0.IRWr1 === 1'b1) ? imem[pc_word + 1] : imem[pc_word]) :
                16'bz;


// Bennett clkpos in this TB is [9:0] (matches bennett_clock_square.clkp).
// mips_driver_pad uses [1:10]; bit 1 is the MSB, so the port connection
//   .clkpos({clkpos[0], ..., clkpos[9]})
// maps TB clkpos[0] -> chip clkpos[1], TB clkpos[1] -> chip clkpos[2], ... TB clkpos[9] -> chip clkpos[10].
// ALU cond_inv16b uses chip clkpos[1]/clkneg[1] — compare waveforms to mips_tb.clkpos[0], not clkpos[1].

// =========================================================================
// DUT
// =========================================================================
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
    .clkneg({clkneg[0],clkneg[1],clkneg[2],clkneg[3],clkneg[4],clkneg[5],clkneg[6],clkneg[7],clkneg[8],clkneg[9]}),
    .clkpos({clkpos[0],clkpos[1],clkpos[2],clkpos[3],clkpos[4],clkpos[5],clkpos[6],clkpos[7],clkpos[8],clkpos[9]}),
    .nand_in1(nand_in1),
    .nand_in2(nand_in2),
    .not_in1(not_in1),
    .not_in2(not_in2),
    .padclkneg(padclkneg),
    .padclkpos(padclkpos)
);

// =========================================================================
// Clock generation: 10 ns period
// =========================================================================
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// VCD dump
initial begin
    $dumpfile("mips.vcd");
    $dumpvars(0, mips_tb);
end


// PC register flops have no async reset in netlist; iverilog needs a constant
// hierarchical index, so one initial per bit (via generate).
genvar gv_pc;
generate
    for (gv_pc = 0; gv_pc < 16; gv_pc = gv_pc + 1) begin : g_pc_init
        initial begin
            dut.I0.I7.I0.I0[gv_pc].node = 1'b0;
            dut.I0.I7.I0.I0[gv_pc].Out = 1'b0;
        end
    end
endgenerate


initial begin : init_structural
    integer k;
    // --- SRAM register file ---
    for (k = 0; k < 32; k = k + 1)
        dut.I0.I24.array.sram[k] = 16'h0000;
end

// =========================================================================
// Debug helpers
// =========================================================================
integer instr_cycle;
initial instr_cycle = 0;
always @(posedge Fclk) instr_cycle <= instr_cycle + 1;

// FSM state vector 
wire [7:0] fsm_state = {
    dut.I0.I5.S[7], dut.I0.I5.S[6],
    dut.I0.I5.S[5], dut.I0.I5.S[4],
    dut.I0.I5.S[3], dut.I0.I5.S[2],
    dut.I0.I5.S[1], dut.I0.I5.S[0]
};

// Instruction register halves 
wire [15:0] instr_lo = dut.I0.I3.out[15:0];
wire [15:0] instr_hi = dut.I0.I3.out[31:16];

// Nout (next-state) vector
wire [7:0] nout_vec = {
    dut.I0.I5.Nout[7], dut.I0.I5.Nout[6],
    dut.I0.I5.Nout[5], dut.I0.I5.Nout[4],
    dut.I0.I5.Nout[3], dut.I0.I5.Nout[2],
    dut.I0.I5.Nout[1], dut.I0.I5.Nout[0]
};

// Monitor on each Fclk edge
always @(posedge Fclk) begin
    #1;
    $display("-----------------------------------------------");
    $display("[%0t] Cycle #%0d | FSM=%b (%0d) | Nout=%b | PC_int=%0d | PC_pad=%h",
        $time, instr_cycle, fsm_state, fsm_state, nout_vec, pc_internal, PC);
    $display("  MemWrite=%b MemWchip=%b out_MW=%b | IRWr0=%b IRWr1=%b | io=%h",
        MemWrite, dut.MemWrite_chip, dut.I0.I5.out_MemWrite,
        dut.I0.IRWr0, dut.I0.IRWr1, io);
    $display("  Instr: hi=%h lo=%h  (full=%h)",
        instr_hi, instr_lo, {instr_hi, instr_lo});
    $display("  data_in(mips)=%h  io_chip=%h",
        dut.I0.data_in, dut.io_chip);
    $display("  SRAM outA=%h outB=%h | ALU a=%h b=%h a_reg=%h b_reg=%h",
        dut.I0.I24.outA, dut.I0.I24.outB,
        dut.I0.I4.a, dut.I0.I4.b,
        dut.I0.I4.a_regout, dut.I0.I4.b_regout);
    $display("  out_fetch=%b out_fetch1=%b out_Decode=%b out_zeros=%b",
        dut.I0.I5.out_fetch,
        dut.I0.I5.out_fetch1,
        dut.I0.I5.out_Decode,
        dut.I0.I5.out_zeros);
    $display("  WriteEn=%b RegWriteBar=%b ReadEn=%b | a3=%b (%0d) | out_wd=%h | alu_out=%h",
        dut.I0.WriteEn, dut.I0.RegWriteBar, dut.I0.ReadEn,
        dut.I0.a3, dut.I0.a3, dut.I0.out_wd, dut.I0.alu_out);
    $display("  SRAM_clkpos=%b srclkpos=%b | Mclk=%b clkpos[6]=%b",
        SRAM_clkpos, dut.I0.srclkpos, Mclk, clkpos[6]);
    $display("  ALU ctrl0=%b ctrl1=%b cin=%b | a_muxout=%h b_muxout=%h a_inv=%h b_inv=%h adder_out=%h alu_muxout=%h",
        dut.I0.I4.ALU_Control0, dut.I0.I4.ALU_Control1, dut.I0.I4.Adder_Cin,
        dut.I0.I4.a_muxout, dut.I0.I4.b_muxout,
        dut.I0.I4.a_invout, dut.I0.I4.b_invout,
        dut.I0.I4.adder_out, dut.I0.I4.alu_muxout);
    $display("  Bmux0=%b Bmux1=%b Amux=%b SUB=%b STL=%b a_reg=%h b_reg=%h",
        dut.I0.I4.B_mux0, dut.I0.I4.B_mux1, dut.I0.I4.A_mux,
        dut.I0.I4.SUB, dut.I0.I4.STL,
        dut.I0.I4.a_regout, dut.I0.I4.b_regout);
end

// SRAM dump (non-zero registers only)
task display_sram;
    input string label;
    integer j;
    begin
        $display("\n============================================");
        $display(" SRAM Register File: %s (Time=%0t)", label, $time);
        $display("============================================");
        for (j = 0; j < 32; j = j + 1)
            if (dut.I0.I24.array.sram[j] !== 16'h0000)
                $display("  Reg[%2d] = %h (%0d)", j,
                    dut.I0.I24.array.sram[j],
                    dut.I0.I24.array.sram[j]);
        $display("  (zero-valued registers omitted)");
        $display("============================================\n");
    end
endtask

// Full SRAM dump
task display_sram_full;
    input string label;
    integer j;
    begin
        $display("\n============================================");
        $display(" SRAM Full Dump: %s (Time=%0t)", label, $time);
        $display("============================================");
        for (j = 0; j < 32; j = j + 1)
            $display("  Reg[%2d] = %b (%h)", j,
                dut.I0.I24.array.sram[j],
                dut.I0.I24.array.sram[j]);
        $display("============================================\n");
    end
endtask

// =========================================================================
// Main test sequence
// =========================================================================
initial begin
    $display("========================================");
    $display(" MIPS Structural Testbench");
    $display(" Instructions in testbench memory:");
    $display("   [0] 20010005  ADDI $1, $0, 5");
    $display("   [1] 20020003  ADDI $2, $0, 3");
    $display("   [2] 2003000A  ADDI $3, $0, 10");
    $display("========================================\n");

    // Initialise
    Reset    = 1;
    nand_in1 = 0;
    nand_in2 = 0;
    reset    = 1;          // hold Bennett clock in reset

    #1;
    $display("[%0t] DEBUG INIT: S=%b (%0d) | IRWr0=%b IRWr1=%b",
        $time, fsm_state, fsm_state, dut.I0.IRWr0, dut.I0.IRWr1);
    $display("[%0t] DEBUG INIT: out_MemWrite=%b MemWrite_chip=%b",
        $time, dut.I0.I5.out_MemWrite, dut.MemWrite_chip);

    // ---- Release Bennett clock, keep DUT Reset high ----
    #50;
    reset = 0;
    $display("[%0t] Bennett clock started", $time);

    // Wait 2 Fclk pulses with Reset=1 to flush FSM through reset path.
    @(posedge Fclk); @(negedge Fclk);
    $display("[%0t] 1st Fclk with Reset=1", $time);
    @(posedge Fclk); @(negedge Fclk);
    $display("[%0t] 2nd Fclk with Reset=1", $time);

    // ---- Release DUT Reset — processor starts executing ----
    Reset = 0;
    $display("[%0t] DUT Reset released", $time);

    // Run enough cycles for the 3 ADDI instructions.
    // ADDI path: Fetch1→Fetch2→Decode→134→176→Fetch1 = 5 states per instruction.
    // 3 instructions × 5 states = 15; add margin: run 60 cycles.
    repeat (60) @(posedge Fclk);

    #1;
    display_sram("AFTER PROGRAM");
    display_sram_full("FULL DUMP");

    $display("\n========================================");
    $display(" Expected: Reg[1]=0005, Reg[2]=0003, Reg[3]=000A");
    $display(" Simulation complete — %0d Fclk cycles", instr_cycle);
    $display("========================================");

    $finish;
end

endmodule
