`include "../../bennettclock/bennettClock.sv"
`include "../../bennettclock/bennettClock_square.sv"
`include "../../bennettclock/bennettClock_noX.sv"

module CU_tb();
// Inputs
wire [7:0] Nout;
wire [7:0] S;
reg F0, F1, F2, F3, OP1, OP2, OP3, OP5, Reset, Zero_DetectBar;
// Clock Related stuff
wire [9:0] clkneg;
wire [9:0] clkpos;
wire Tclk;
wire Fclk;
reg Mclk;
wire instFlag;

// main clock
reg clk;
reg reset;

supply1 vdd;
supply0 vss;

localparam WIDTH = 10;

// Outputs
wire ReadEn, WriteEn, out_ALUCont0, out_ALUCont1, out_ALUCont2, out_ALUSrcA,
    out_ALUSrcB0, out_ALUSrcB1, out_Addi, out_Branch_PCSrc0, out_Decode, out_IRWr0,
    out_IRWr1, out_IorD, out_LB, out_MemWrite, out_Memadr, out_MemtoReg, out_PCSrc1,
    out_PCWrite, out_PC_En, out_PC_EnBar, out_RegDst, out_RegWriteBar, out_Rtype,
    out_S3, out_S4, out_S5, out_S6, out_SB, out_STL, out_SUB, out_fetch, out_fetch1,
    out_lbrd, out_other4, out_zeros;

bennett_clock_square #(.WIDTH(WIDTH)) bennett (
    .clk(clk), .reset(reset), .clkp(clkpos), .Mclk(Mclk), .instFlag(instFlag)
);
/*
bennett_clock #(
    .PHASES(WIDTH)
) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);
*/

// Instantiate the Control Unit
control_unit dut (Nout[0], Nout[1], Nout[2], Nout[3], Nout[4], Nout[5], Nout[6], Nout[7],
    ReadEn, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7], WriteEn, out_ALUCont0, out_ALUCont1,
    out_ALUCont2, out_ALUSrcA, out_ALUSrcB0, out_ALUSrcB1, out_Addi, out_Branch_PCSrc0, out_Decode,
    out_IRWr0, out_IRWr1, out_IorD, out_LB, out_MemWrite, out_Memadr, out_MemtoReg, out_PCSrc1,
    out_PCWrite, out_PC_En, out_PC_EnBar, out_RegDst, out_RegWriteBar, out_Rtype, out_S3, out_S4, 
    out_S5, out_S6, out_SB, out_STL, out_SUB, out_fetch, out_fetch1, out_lbrd, out_other4, out_zeros,
    F0, F1, F2, F3, Fclk, OP1, OP2, OP3, OP5, Reset, Tclk, Zero_DetectBar, 
    clkneg[0], clkneg[1], clkneg[2], clkneg[3], clkneg[4], clkneg[5], clkneg[6], clkneg[7], clkneg[8], clkneg[9],
    clkpos[0], clkpos[1], clkpos[2], clkpos[3], clkpos[4], clkpos[5], clkpos[6], clkpos[7], clkpos[8], clkpos[9], 
    vdd, vss);



reg [3:0] F;	// array for F, one assignment
reg [3:0] OP; // array for OP code, one assignment

assign clkneg = ~clkpos;
assign Tclk  = (clkpos[8] === 1'bX ) ? 1'b0 : clkpos[8];
assign Fclk = instFlag;

assign F0 = F[0];
assign F1 = F[1];
assign F2 = F[2];
assign F3 = F[3];
  
assign OP1 = OP[0];
assign OP2 = OP[1];
assign OP3 = OP[2];
assign OP5 = OP[3];

// Dump waves
initial begin
    $dumpfile("control.vcd");
    $dumpvars(0, CU_tb);
end

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;
    // Initialize all inputs
    Zero_DetectBar = 0;
    Reset = 1;
    OP = 4'b0100;  // R-type initially
    F = 4'b0101;   // ADD function

    $display("=== RESET PHASE ===");
    // Reset cycles (equivalent to first two cycles in original)
    @(posedge instFlag); #1;
    $display("  Reset cycle 1: S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Reset cycle 2: S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);

    $display("=== NORMAL OPERATION STARTS ===");
    Reset = 0;


    $display("=== TESTING R-Type OP ===");
    @(posedge instFlag); #1;
    $display("  INIT -> Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch1 -> Fetch2:  S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 -> Decode:  S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode -> RTYPEX:  S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  RTYPEX -> RTYPEWR: S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);



    $display("=== TESTING LOAD INSTRUCTION ===");
    OP = 4'b1000;
    @(posedge instFlag); #1;
    $display("  Fetch1 (Load):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 (Load):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode (Load):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  MemAdr (Load):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  LBRD (Load):       S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  LBWR (Load):       S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);


    $display("=== TESTING STORE INSTRUCTION ===");
    OP = 4'b1100;
    @(posedge instFlag); #1;
    $display("  Fetch1 (Store):    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 (Store):    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode (Store):    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  MemAdr (Store):    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  SBWR (Store):      S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);


    $display("=== TESTING BEQ INSTRUCTION ===");
    OP = 4'b0010;
    @(posedge instFlag); #1;
    $display("  Fetch1 (BEQ):      S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 (BEQ):      S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode (BEQ):      S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  BEQEX (BEQ):       S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);



    $display("=== TESTING JUMP INSTRUCTION ===");
    OP = 4'b0001;
    @(posedge instFlag); #1;
    $display("  Fetch1 (Jump):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 (Jump):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode (Jump):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  JEX (Jump):        S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);


    $display("=== TESTING ADDI INSTRUCTION ===");
    OP = 4'b0100;
    @(posedge instFlag); #1;
    $display("  Fetch1 (ADDI):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Fetch2 (ADDI):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Decode (ADDI):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  ADDIEX (ADDI):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  ADDIWR (ADDI):     S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);
    @(posedge instFlag); #1;
    $display("  Back to Fetch1:    S=%b (%02h)  Nout=%b (%02h)", S, S, Nout, Nout);

    $display("=== TEST COMPLETE ===");
    $finish;
end

endmodule