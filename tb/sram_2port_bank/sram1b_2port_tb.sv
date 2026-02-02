`include "../../bennettclock/bennettClock.sv"

module sram_tb();
supply1 vdd;
supply0 vss;

localparam WIDTH = 10;

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
reg PEn, PEnnot;    // enables
reg srclkpos, srclkneg; // SRAM clock, dependent on a phase of bennett clock
reg wordA, wordB;   // write lines

// register to hold inputs
reg bitA_in;
reg bitB_in;

// Tristate for inouts
assign bitA = (PEn) ? bitA_in : 1'bZ;
assign bitnotA = ~bitA;
assign bitnotB = (~PEn) ? bitB_in : 1'bZ;


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

// SRAM clock timing, probably need to change the index
always @(posedge clkpos[6]) begin
    srclkpos <= 1'b0;
    srclkneg <= 1'b1;
    #20
    wordA <= 1'b1;
    wordB <= 1'b1;
end

always @(posedge Mclk) begin
    srclkpos <= 1'b1;
    srclkneg <= 1'b0;
    #20
    wordA <= 1'b0;
    wordB <= 1'b0;
end


always @(*) begin
    PEnnot = ~PEn;
end

/*
Notes for simulation:
- PEn is high for write. Low for read.
- Word lines are used to access the cell. 
- bitA_in and bitB_in are the data inputs for writing.
- bitA and bitB are high impedance when not writing, therefore can be flipped by the cell
*/

initial begin
    reset = 1;
  	#10
  	reset = 0;
    // Initialize inputs to zero
    srclkpos = 1;
    srclkneg = 0;
    bitA_in = 0;
    bitB_in = 0;
    PEn = 0;
    wordA = 0;
    wordB = 0;
    @(posedge instFlag);
    // FIX pen

    
    // Write 1 to bitA
    PEn = 1;
    // at this point SRAM clock should be low
    bitA_in = 1;
    @(posedge instFlag);
    PEn = 0;
    @(posedge instFlag);
    @(posedge instFlag);

    $finish;
end



endmodule