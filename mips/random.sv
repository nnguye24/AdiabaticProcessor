module mips ( Addi, Decode, Fclk, LB, MemWrite, Memadr, N[0], N[1],
     N[2], N[3], N[4], N[5], N[6], N[7], OP3_spy, OP5_spy, PC[15:0],
     Reset, Rtype, S3, S4, S5, S6, S[0], S[1], S[2], S[3], S[4], S[5],
     S[6], S[7], SB, Tclk, VDD, VSS, clkneg[1:10], clkpos[1:10],
     data_in[15:0], fetch, fetch1, io[15:0], lbrd, nand_in1, nand_in2,
     nand_out, not_in1, not_in2, not_out1, not_out2, other4, zeros,
     srclkneg, srclkpos );

output Addi;
output Decode;
input Fclk;
output LB;
output MemWrite;
output Memadr;
output OP3_spy;
output OP5_spy;
input Reset;
output Rtype;
output S3;
output S4;
output S5;
output S6;
output SB;
input Tclk;
input VDD;
input VSS;
output fetch;
output fetch1;
output lbrd;
input nand_in1;
input nand_in2;
output nand_out;
input not_in1;
input not_in2;
output not_out1;
output not_out2;
output other4;
output zeros;

input srclkneg;
input srclkpos;

inout  [15:0]  io;
output  [0:7]  N;
output  [15:0]  PC;
input  [15:0]  data_in;
output  [0:7]  S;
input  [1:10]  clkneg;
input  [1:10]  clkpos;

wire net018 ;

wire net142 ;

wire net145 ;

wire net021 ;

wire net027 ;

wire net1 ;

wire net026 ;

wire cdsNet0 ;

wire net017 ;

wire net135 ;

wire ReadEn ;

wire IorD ;

wire PC_En ;

wire zero_detectBar ;

wire SUB ;

wire STL ;

wire ALUCont1 ;

wire net016 ;

wire RegDst ;

wire MemtoReg ;

wire IRWr1 ;

wire RegWriteBar ;

wire IRWr0 ;

wire WriteEn ;

wire ALUCont2 ;

wire ALUSrcA ;

wire ALUSrcB0 ;

wire ALUSrcB1 ;

wire PCSrc1 ;

wire net015 ;

wire ALUCont0 ;

wire Branch_PCSrc0 ;

wire PCWrite ;

// Buses in the design

wire [15:0]  SRAM_out;

wire [15:0]  a;

wire [0:15]  net034;

wire [15:0]  b;

wire [15:0]  out_wd;

wire [15:0]  alu_out;

wire [4:0]  a3;

wire [30:0]  instr;

wire [15:0]  PCtoALU;


specify
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mips";
    specparam CDS_VIEWNAME = "schematic";
endspecify

InstrDataReg I3 ( a3[4:0], io[15:0], {OP5_spy, instr[30], OP3_spy,
     instr[28:0]}, out_wd[15:0], alu_out[15:0], Fclk, IRWr0, IRWr1,
     MemWrite, MemtoReg, RegDst, Tclk, SRAM_out[15:0], clkneg[10],
     clkpos[10], data_in[15:0], VDD, VSS);
PC I7 ( PC[15:0], PCtoALU[15:0], Fclk, IorD, PC_En, cdsNet0, Tclk,
     clkneg[10], clkpos[10], net034[0:15], alu_out[15:0], VDD, VSS);
inv_fo64 I22 ( not_out1, clkneg[5], clkpos[5], net145, VDD, VSS);
inv_fo64 I18 ( net027, clkneg[1], clkpos[1], not_in1, VDD, VSS);
inv_fo64 I13 ( not_out2, clkneg[5], clkpos[5], net1, VDD, VSS);
inv_fo64 I12 ( net017, clkneg[1], clkpos[1], not_in2, VDD, VSS);
inv_fo64 I10 ( nand_out, clkneg[7], clkpos[7], net021, VDD, VSS);
inv_fo64 I9 ( net016, clkneg[5], clkpos[5], nand_in1, VDD, VSS);
inv_fo64 I8 ( net015, clkneg[5], clkpos[5], nand_in2, VDD, VSS);
sram_2port_bank I24 ( a[15:0], b[15:0], a3[4:0], instr[25:21], ReadEn,
     RegWriteBar, WriteEn, {clkneg[4:7], clkneg[9]}, {clkpos[4:7],
     clkpos[9]}, out_wd[15:0], srclkneg, srclkpos, VDD, VSS);
inv_fo16 I20 ( net145, clkneg[4], clkpos[4], net142, VDD, VSS);
inv_fo16 I17 ( net1, clkneg[4], clkpos[4], net135, VDD, VSS);
inv_fo4 I19 ( net142, clkneg[3], clkpos[3], net026, VDD, VSS);
inv_fo4 I16 ( net135, clkneg[3], clkpos[3], net018, VDD, VSS);
nand2b I11 ( net021, net015, net016, clkneg[6], clkpos[6], VDD, VSS);
ALU I4 ( SRAM_out[15:0], net034[0:15], alu_out[15:0], zero_detectBar,
     ALUCont0, ALUCont1, ALUSrcA, ALUCont2, ALUSrcB0, ALUSrcB1, Fclk,
     PCtoALU[15:0], STL, SUB, Tclk, a[15:0], b[15:0], clkneg[1:10],
     clkpos[1:10], instr[15:0], Branch_PCSrc0, PCSrc1, VDD, VSS);
control_unit I5 ( N[0], N[1], N[2], N[3], N[4], N[5], N[6], N[7],
     ReadEn, S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7], WriteEn,
     ALUCont0, ALUCont1, ALUCont2, ALUSrcA, ALUSrcB0, ALUSrcB1, Addi,
     Branch_PCSrc0, Decode, IRWr0, IRWr1, IorD, LB, MemWrite, Memadr,
     MemtoReg, PCSrc1, PCWrite, PC_En, cdsNet0, RegDst, RegWriteBar,
     Rtype, S3, S4, S5, S6, SB, STL, SUB, fetch, fetch1, lbrd, other4,
     zeros, instr[0], instr[1], instr[2], instr[3], Fclk, instr[27],
     instr[28], OP3_spy, OP5_spy, Reset, Tclk, zero_detectBar,
     clkneg[1], clkneg[2], clkneg[3], clkneg[4], clkneg[5], clkneg[6],
     clkneg[7], clkneg[8], clkneg[9], clkneg[10], clkpos[1], clkpos[2],
     clkpos[3], clkpos[4], clkpos[5], clkpos[6], clkpos[7], clkpos[8],
     clkpos[9], clkpos[10], VDD, VSS);
inv I21 ( net026, clkneg[2], clkpos[2], net027, VDD, VSS);
inv I15 ( net018, clkneg[2], clkpos[2], net017, VDD, VSS);

endmodule