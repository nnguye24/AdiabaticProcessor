
// Library - MIPS25, Cell - control_unit, View - schematic
// LAST TIME SAVED: Sep 11 08:50:46 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 

`include "custom_tranif.sv"

`include "../src/inv_irr.sv"
`include "../src/inv_fo64_irr.sv"
`include "../src/nand3b_irr.sv"
`include "../src/mux2to1_control.sv"
`include "../src/phas_enH1.sv"
`include "../src/nor3b_irr.sv"
`include "../src/inv_fo64.sv"
`include "../src/nor2b_fo4_irr.sv"
`include "../src/nand3b.sv"
`include "../src/nor2b_fo4.sv"
`include "../src/flipflop2b.sv"
`include "../src/nand2b_fo4_irr.sv"
`include "../src/phasedetector.sv"
`include "../src/phasedetFO.sv"
`include "../src/inv_fo4_irr.sv"
`include "../src/inv_fo16_irr.sv"
`include "../src/inv_fo16.sv"
`include "../src/inv.sv"
`include "../src/nand2b_fo4.sv"
`include "../src/nor2b.sv"
`include "../src/nand2b.sv"
`include "../src/nor4b.sv"
`include "../src/nor3b.sv"
`include "../src/nand2b_irr.sv"
`include "../src/nand3b_fo4.sv"

module control_unit ( Nout[0], Nout[1], Nout[2], Nout[3], Nout[4],
     Nout[5], Nout[6], Nout[7], ReadEn, S[0], S[1], S[2], S[3], S[4],
     S[5], S[6], S[7], WriteEn, out_ALUCont0, out_ALUCont1,
     out_ALUCont2, out_ALUSrcA, out_ALUSrcB0, out_ALUSrcB1, out_Addi,
     out_Branch_PCSrc0, out_Decode, out_IRWr0, out_IRWr1, out_IorD,
     out_LB, out_MemWrite, out_Memadr, out_MemtoReg, out_PCSrc1,
     out_PCWrite, out_PC_En, out_PC_EnBar, out_RegDst, out_RegWriteBar,
     out_Rtype, out_S3, out_S4, out_S5, out_S6, out_SB, out_STL,
     out_SUB, out_fetch, out_fetch1, out_lbrd, out_other4, out_zeros,
     F0, F1, F2, F3, Fclk, OP1, OP2, OP3, OP5, Reset, Tclk,
     Zero_DetectBar, clkneg[0], clkneg[1], clkneg[2], clkneg[3],
     clkneg[4], clkneg[5], clkneg[6], clkneg[7], clkneg[8], clkneg[9],
     clkpos[0], clkpos[1], clkpos[2], clkpos[3], clkpos[4], clkpos[5],
     clkpos[6], clkpos[7], clkpos[8], clkpos[9], vdd, vss );

output  ReadEn, WriteEn, out_ALUCont0, out_ALUCont1, out_ALUCont2,
     out_ALUSrcA, out_ALUSrcB0, out_ALUSrcB1, out_Addi,
     out_Branch_PCSrc0, out_Decode, out_IRWr0, out_IRWr1, out_IorD,
     out_LB, out_MemWrite, out_Memadr, out_MemtoReg, out_PCSrc1,
     out_PCWrite, out_PC_En, out_PC_EnBar, out_RegDst, out_RegWriteBar,
     out_Rtype, out_S3, out_S4, out_S5, out_S6, out_SB, out_STL,
     out_SUB, out_fetch, out_fetch1, out_lbrd, out_other4, out_zeros;

input  F0, F1, F2, F3, Fclk, OP1, OP2, OP3, OP5, Reset, Tclk,
     Zero_DetectBar, vdd, vss;

output [0:7]  S;
output [0:7]  Nout;

input [0:9]  clkneg;
input [0:9]  clkpos;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "control_unit";
    specparam CDS_VIEWNAME = "schematic";
endspecify

inv_irr I35 ( net1, out_S5, vdd, vss);
inv_fo64_irr I146 ( ReadEn, net0189, vdd, vss);
inv_fo64_irr I142 ( out_PC_En, net0186, vdd, vss);
inv_fo64_irr I145 ( out_PC_EnBar, out_PC_En, vdd, vss);
inv_fo64_irr I139 ( WriteEn, net0196, vdd, vss);
nand3b_irr I59 ( net517, net1, out_S3, out_zeros, vdd, vss);
mux2to1_control I119 ( Nout[7], net0192, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I118 ( Nout[6], net536, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I117 ( Nout[5], net0123, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I116 ( Nout[4], net299, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I115 ( Nout[3], net291, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I114 ( Nout[2], net560, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I113 ( Nout[1], net177, clkneg[7], clkpos[7], Reset,
     vdd, vss);
mux2to1_control I112 ( Nout[0], net572, clkneg[7], clkpos[7], Reset,
     vdd, vss);
phas_enH1 I147 ( net0189, net0187, net0188, Ph6En, Ph6EnBar, vdd, vss);
phas_enH1 I143 ( net0186, net084, net0185, Ph8En, Ph8EnBar, vdd, vss);
phas_enH1 I138 ( net0196, net523, out_RegWriteBar, Ph8En, Ph8EnBar,
     vdd, vss);
nor3b_irr I40 ( out_zeros, out_ALUSrcA, out_ALUSrcB1, out_ALUSrcB0,
     vdd, vss);
nor3b_irr I39 ( net0163, net132, net2, out_S5, vdd, vss);
nor3b_irr I38 ( net6, out_S5, out_S3, net132, vdd, vss);
nor3b_irr I36 ( net0154, net0141, out_S3, out_S4, vdd, vss);
inv_fo64 I106 ( out_RegWriteBar, clkneg[4], clkpos[4], net523, vdd,
     vss);
inv_fo64 I29 ( out_Branch_PCSrc0, clkneg[0], clkpos[0], net14, vdd,
     vss);
nor2b_fo4_irr I63 ( out_IRWr1, net2, net7, vdd, vss);
nor2b_fo4_irr I141 ( out_IRWr0, out_S3, net7, vdd, vss);
nand3b I129 ( net0123, net404, net399, net10, clkneg[3], clkpos[3],
     vdd, vss);
nor2b_fo4 I57 ( net508, net3, net284, clkneg[1], clkpos[1], vdd, vss);
flipflop2b I130 ( net0161, net0178, cdsNet1, Fclk, net0159, clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I127 ( S[7], net0169, cdsNet1, Fclk, Nout[7], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I126 ( S[6], net0170, cdsNet1, Fclk, Nout[6], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I125 ( S[5], net0171, cdsNet1, Fclk, Nout[5], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I124 ( S[4], net0172, cdsNet1, Fclk, Nout[4], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I123 ( S[3], net0173, cdsNet1, Fclk, Nout[3], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I122 ( S[2], net0174, cdsNet1, Fclk, Nout[2], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I121 ( S[1], net0175, cdsNet1, Fclk, Nout[1], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
flipflop2b I120 ( S[0], net0176, cdsNet1, Fclk, Nout[0], clkneg[9],
     clkpos[9], cdsNet0, Tclk, vdd, vss);
nand2b_fo4_irr I64 ( net160, out_zeros, net6, vdd, vss);
nand2b_fo4_irr I60 ( net164, net0154, out_zeros, vdd, vss);
nand2b_fo4_irr I55 ( out_ALUCont2, net14, net5, vdd, vss);
phasedetFO I137 ( Ph8En, Ph8EnBar, clkneg[8], vdd, vss);
phasedetFO I136 ( Ph6En, Ph6EnBar, clkneg[6], vdd, vss);
inv_fo4_irr I17 ( net4, F3, vdd, vss);
inv_fo4_irr I7 ( net0270, S[0], vdd, vss);
inv_fo4_irr I6 ( net0274, S[1], vdd, vss);
inv_fo4_irr I5 ( net0457, S[2], vdd, vss);
inv_fo4_irr I4 ( net2, S[3], vdd, vss);
inv_fo4_irr I3 ( net132, S[4], vdd, vss);
inv_fo4_irr I2 ( net0141, S[5], vdd, vss);
inv_fo4_irr I1 ( net99, S[6], vdd, vss);
inv_fo4_irr I0 ( net103, S[7], vdd, vss);
inv_fo16_irr I133 ( cdsNet0, Tclk, vdd, vss);
inv_fo16_irr I131 ( out_MemWrite, net0178, vdd, vss);
inv_fo16_irr I128 ( cdsNet1, Fclk, vdd, vss);
inv_fo16_irr I85 ( out_MemtoReg, net160, vdd, vss);
inv_fo16_irr I84 ( out_RegDst, net164, vdd, vss);
inv_fo16_irr I83 ( out_IorD, net517, vdd, vss);
inv_fo16_irr I58 ( out_PCSrc1, net15, vdd, vss);
inv_fo16_irr I42 ( out_SUB, net68, vdd, vss);
inv_fo16_irr I18 ( out_STL, net4, vdd, vss);
inv_fo16_irr I16 ( out_ALUSrcB0, net0270, vdd, vss);
inv_fo16_irr I15 ( out_ALUSrcB1, net0274, vdd, vss);
inv_fo16_irr I14 ( out_ALUSrcA, net0457, vdd, vss);
inv_fo16_irr I13 ( out_S3, net2, vdd, vss);
inv_fo16_irr I12 ( out_S4, net132, vdd, vss);
inv_fo16_irr I11 ( out_S5, net0141, vdd, vss);
inv_fo16_irr I10 ( out_S6, net99, vdd, vss);
inv_fo16_irr I9 ( net14, net103, vdd, vss);
inv_fo16 I99 ( out_ALUCont1, clkneg[3], clkpos[3], net182, vdd, vss);
inv_fo16 I89 ( out_ALUCont0, clkneg[2], clkpos[2], net508, vdd, vss);
inv_fo16 I86 ( net0159, clkneg[2], clkpos[2], net202, vdd, vss);
inv I148 ( net0188, clkneg[5], clkpos[5], net0187, vdd, vss);
inv I144 ( net0185, clkneg[7], clkpos[7], net084, vdd, vss);
inv I134 ( net0143, clkneg[2], clkpos[2], net525, vdd, vss);
inv I111 ( net291, clkneg[6], clkpos[6], net460, vdd, vss);
inv I110 ( net572, clkneg[6], clkpos[6], net374, vdd, vss);
inv I109 ( net299, clkneg[5], clkpos[5], net224, vdd, vss);
inv I104 ( net303, clkneg[4], clkpos[4], net384, vdd, vss);
inv I97 ( net536, clkneg[3], clkpos[3], net308, vdd, vss);
inv I94 ( out_lbrd, clkneg[3], clkpos[3], net409, vdd, vss);
inv I91 ( net560, clkneg[3], clkpos[3], net316, vdd, vss);
inv I76 ( net319, clkneg[2], clkpos[2], out_Memadr, vdd, vss);
inv I73 ( net386, clkneg[2], clkpos[2], net278, vdd, vss);
inv I71 ( net246, clkneg[2], clkpos[2], out_Memadr, vdd, vss);
inv I69 ( out_fetch, clkneg[2], clkpos[2], net428, vdd, vss);
inv I54 ( out_Decode, clkneg[1], clkpos[1], net65, vdd, vss);
inv I53 ( net10, clkneg[1], clkpos[1], out_S6, vdd, vss);
inv I52 ( out_Memadr, clkneg[1], clkpos[1], net64, vdd, vss);
inv I44 ( net8, clkneg[1], clkpos[1], OP1, vdd, vss);
inv I43 ( net54, clkneg[1], clkpos[1], net57, vdd, vss);
inv I37 ( net348, clkneg[0], clkpos[0], out_S4, vdd, vss);
inv I32 ( net3, clkneg[0], clkpos[0], out_S6, vdd, vss);
inv I31 ( net424, clkneg[0], clkpos[0], F2, vdd, vss);
inv I25 ( net53, clkneg[0], clkpos[0], OP3, vdd, vss);
inv I24 ( net62, clkneg[0], clkpos[0], OP5, vdd, vss);
inv I23 ( net61, clkneg[0], clkpos[0], out_S3, vdd, vss);
inv I22 ( net59, clkneg[0], clkpos[0], out_ALUSrcB1, vdd, vss);
inv I21 ( net67, clkneg[0], clkpos[0], OP5, vdd, vss);
nand2b_fo4 I103 ( net177, net16, net13, clkneg[4], clkpos[4], vdd,
     vss);
nand2b_fo4 I82 ( net182, out_S6, net9, clkneg[2], clkpos[2], vdd, vss);
nand2b_fo4 I81 ( net0192, OP2, out_Decode, clkneg[2], clkpos[2], vdd,
     vss);
nand2b_fo4 I70 ( net316, out_Decode, net8, clkneg[2], clkpos[2], vdd,
     vss);
nand2b_fo4 I67 ( out_PCWrite, net15, net7, clkneg[1], clkpos[1], vdd,
     vss);
nand2b_fo4 I65 ( net202, net0163, out_zeros, clkneg[1], clkpos[1], vdd,
     vss);
nor2b I105 ( net224, out_lbrd, out_other4, clkneg[4], clkpos[4], vdd,
     vss);
nor2b I102 ( net229, out_Decode, out_Memadr, clkneg[4], clkpos[4], vdd,
     vss);
nor2b I101 ( net376, out_lbrd, out_S6, clkneg[4], clkpos[4], vdd,
     vss);
nor2b I95 ( out_other4, net319, net249, clkneg[3], clkpos[3], vdd,
     vss);
nor2b I92 ( net463, net246, net259, clkneg[3], clkpos[3], vdd, vss);
nor2b I88 ( net084, net70, out_PCWrite, clkneg[6], clkpos[6], vdd,
     vss);
nor2b I77 ( net249, out_Addi, out_SB, clkneg[2], clkpos[2], vdd, vss);
nor2b I74 ( out_fetch1, net428, out_S3, clkneg[2], clkpos[2], vdd,
     vss);
nor2b I72 ( net259, out_LB, out_SB, clkneg[2], clkpos[2], vdd, vss);
nor2b I66 ( net70, net14, Zero_DetectBar, clkneg[5], clkpos[5], vdd,
     vss);
nor2b I61 ( net525, net1, net348, clkneg[1], clkpos[1], vdd, vss);
nor2b I51 ( out_Addi, OP5, net53, clkneg[1], clkpos[1], vdd, vss);
nor2b I50 ( out_SB, net53, net62, clkneg[1], clkpos[1], vdd, vss);
nor2b I49 ( net410, out_ALUSrcB0, net61, clkneg[1], clkpos[1], vdd,
     vss);
nor2b I46 ( net278, OP1, out_Rtype, clkneg[1], clkpos[1], vdd, vss);
nor2b I45 ( out_LB, net67, OP3, clkneg[1], clkpos[1], vdd, vss);
nor2b I33 ( net284, F0, F3, clkneg[0], clkpos[0], vdd, vss);
nor2b I20 ( net57, OP5, OP3, clkneg[0], clkpos[0], vdd, vss);
nand2b I140 ( net0187, out_ALUSrcB1, out_ALUSrcB0, clkneg[0],
     clkpos[0], vdd, vss);
nand2b I107 ( net374, net376, net229, clkneg[5], clkpos[5], vdd, vss);
nand2b I93 ( net384, net386, out_Decode, clkneg[3], clkpos[3], vdd,
     vss);
nand2b I90 ( net13, out_S3, out_fetch, clkneg[3], clkpos[3], vdd, vss);
nand2b I80 ( net308, out_Rtype, out_Decode, clkneg[2], clkpos[2], vdd,
     vss);
nand2b I79 ( net399, out_Addi, out_Memadr, clkneg[2], clkpos[2], vdd,
     vss);
nand2b I78 ( net404, OP1, out_Decode, clkneg[2], clkpos[2], vdd,
     vss);
nand2b I75 ( net409, net466, net410, clkneg[2], clkpos[2], vdd, vss);
nand2b I68 ( net16, net54, out_Decode, clkneg[2], clkpos[2], vdd, vss);
nand2b I56 ( net9, out_S6, net424, clkneg[1], clkpos[1], vdd, vss);
nand2b I47 ( net428, net59, out_ALUSrcB0, clkneg[1], clkpos[1], vdd,
     vss);
nand2b I28 ( net65, out_ALUSrcB0, out_ALUSrcB1, clkneg[0], clkpos[0],
     vdd, vss);
nand2b I26 ( net64, out_ALUSrcA, out_ALUSrcB1, clkneg[0], clkpos[0],
     vdd, vss);
nor4b I27 ( out_Rtype, OP5, OP3, OP2, clkneg[0], clkpos[0], OP1, vdd,
     vss);
nor3b I108 ( net460, net463, net303, out_fetch1, clkneg[5], clkpos[5],
     vdd, vss);
nor3b I48 ( net466, out_S5, out_S6, out_S4, clkneg[1], clkpos[1], vdd,
     vss);
nand2b_irr I41 ( net7, net0274, out_ALUSrcB0, vdd, vss);
nand2b_irr I34 ( net15, out_S5, out_S3, vdd, vss);
nand2b_irr I30 ( net5, F1, out_S6, vdd, vss);
nand2b_irr I19 ( net68, F1, net4, vdd, vss);
nand3b_fo4 I98 ( net523, net164, net0143, net160, clkneg[3], clkpos[3],
     clkneg[3], vss);

endmodule
