`include "../../bennettclock/bennettClock.sv"


module sram_decoder_tb();

// supply
supply1 vdd;
supply0 vss;

// Clock Related Signal
reg clk;
reg reset;
wire [9:0] clkpos;
wire [9:0] clkneg;
reg Mclk;
wire instFlag;

bennett_clock #(.PHASES(10)) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);

assign clkneg = ~clkpos;

// Inputs
reg ReadEn, WriteEn;
reg [4:0] inA;
wire inABar;
wire RegWrtBar;
// Outputs
wire PenOut0, PenOut0Bar, PenOut1, PenOut1Bar;
wire WordA0, WordA1;

sram_decoderA_GLS2 dut (
    .PenOut0(PenOut0),
    .PenOut0Bar(PenOut0Bar),
    .PenOut1(PenOut1),
    .PenOut1Bar(PenOut1Bar),
    .WordA0(WordA0),
    .WordA1(WordA1),
    .ReadEn(ReadEn),
    .RegWrtBar(RegWrtBar),
    .WriteEn(WriteEn),
    .clkneg(clkneg[4]),
    .clkneg2(clkneg[5]),
    .clkneg3(clkneg[6]),
    .clkpos(clkpos[4]),

    .clkpos2(clkpos[5]),
    .clkpos3(clkpos[6]),
    .in0A(inA[0]),
    .in0ABar(in0ABar),
    .in1A(inA[1]),
    .in2A(inA[2]),
    .in3A(inA[3]),
    .in4A(inA[4]),
    .vdd(vdd),
    .vss(vss)
);
assign in0ABar = ~inA[0];
assign RegWrtBar = clkneg[6];

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $dumpfile("sram_decoder.vcd");
    $dumpvars(0, sram_decoder_tb);
end

initial begin
    reset = 1;
    #10;
    reset = 0;

    // Initialize inputs
    ReadEn = 0;
    WriteEn = 0;
    inA = 5'b00000;
    // we just want to observe the penout and word and if the bennett clocks come in

    // Write 
    @(posedge clkpos[2]);
    inA = 5'b00001; // Address 1
    @(posedge clkpos[8]);
    WriteEn = 1;
    @(posedge clkpos[9]);
    WriteEn = 0;


    // Write 
    @(posedge clkpos[2]);
    inA = 5'b11111; 
    @(posedge clkpos[8]);
    WriteEn = 1;
    @(posedge clkpos[9]);
    WriteEn = 0;

    // Read
    @(posedge clkpos[2]);
    inA = 5'b00011; // Address 1
    @(posedge clkpos[6]);
    ReadEn = 1;
    @(posedge clkpos[8]);
    ReadEn = 0; 
    #400;
    $finish;
end

endmodule
