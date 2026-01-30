`include "../../bennettclock/bennettClock.sv"
// maybe use the old bennett clock?
`include "../../bennettclock/bennettClock_square.sv"
`include "../../bennettclock/bennettClock_noX.sv"

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

/*
bennett_clock_noX #(    // no X values Bennett Clock
        .WIDTH(WIDTH)
    ) bennett (
        .clk(clk),
        .reset(reset),
      	.instFlag(instFlag),
      	.Mclk(Mclk),
        .clkn(clkneg),
        .clkp(clkpos)
    );
*/
// for the square generator
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
// wire [1:0] inv_out;
// wire word1, word2;
// wire PenOut0, PenOut0Bar, PenOut1, PenOut1Bar;
// deviceTester tester(
//     .in(in[1]),
//     .out(inv_out), 
//     .addr(Addr_A),
//     .word1(word1),
//     .word2(word2),
//     .PenOut0(PenOut0),
//     .PenOut0Bar(PenOut0Bar),
//     .PenOut1(PenOut1),
//     .PenOut1Bar(PenOut1Bar),
//     .ReadEn(ReadEn),
//     .WriteEn(WriteEn),
//     .RegWrtBar(RegWrtBar),
//     .clkneg_1_(clkneg[4]),
//     .clkneg_2_(clkneg[5]),  
//     .clkneg_3_(clkneg[6]),
//     .clkneg_4_(clkneg[7]),
//     .clkneg_5_(clkneg[9]),
//     .clkpos_1_(clkpos[4]),
//     .clkpos_2_(clkpos[5]),
//     .clkpos_3_(clkpos[6]),
//     .clkpos_4_(clkpos[7]),
//     .clkpos_5_(clkpos[9]),
//     .clkpos_out(clkpos_out),
//     .clkneg_out(clkneg_out),
//     .vdd(vdd),
//     .vss(vss)
// );

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


// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("sram_bank.vcd");
    $dumpvars(0, sram_bank_tb);
end


 reg [5:0] i;

initial begin
    reset = 1;
    #10;
    reset = 0;
    ReadEn = 1;
    WriteEn = 0;
    RegWrtBar = 0;
    #10
    ReadEn = 0;

    // PRE TEST PEEK
    $display("Pre Test peek into SRAM cells");
    for ( i = 0; i < 32; i = i + 1) begin
        $display("SRAM at address: %d --- Data: %b", i, dut.array.sram[i]);
    end
    $display("------ End of peek ------\n");


    // Write operation
    @(posedge clkpos[2]);   // address arrives in ph3, bars are generated in ph4
    $display("At posedge clkpos[2]: Starting write operation");
    Addr_A = 5'b00001;       
    Addr_B = 5'b11111;
    $display("After PH2, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);

    // $display("Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA,dut.array.wordB);
    $display("Addr_A: %b, Addr_B: %b\n", Addr_A, Addr_B);

    @(posedge clkpos[4]);   // inputs in ph5
    $display("At posedge clkpos[4]: Setting input data");
    in = 16'b1010101010101010;
    $display("Input: %b", in);
    $display("After PH4, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);

    @(posedge clkpos[6]);
    $display("At posedge clkpos[6]: Setting RegWrtBar");
    RegWrtBar = 1;
    $display("After PH6, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);
    
    @(posedge clkpos[8]);
    $display("At posedge clkpos[8]: Enabling WriteEn");
    WriteEn = 1;
    // found something, I put the addresses as non zero but the decoders will output word line as something else?
    $display("After PH8, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);
    $display("WriteEn: %b", WriteEn);

    @(posedge clkpos[9]);
    $display("At posedge clkpos[9]: Disabling WriteEn");
    WriteEn = 0;
    $display("After PH9, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);

    @(negedge clkpos[6]);
    $display("At negedge clkpos[6]: Resetting RegWrtBar");
    RegWrtBar = 0;


    // Read operation
    @(posedge clkpos[2]);
    
    $display("At posedge clkpos[2]: Starting read operation");
    
    Addr_A = 5'b00001; 
    Addr_B = 5'b00000;
    $display("Addr_A: %b, Addr_B: %b\n", Addr_A, Addr_B);

    @(posedge clkpos[4]);
    $display("=====READ OPERATION=====");
    $display("At posedge clkpos[4]: Setting input data for read");
    in = 16'h0100;

    @(posedge clkpos[6]);
    $display("At posedge clkpos[6]: Enabling ReadEn");
    ReadEn = 1;
    $display("After PH8, Word Line inputs to the array: \n wordA: %b\n wordB: %b\n",dut.array.wordA, dut.array.wordB);
    
    
    @(posedge clkpos[8]);
    $display("At posedge clkpos[8]: Disabling ReadEn");
    ReadEn = 0;

    @(posedge clkpos[9]);

    @(negedge clkpos[0]);
    $display("OUTPUT CHECK");
    $display("outA: %b \noutB: %b\n", outA, outB);

    $display("Post Test peek into SRAM cells");
    for ( i = 0; i < 32; i = i + 1) begin
        $display("SRAM at address: %d --- Data: %b", i, dut.array.sram[i]);
    end
    $display("------ End of peek ------\n");

    $finish;
end



endmodule