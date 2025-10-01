`include "../../bennettclock/bennettClock.sv"

module sram_tb();
supply1 vdd;
supply0 vss;

localparam WIDTH = 5;

// Clock Related Signals
reg clk;
reg reset;
wire [WIDTH-1:0] clkneg;
wire [WIDTH-1:0] clkpos;
wire Mclk;
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

// Wires for outputs
tri bitA, bitnotA, bitnotB;


// Regs for inputs
reg PEn, PEnnot;
wire srclkpos, srclkneg;
reg wordA, wordB;
reg bitA_in;
reg bitB_in;

assign srclkpos = instFlag;
assign srclkneg = ~instFlag;

assign bitA = (PEn) ? bitA_in : 1'bZ;
assign bitnotA = ~bitA;
assign bitB = (~PEn) ? bitB_in : 1'bZ;
sram1b_2port dut( bitA, bitnotA, bitnotB, PEn, PEnnot, srclkneg,
     srclkpos, vdd, vss, wordA, wordB );


// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("sram.vcd");
    $dumpvars(0, sram_tb);
end

initial begin
    reset = 1;
  	#10
  	reset = 0;
    // Initialize inputs to zero
    bitA_in = 0;
    bitB_in = 0;
    PEn = 0;
    PEnnot = ~PEn;
    wordA = 0;
    wordB = 0;
    #400
    $finish;
end



endmodule