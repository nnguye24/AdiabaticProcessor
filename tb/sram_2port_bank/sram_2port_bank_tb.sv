`include "../../bennettclock/bennettClock.sv"
// maybe use the old bennett clock?
`include "../../bennettclock/bennettClock_square.sv"

module sram_bank_tb();
supply1 vdd;
supply0 vss;

localparam WIDTH = 10;

// Clock Related Signal
reg clk;
reg reset;
wire logic [WIDTH-1:0] clkneg;
wire logic [WIDTH-1:0] clkpos;
wire Mclk;
wire instFlag;

// for bennett clock input tester
wire [4:0] clkpos_out;
wire [4:0] clkneg_out;

bennett_clock_square #(
    .WIDTH(WIDTH)   // PHASES(new), WIDTH(square)
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
reg ReadEn, WriteEn;    // WriteEn comes phase 9, ReadEn comes phase 7
// maybe could d an assign for both enables
reg RegWrtBar; // comes phase 7
reg [15:0] in;
wire srclkneg, srclkpos;

// to test submodule functionality
wire [1:0] inv_out;
wire word1, word2;
wire PenOut0, PenOut0Bar, PenOut1, PenOut1Bar;
deviceTester tester(
    .in(in[1]),
    .out(inv_out), 
    .addr(Addr_A),
    .word1(word1),
    .word2(word2),
    .PenOut0(PenOut0),
    .PenOut0Bar(PenOut0Bar),
    .PenOut1(PenOut1),
    .PenOut1Bar(PenOut1Bar),
    .ReadEn(ReadEn),
    .WriteEn(WriteEn),
    .RegWrtBar(RegWrtBar),
    .clkneg_1_(clkneg[4]),
    .clkneg_2_(clkneg[5]),  
    .clkneg_3_(clkneg[6]),
    .clkneg_4_(clkneg[7]),
    .clkneg_5_(clkneg[9]),
    .clkpos_1_(clkpos[4]),
    .clkpos_2_(clkpos[5]),
    .clkpos_3_(clkpos[6]),
    .clkpos_4_(clkpos[7]),
    .clkpos_5_(clkpos[9]),
    .clkpos_out(clkpos_out),
    .clkneg_out(clkneg_out),
    .vdd(vdd),
    .vss(vss)
);

sram_2port_bank dut (
    outA[15], outA[14], outA[13], outA[12], outA[11], outA[10], outA[9], outA[8], outA[7], outA[6], outA[5], outA[4], outA[3], outA[2], outA[1], outA[0],
    outB[15], outB[14], outB[13], outB[12], outB[11], outB[10], outB[9], outB[8], outB[7], outB[6], outB[5], outB[4], outB[3], outB[2], outB[1], outB[0],
    Addr_A[4], Addr_A[3], Addr_A[2], Addr_A[1], Addr_A[0],  //a3
    Addr_B[4], Addr_B[3], Addr_B[2], Addr_B[1], Addr_B[0],  // instruction
    ReadEn, RegWrtBar, WriteEn, // control signals
    clkneg[4], clkneg[5], clkneg[6], clkneg[7], clkneg[9], //5-8, then 10
    clkpos[4], clkpos[5], clkpos[6], clkpos[7], clkpos[9], // inside the definition they go 1-5
    in[15], in[14], in[13], in[12], in[11], in[10], in[9], in[8], in[7], in[6], in[5], in[4], in[3], in[2], in[1], in[0],
    srclkneg, srclkpos, vdd, vss
);

assign srclkneg = (Mclk ^ clkpos[6]) & clkpos[6];
assign srclkpos = ~srclkneg;


// assign RegWrtBar = clkneg[6];   // change this. 0 goes to 1, only when writing.

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("sram_bank.vcd");
    $dumpvars(0, sram_bank_tb);
end

initial begin
    reset = 1;
    #10;
    reset = 0;
    ReadEn = 1;
    WriteEn = 0;
    RegWrtBar = 0;
    #10
    ReadEn = 0;
    // Write operation
    @(posedge clkpos[2]);
    Addr_A = 5'b11111;       
    Addr_B = 5'b11111;
    @(posedge clkpos[4]);
    in = 16'b1010101010101010;
    @(posedge clkpos[6]);
    RegWrtBar = 1;
    @(posedge clkpos[8]);
    WriteEn = 1;
    @(posedge clkpos[9]);
    WriteEn = 0;
    @(negedge clkpos[6]);
    RegWrtBar = 0;

    // Read operation
    @(posedge clkpos[2]);
    Addr_A = 5'b11111;       
    Addr_B = 5'b11111;
    @(posedge clkpos[6]);
    ReadEn = 1;
    @(posedge clkpos[8]);
    ReadEn = 0;

    @(posedge clkpos[2]);
    Addr_A = 5'b00011;
    @(posedge clkpos[6]);
    ReadEn = 1;
    @(posedge clkpos[8]);
    ReadEn = 0;
    
    #400;
    $finish;
end



endmodule