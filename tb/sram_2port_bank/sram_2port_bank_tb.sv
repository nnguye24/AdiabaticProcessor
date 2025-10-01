`include "../../bennettclock/bennettClock.sv"


module sram_bank_tb();
supply1 vdd;
supply0 vss;

localparam WIDTH = 5;

// Clock Related Signal
reg clk;

wire [WIDTH-1:0] clkneg;
wire [WIDTH-1:0] clkpos;
reg Mclk;
wire instFlag;

bennett_clock #(
    .PHASES(WIDTH)
) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);

assign clkneg = ~clkpos;


// SRAM bank related signals
// Wires for outputs
wire [15:0] outA, outB;

// Regs for inputs
reg [4:0] Addr_A, Addr_B;
reg ReadEn, RegWrtBar, WriteEn;
reg [15:0] in;
wire srclkneg, srclkpos;

assign srclkpos = instFlag;
assign srclkneg = ~instFlag;

sram_2port_bank dut (
    outA[15], outA[14], outA[13], outA[12], outA[11], outA[10], outA[9], outA[8], outA[7], outA[6], outA[5], outA[4], outA[3], outA[2], outA[1], outA[0],
    outB[15], outB[14], outB[13], outB[12], outB[11], outB[10], outB[9], outB[8], outB[7], outB[6], outB[5], outB[4], outB[3], outB[2], outB[1], outB[0],
    Addr_A[4], Addr_A[3], Addr_A[2], Addr_A[1], Addr_A[0],
    Addr_B[4], Addr_B[3], Addr_B[2], Addr_B[1], Addr_B[0],
    ReadEn, RegWrtBar, WriteEn,
    clkneg[0], clkneg[1], clkneg[2], clkneg[3], clkneg[4],
    clkpos[0], clkpos[1], clkpos[2], clkpos[3], clkpos[4],
    in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0],
    srclkneg, srclkpos, vdd, vss
);


// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("sram_bank.vcd");
    $dumpvars(0, sram_bank_tb);
end

initial begin\
    reset = 1;
  	#10
  	reset = 0;
    // Initialize inputs to zero
    Addr_A = 5'b00000;
    Addr_B = 5'b00000;
    ReadEn = 0;
    RegWrtBar = 0; 
    WriteEn = 0;
    in = 16'h0000;
    #4000
    $finish;
end



endmodule