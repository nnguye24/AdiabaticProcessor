
// timscale directive file



// Verilog HDL and netlist files of
// "MIPS25 sram_2port_bank schematic"

// Netlisted models

// Library - MIPS25, Cell - sram_2port_writedriver, View - schematic
// LAST TIME SAVED: Aug  5 16:05:12 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`include "custom_tranif.sv"
`timescale 1ns / 1ns 

module sram_2port_writedriver ( bitA, bitnotA, clkneg1, clkneg2,
     clkpos1, clkpos2, in, vdd, vss, write );

output  bitA, bitnotA;

input  clkneg1, clkneg2, clkpos1, clkpos2, in, vdd, vss, write;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_writedriver";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN0 ( vss, bitnotA, write, net2);
tranif1  MN11 ( vss, bitA, write, net1);
tranif1  MN7 ( vss, net2, in, clkneg1);
tranif1  MN8 ( vss, net1, net2, clkneg2);
tranif0  MP8 ( vdd, net2, in, clkpos1);
tranif0  MP9 ( vdd, net1, net2, clkpos2);

endmodule
// Library - MIPS25, Cell - sram1b_2port, View - schematic
// LAST TIME SAVED: Aug  5 16:07:17 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram1b_2port ( bitA, bitnotA, bitnotB, PEn, PEnnot, srclkneg,
     srclkpos, vdd, vss, wordA, wordB );

inout  bitA, bitnotA, bitnotB;

input  PEn, PEnnot, srclkneg, srclkpos, vdd, vss, wordA, wordB;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN23 ( vss, net2, net5, net4);
tranif1  MN22 ( vss, net5, wordA, bitA);
tranif1  MN21 ( vss, bitnotA, wordA, net2);
tranif1  MN20 ( vss, net4, net2, net5);
tranif1  MN19 ( vss, vss, PEnnot, net4);
tranif1  MN18 ( vss, net4, PEn, srclkneg);
tranif1  MN49 ( vss, bitnotB, wordB, net2);
tranif0  MP17 ( vdd, net3, net2, net5);
tranif0  MP16 ( vdd, net2, net5, net3);
tranif0  MP15 ( vdd, net3, PEnnot, srclkpos);
tranif0  MP14 ( vdd, vdd, PEn, net3);

endmodule
// Library - MIPS25, Cell - sram_2port_sensor, View - schematic
// LAST TIME SAVED: Jul  1 11:17:36 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_2port_sensor ( outA, bitnot, clkneg1, clkpos1, vdd, vss );

output  outA;

input  bitnot, clkneg1, clkpos1, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_sensor";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN46 ( vss, outA, bitnot, clkneg1);
tranif0  MP38 ( vdd, outA, bitnot, clkpos1);

endmodule
// Library - MIPS25, Cell - sram1b_2port_reg0, View - schematic
// LAST TIME SAVED: Jul  4 07:38:07 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram1b_2port_reg0 ( bitnotA, bitnotB, vdd, vss, wordA, wordB );

output  bitnotA, bitnotB;

input  vdd, vss, wordA, wordB;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port_reg0";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN3 ( vss, bitnotB, wordB, vdd);
tranif1  MN2 ( vss, bitnotA, wordA, vdd);

endmodule
// Library - MIPS25, Cell - sram_nand2b, View - schematic
// LAST TIME SAVED: Jun 19 09:26:03 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nand2b ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN0 ( vss, net014, a, clkneg);
tranif1  MN1 ( vss, out, b, net014);
tranif0  MP0 ( vdd, out, b, clkpos);
tranif0  MP1 ( vdd, out, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_invPhi2, View - schematic
// LAST TIME SAVED: Jul  4 17:22:32 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_invPhi2 ( out, clkneg, clkpos, in, vdd, vss );

output  out;

input  clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_invPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN1 ( vss, out, in, clkneg);
tranif0  MP1 ( vdd, out, in, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nand3b, View - schematic
// LAST TIME SAVED: Jun 16 21:06:07 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nand3b ( out, a, b, c, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN2 ( vss, net018, a, clkneg);
tranif1  MN0 ( vss, net014, b, net018);
tranif1  MN1 ( vss, out, c, net014);
tranif0  MP2 ( vdd, out, a, clkpos);
tranif0  MP0 ( vdd, out, c, clkpos);
tranif0  MP1 ( vdd, out, b, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor2b_fo4_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:11:46 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nor2b_fo4_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN2 ( vss, out, b, vss);
tranif1  MN0 ( vss, out, a, vss);
tranif0  MP2 ( vdd, out, b, net016);
tranif0  MP0 ( vdd, net016, a, vdd);

endmodule
// Library - MIPS25, Cell - sram_inv_irr, View - schematic
// LAST TIME SAVED: Jul 11 07:19:55 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_inv_irr ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_inv_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN1 ( vss, out, in, vss);
tranif0  MP1 ( vdd, out, in, vdd);

endmodule
// Library - MIPS25, Cell - sram_nor2bPhi2, View - schematic
// LAST TIME SAVED: Jun 30 11:03:34 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nor2bPhi2 ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2bPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN2 ( vss, out, b, clkneg);
tranif1  MN0 ( vss, out, a, clkneg);
tranif0  MP2 ( vdd, out, b, net016);
tranif0  MP0 ( vdd, net016, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_decoderB_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:16 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_decoderB_GLS2 ( WordB0, WordB1, ReadEn, clkneg, clkneg2,
     clkneg3, clkpos, clkpos2, clkpos3, in0B, in0BBar, in1B, in2B,
     in3B, in4B, vdd, vss );

output  WordB0, WordB1;

input  ReadEn, clkneg, clkneg2, clkneg3, clkpos, clkpos2, clkpos3,
     in0B, in0BBar, in1B, in2B, in3B, in4B, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_decoderB_GLS2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

sram_nand2b I7 ( net3, in1B, in0BBar, clkneg, clkpos, vdd, vss);
sram_nand2b I12 ( net040, in1B, in0B, clkneg, clkpos, vdd, vss);
sram_invPhi2 I43 ( net071, clkneg3, clkpos3, net076, vdd, vss);
sram_invPhi2 I42 ( net1, clkneg3, clkpos3, net044, vdd, vss);
sram_nand3b I38 ( net029, in4B, in3B, in2B, clkneg, clkpos, vdd, vss);
sram_nor2b_fo4_irr I18 ( WordB0, net1, net065, vdd, vss);
sram_nor2b_fo4_irr I34 ( WordB1, net071, net065, vdd, vss);
sram_inv_irr I19 ( net065, ReadEn, vdd, vss);
sram_nor2bPhi2 I10 ( net076, net029, net040, clkneg2, clkpos2, vdd,
     vss);
sram_nor2bPhi2 I8 ( net044, net029, net3, clkneg2, clkpos2, vdd, vss);

endmodule
// Library - MIPS25, Cell - inv_fo4, View - schematic
// LAST TIME SAVED: Jun 16 20:25:19 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module inv_fo4 ( out, clkneg, clkpos, in, vdd, vss );

output  out;

input  clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN3 ( vss, out, in, clkneg);
tranif1  MN0 ( vss, out, in, clkneg);
tranif1  MN2 ( vss, out, in, clkneg);
tranif1  MN1 ( vss, out, in, clkneg);
tranif0  MP3 ( vdd, out, in, clkpos);
tranif0  MP0 ( vdd, out, in, clkpos);
tranif0  MP2 ( vdd, out, in, clkpos);
tranif0  MP1 ( vdd, out, in, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor3b, View - schematic
// LAST TIME SAVED: Jul 10 08:56:15 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nor3b ( out, a, b, c, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN2 ( vss, out, c, clkneg);
tranif1  MN0 ( vss, out, b, clkneg);
tranif1  MN1 ( vss, out, a, clkneg);
tranif0  MP2 ( vdd, out, c, net016);
tranif0  MP0 ( vdd, net016, b, net022);
tranif0  MP1 ( vdd, net022, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor2b_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:18:37 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_nor2b_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

tranif1  MN2 ( vss, out, b, vss);
tranif1  MN0 ( vss, out, a, vss);
tranif0  MP2 ( vdd, out, b, net016);
tranif0  MP0 ( vdd, net016, a, vdd);

endmodule
// Library - MIPS25, Cell - sram_decoderA_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:04 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_decoderA_GLS2 ( PenOut0, PenOut0Bar, PenOut1, PenOut1Bar,
     WordA0, WordA1, ReadEn, RegWrtBar, WriteEn, clkneg, clkneg2,
     clkneg3, clkpos, clkpos2, clkpos3, in0A, in0ABar, in1A, in2A,
     in3A, in4A, vdd, vss );

output  PenOut0, PenOut0Bar, PenOut1, PenOut1Bar, WordA0, WordA1;

input  ReadEn, RegWrtBar, WriteEn, clkneg, clkneg2, clkneg3, clkpos,
     clkpos2, clkpos3, in0A, in0ABar, in1A, in2A, in3A, in4A, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_decoderA_GLS2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

sram_nand2b I7 ( net3, in1A, in0ABar, clkneg, clkpos, vdd, vss);
sram_nand2b I12 ( net040, in1A, in0A, clkneg, clkpos, vdd, vss);
sram_invPhi2 I43 ( net071, clkneg3, clkpos3, net076, vdd, vss);
sram_invPhi2 I24 ( PenOut0Bar, clkneg3, clkpos3, PenOut0, vdd, vss);
sram_invPhi2 I41 ( PenOut1Bar, clkneg3, clkpos3, PenOut1, vdd, vss);
sram_invPhi2 I42 ( net1, clkneg3, clkpos3, net044, vdd, vss);
sram_nand3b I38 ( net029, in4A, in3A, in2A, clkneg, clkpos, vdd, vss);
sram_nor2b_fo4_irr I18 ( WordA0, net1, net065, vdd, vss);
sram_nor2b_fo4_irr I34 ( WordA1, net071, net065, vdd, vss);
sram_nor3b I20 ( PenOut0, net029, RegWrtBar, net3, clkneg2, clkpos2,
     vdd, vss);
sram_nor3b I40 ( PenOut1, net029, RegWrtBar, net040, clkneg2, clkpos2,
     vdd, vss);
sram_nor2b_irr I19 ( net065, WriteEn, ReadEn, vdd, vss);
sram_nor2bPhi2 I10 ( net076, net029, net040, clkneg2, clkpos2, vdd,
     vss);
sram_nor2bPhi2 I8 ( net044, net029, net3, clkneg2, clkpos2, vdd, vss);

endmodule
// Library - MIPS25, Cell - sram_2port_bank, View - schematic
// LAST TIME SAVED: Aug 28 09:37:36 2025
// NETLIST TIME: Sep 29 18:41:10 2025
`timescale 1ns / 1ns 

module sram_2port_bank ( outA_15_, outA_14_, outA_13_, outA_12_,
     outA_11_, outA_10_, outA_9_, outA_8_, outA_7_, outA_6_, outA_5_,
     outA_4_, outA_3_, outA_2_, outA_1_, outA_0_, outB_15_, outB_14_,
     outB_13_, outB_12_, outB_11_, outB_10_, outB_9_, outB_8_, outB_7_,
     outB_6_, outB_5_, outB_4_, outB_3_, outB_2_, outB_1_, outB_0_,
     Addr_A_4_, Addr_A_3_, Addr_A_2_, Addr_A_1_, Addr_A_0_, Addr_B_4_,
     Addr_B_3_, Addr_B_2_, Addr_B_1_, Addr_B_0_, ReadEn, RegWrtBar,
     WriteEn, clkneg_1_, clkneg_2_, clkneg_3_, clkneg_4_, clkneg_5_,
     clkpos_1_, clkpos_2_, clkpos_3_, clkpos_4_, clkpos_5_, in_15_,
     in_14_, in_13_, in_12_, in_11_, in_10_, in_9_, in_8_, in_7_,
     in_6_, in_5_, in_4_, in_3_, in_2_, in_1_, in_0_, srclkneg,
     srclkpos, vdd, vss );

output  outA_15_, outA_14_, outA_13_, outA_12_, outA_11_, outA_10_,
     outA_9_, outA_8_, outA_7_, outA_6_, outA_5_, outA_4_, outA_3_,
     outA_2_, outA_1_, outA_0_, outB_15_, outB_14_, outB_13_, outB_12_,
     outB_11_, outB_10_, outB_9_, outB_8_, outB_7_, outB_6_, outB_5_,
     outB_4_, outB_3_, outB_2_, outB_1_, outB_0_;

input  Addr_A_4_, Addr_A_3_, Addr_A_2_, Addr_A_1_, Addr_A_0_,
     Addr_B_4_, Addr_B_3_, Addr_B_2_, Addr_B_1_, Addr_B_0_, ReadEn,
     RegWrtBar, WriteEn, clkneg_1_, clkneg_2_, clkneg_3_, clkneg_4_,
     clkneg_5_, clkpos_1_, clkpos_2_, clkpos_3_, clkpos_4_, clkpos_5_,
     in_15_, in_14_, in_13_, in_12_, in_11_, in_10_, in_9_, in_8_,
     in_7_, in_6_, in_5_, in_4_, in_3_, in_2_, in_1_, in_0_, srclkneg,
     srclkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_bank";
    specparam CDS_VIEWNAME = "schematic";
endspecify

sram_2port_writedriver I2143 ( net83, net208, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_0_, vdd, vss, WriteEn);
sram_2port_writedriver I2128 ( net5906, net2000, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_15_, vdd, vss, WriteEn);
sram_2port_writedriver I2142 ( net540, net539, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_1_, vdd, vss, WriteEn);
sram_2port_writedriver I2141 ( net584, net583, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_2_, vdd, vss, WriteEn);
sram_2port_writedriver I2140 ( net88, net87, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_3_, vdd, vss, WriteEn);
sram_2port_writedriver I2139 ( net110, net109, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_4_, vdd, vss, WriteEn);
sram_2port_writedriver I2138 ( net22, net21, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_5_, vdd, vss, WriteEn);
sram_2port_writedriver I2137 ( net11, net10, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_6_, vdd, vss, WriteEn);
sram_2port_writedriver I2136 ( net33, net32, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_7_, vdd, vss, WriteEn);
sram_2port_writedriver I2135 ( net121, net120, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_8_, vdd, vss, WriteEn);
sram_2port_writedriver I2134 ( net55, net54, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_9_, vdd, vss, WriteEn);
sram_2port_writedriver I2133 ( net3866, net1488, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_10_, vdd, vss, WriteEn);
sram_2port_writedriver I2132 ( net3811, net2485, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_11_, vdd, vss, WriteEn);
sram_2port_writedriver I2131 ( net3789, net2302, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_12_, vdd, vss, WriteEn);
sram_2port_writedriver I2130 ( net3822, net1494, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_13_, vdd, vss, WriteEn);
sram_2port_writedriver I2129 ( net3161, net2520, clkneg_2_, clkneg_3_,
     clkpos_2_, clkpos_3_, in_14_, vdd, vss, WriteEn);
sram1b_2port I1600 ( net3161, net2520, net98, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1599 ( net3161, net2520, net98, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1598 ( net3161, net2520, net98, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1597 ( net3161, net2520, net98, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1596 ( net3161, net2520, net98, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1595 ( net3161, net2520, net98, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1594 ( net3161, net2520, net98, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1593 ( net3161, net2520, net98, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1592 ( net3161, net2520, net98, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1591 ( net3161, net2520, net98, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1590 ( net3161, net2520, net98, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1589 ( net3161, net2520, net98, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1588 ( net3161, net2520, net98, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1587 ( net3161, net2520, net98, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1586 ( net3161, net2520, net98, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1585 ( net3161, net2520, net98, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1584 ( net3161, net2520, net98, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1582 ( net5906, net2000, net375, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1581 ( net5906, net2000, net375, net693, net692,
     srclkneg, srclkpos, vdd, vss, net691, net946);
sram1b_2port I1580 ( net5906, net2000, net375, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1579 ( net5906, net2000, net375, net664, net663,
     srclkneg, srclkpos, vdd, vss, net662, net924);
sram1b_2port I1578 ( net5906, net2000, net375, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1577 ( net5906, net2000, net375, net635, net634,
     srclkneg, srclkpos, vdd, vss, net633, net902);
sram1b_2port I1576 ( net5906, net2000, net375, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1575 ( net5906, net2000, net375, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1574 ( net5906, net2000, net375, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1573 ( net5906, net2000, net375, net574, net573,
     srclkneg, srclkpos, vdd, vss, net572, net858);
sram1b_2port I1572 ( net5906, net2000, net375, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1571 ( net5906, net2000, net375, net545, net544,
     srclkneg, srclkpos, vdd, vss, net543, net836);
sram1b_2port I1570 ( net5906, net2000, net375, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1569 ( net5906, net2000, net375, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1568 ( net5906, net2000, net375, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1567 ( net5906, net2000, net375, net484, net483,
     srclkneg, srclkpos, vdd, vss, net482, net792);
sram1b_2port I1566 ( net5906, net2000, net375, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1565 ( net5906, net2000, net375, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1564 ( net5906, net2000, net375, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1563 ( net5906, net2000, net375, net425, net424,
     srclkneg, srclkpos, vdd, vss, net423, net748);
sram1b_2port I1562 ( net5906, net2000, net375, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1561 ( net5906, net2000, net375, net396, net395,
     srclkneg, srclkpos, vdd, vss, net394, net591);
sram1b_2port I1560 ( net5906, net2000, net375, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1559 ( net5906, net2000, net375, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1558 ( net5906, net2000, net375, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1557 ( net5906, net2000, net375, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1556 ( net5906, net2000, net375, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1555 ( net5906, net2000, net375, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1554 ( net5906, net2000, net375, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1553 ( net5906, net2000, net375, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1552 ( net5906, net2000, net375, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1609 ( net3161, net2520, net98, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1614 ( net3161, net2520, net98, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1619 ( net3822, net1494, net474, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1624 ( net3822, net1494, net474, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1629 ( net3822, net1494, net474, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1634 ( net3822, net1494, net474, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1639 ( net3822, net1494, net474, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1644 ( net3822, net1494, net474, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1649 ( net3789, net2302, net355, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1654 ( net3789, net2302, net355, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1659 ( net3789, net2302, net355, net425, net424,
     srclkneg, srclkpos, vdd, vss, net423, net748);
sram1b_2port I1664 ( net3789, net2302, net355, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1669 ( net3789, net2302, net355, net574, net573,
     srclkneg, srclkpos, vdd, vss, net572, net858);
sram1b_2port I1674 ( net3789, net2302, net355, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1630 ( net3822, net1494, net474, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1784 ( net121, net120, net119, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1752 ( net55, net54, net53, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1699 ( net3811, net2485, net331, net545, net544,
     srclkneg, srclkpos, vdd, vss, net543, net836);
sram1b_2port I1688 ( net3811, net2485, net331, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1610 ( net3161, net2520, net98, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1761 ( net55, net54, net53, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1732 ( net3866, net1488, net186, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1721 ( net3866, net1488, net186, net396, net395,
     srclkneg, srclkpos, vdd, vss, net394, net591);
sram1b_2port I1668 ( net3789, net2302, net355, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1670 ( net3789, net2302, net355, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1642 ( net3822, net1494, net474, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1631 ( net3822, net1494, net474, net484, net483,
     srclkneg, srclkpos, vdd, vss, net482, net792);
sram1b_2port I1739 ( net3866, net1488, net186, net664, net663,
     srclkneg, srclkpos, vdd, vss, net662, net924);
sram1b_2port I1728 ( net3866, net1488, net186, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1650 ( net3789, net2302, net355, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1804 ( net121, net120, net119, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1611 ( net3161, net2520, net98, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1719 ( net3866, net1488, net186, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1708 ( net3811, net2485, net331, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1881 ( net22, net21, net20, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1870 ( net11, net10, net9, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1842 ( net11, net10, net9, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1831 ( net33, net32, net31, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1778 ( net121, net120, net119, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1767 ( net55, net54, net53, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1690 ( net3811, net2485, net331, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1662 ( net3789, net2302, net355, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1651 ( net3789, net2302, net355, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1759 ( net55, net54, net53, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1748 ( net55, net54, net53, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1655 ( net3789, net2302, net355, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1809 ( net33, net32, net31, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1616 ( net3822, net1494, net474, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1724 ( net3866, net1488, net186, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1713 ( net3866, net1488, net186, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1635 ( net3822, net1494, net474, net545, net544,
     srclkneg, srclkpos, vdd, vss, net543, net836);
sram1b_2port I1789 ( net121, net120, net119, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1757 ( net55, net54, net53, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1704 ( net3811, net2485, net331, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1693 ( net3811, net2485, net331, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1695 ( net3811, net2485, net331, net484, net483,
     srclkneg, srclkpos, vdd, vss, net482, net792);
sram1b_2port I1667 ( net3789, net2302, net355, net545, net544,
     srclkneg, srclkpos, vdd, vss, net543, net836);
sram1b_2port I1656 ( net3789, net2302, net355, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1602 ( net3161, net2520, net98, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1753 ( net55, net54, net53, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1675 ( net3789, net2302, net355, net664, net663,
     srclkneg, srclkpos, vdd, vss, net662, net924);
sram1b_2port I1636 ( net3822, net1494, net474, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1744 ( net55, net54, net53, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1733 ( net3866, net1488, net186, net574, net573,
     srclkneg, srclkpos, vdd, vss, net572, net858);
sram1b_2port I1906 ( net110, net109, net108, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1895 ( net22, net21, net20, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1867 ( net11, net10, net9, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1856 ( net11, net10, net9, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1803 ( net121, net120, net119, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1726 ( net3866, net1488, net186, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1715 ( net3866, net1488, net186, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1687 ( net3811, net2485, net331, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1676 ( net3789, net2302, net355, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1623 ( net3822, net1494, net474, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1612 ( net3161, net2520, net98, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1680 ( net3811, net2485, net331, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1652 ( net3789, net2302, net355, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1641 ( net3822, net1494, net474, net635, net634,
     srclkneg, srclkpos, vdd, vss, net633, net902);
sram1b_2port I1749 ( net55, net54, net53, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1738 ( net3866, net1488, net186, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1660 ( net3789, net2302, net355, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1814 ( net33, net32, net31, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1621 ( net3822, net1494, net474, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1729 ( net3866, net1488, net186, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1718 ( net3866, net1488, net186, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1720 ( net3866, net1488, net186, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1692 ( net3811, net2485, net331, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1681 ( net3811, net2485, net331, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1628 ( net3822, net1494, net474, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1617 ( net3822, net1494, net474, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1700 ( net3811, net2485, net331, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1672 ( net3789, net2302, net355, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1661 ( net3789, net2302, net355, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1608 ( net3161, net2520, net98, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1758 ( net55, net54, net53, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1770 ( net55, net54, net53, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1922 ( net110, net109, net108, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1892 ( net22, net21, net20, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1828 ( net33, net32, net31, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1751 ( net55, net54, net53, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1740 ( net3866, net1488, net186, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1712 ( net3866, net1488, net186, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1701 ( net3811, net2485, net331, net574, net573,
     srclkneg, srclkpos, vdd, vss, net572, net858);
sram1b_2port I1648 ( net3789, net2302, net355, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1731 ( net3866, net1488, net186, net545, net544,
     srclkneg, srclkpos, vdd, vss, net543, net836);
sram1b_2port I1705 ( net3811, net2485, net331, net635, net634,
     srclkneg, srclkpos, vdd, vss, net633, net902);
sram1b_2port I1677 ( net3789, net2302, net355, net693, net692,
     srclkneg, srclkpos, vdd, vss, net691, net946);
sram1b_2port I1666 ( net3789, net2302, net355, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1613 ( net3161, net2520, net98, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1603 ( net3161, net2520, net98, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1685 ( net3811, net2485, net331, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1657 ( net3789, net2302, net355, net396, net395,
     srclkneg, srclkpos, vdd, vss, net394, net591);
sram1b_2port I1646 ( net3822, net1494, net474, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1754 ( net55, net54, net53, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1745 ( net55, net54, net53, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1717 ( net3866, net1488, net186, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1706 ( net3811, net2485, net331, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1653 ( net3789, net2302, net355, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1736 ( net3866, net1488, net186, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1725 ( net3866, net1488, net186, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1697 ( net3811, net2485, net331, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1686 ( net3811, net2485, net331, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1633 ( net3822, net1494, net474, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1622 ( net3822, net1494, net474, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1795 ( net121, net120, net119, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1955 ( net88, net87, net86, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1917 ( net110, net109, net108, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1864 ( net11, net10, net9, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1853 ( net11, net10, net9, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1769 ( net55, net54, net53, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1737 ( net3866, net1488, net186, net635, net634,
     srclkneg, srclkpos, vdd, vss, net633, net902);
sram1b_2port I1684 ( net3811, net2485, net331, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1673 ( net3789, net2302, net355, net635, net634,
     srclkneg, srclkpos, vdd, vss, net633, net902);
sram1b_2port I1756 ( net55, net54, net53, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1730 ( net3866, net1488, net186, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1702 ( net3811, net2485, net331, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1691 ( net3811, net2485, net331, net425, net424,
     srclkneg, srclkpos, vdd, vss, net423, net748);
sram1b_2port I1638 ( net3822, net1494, net474, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1627 ( net3822, net1494, net474, net425, net424,
     srclkneg, srclkpos, vdd, vss, net423, net748);
sram1b_2port I1710 ( net3811, net2485, net331, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1682 ( net3811, net2485, net331, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1671 ( net3789, net2302, net355, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1618 ( net3822, net1494, net474, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1607 ( net3161, net2520, net98, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1774 ( net55, net54, net53, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1742 ( net3866, net1488, net186, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1689 ( net3811, net2485, net331, net396, net395,
     srclkneg, srclkpos, vdd, vss, net394, net591);
sram1b_2port I1678 ( net3789, net2302, net355, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1601 ( net3161, net2520, net98, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1750 ( net55, net54, net53, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1722 ( net3866, net1488, net186, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1658 ( net3789, net2302, net355, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1741 ( net3866, net1488, net186, net693, net692,
     srclkneg, srclkpos, vdd, vss, net691, net946);
sram1b_2port I1820 ( net33, net32, net31, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1792 ( net121, net120, net119, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1781 ( net121, net120, net119, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1889 ( net22, net21, net20, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1878 ( net22, net21, net20, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1640 ( net3822, net1494, net474, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1794 ( net121, net120, net119, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1604 ( net3161, net2520, net98, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1709 ( net3811, net2485, net331, net693, net692,
     srclkneg, srclkpos, vdd, vss, net691, net946);
sram1b_2port I1698 ( net3811, net2485, net331, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1620 ( net3822, net1494, net474, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1755 ( net55, net54, net53, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1727 ( net3866, net1488, net186, net484, net483,
     srclkneg, srclkpos, vdd, vss, net482, net792);
sram1b_2port I1716 ( net3866, net1488, net186, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1663 ( net3789, net2302, net355, net484, net483,
     srclkneg, srclkpos, vdd, vss, net482, net792);
sram1b_2port I1746 ( net55, net54, net53, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1735 ( net3866, net1488, net186, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1707 ( net3811, net2485, net331, net664, net663,
     srclkneg, srclkpos, vdd, vss, net662, net924);
sram1b_2port I1696 ( net3811, net2485, net331, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1643 ( net3822, net1494, net474, net664, net663,
     srclkneg, srclkpos, vdd, vss, net662, net924);
sram1b_2port I1632 ( net3822, net1494, net474, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1799 ( net121, net120, net119, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1606 ( net3161, net2520, net98, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1714 ( net3866, net1488, net186, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1703 ( net3811, net2485, net331, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1625 ( net3822, net1494, net474, net396, net395,
     srclkneg, srclkpos, vdd, vss, net394, net591);
sram1b_2port I1779 ( net121, net120, net119, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1747 ( net55, net54, net53, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1694 ( net3811, net2485, net331, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1683 ( net3811, net2485, net331, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1605 ( net3161, net2520, net98, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1845 ( net11, net10, net9, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1817 ( net33, net32, net31, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1806 ( net121, net120, net119, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1914 ( net110, net109, net108, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1665 ( net3789, net2302, net355, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1637 ( net3822, net1494, net474, net574, net573,
     srclkneg, srclkpos, vdd, vss, net572, net858);
sram1b_2port I1626 ( net3822, net1494, net474, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1734 ( net3866, net1488, net186, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1723 ( net3866, net1488, net186, net425, net424,
     srclkneg, srclkpos, vdd, vss, net423, net748);
sram1b_2port I1645 ( net3822, net1494, net474, net693, net692,
     srclkneg, srclkpos, vdd, vss, net691, net946);
sram1b_2port I1832 ( net33, net32, net31, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1796 ( net121, net120, net119, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1879 ( net22, net21, net20, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1843 ( net11, net10, net9, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1901 ( net22, net21, net20, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1865 ( net11, net10, net9, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1812 ( net33, net32, net31, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1776 ( net121, net120, net119, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1859 ( net11, net10, net9, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1823 ( net33, net32, net31, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1919 ( net110, net109, net108, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1883 ( net22, net21, net20, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1780 ( net121, net120, net119, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1905 ( net110, net109, net108, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1852 ( net11, net10, net9, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1816 ( net33, net32, net31, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1899 ( net22, net21, net20, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1863 ( net11, net10, net9, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1760 ( net55, net54, net53, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1885 ( net22, net21, net20, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1975 ( net584, net583, net582, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1962 ( net88, net87, net86, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I2001 ( net540, net539, net538, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1988 ( net584, net583, net582, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1991 ( net584, net583, net582, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1978 ( net584, net583, net582, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1965 ( net88, net87, net86, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1800 ( net121, net120, net119, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1931 ( net110, net109, net108, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1872 ( net22, net21, net20, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1836 ( net33, net32, net31, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1857 ( net11, net10, net9, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1821 ( net33, net32, net31, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1904 ( net110, net109, net108, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1868 ( net11, net10, net9, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1765 ( net55, net54, net53, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1890 ( net22, net21, net20, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1837 ( net33, net32, net31, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1801 ( net121, net120, net119, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1884 ( net22, net21, net20, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1848 ( net11, net10, net9, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1783 ( net121, net120, net119, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1908 ( net110, net109, net108, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1805 ( net121, net120, net119, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1937 ( net88, net87, net86, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1877 ( net22, net21, net20, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1841 ( net11, net10, net9, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1762 ( net55, net54, net53, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1888 ( net22, net21, net20, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1785 ( net121, net120, net119, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1910 ( net110, net109, net108, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I2011 ( net540, net539, net538, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1998 ( net584, net583, net582, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I2037 ( net83, net208, net207, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I2024 ( net540, net539, net538, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I2027 ( net540, net539, net538, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I2014 ( net540, net539, net538, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1861 ( net11, net10, net9, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1825 ( net33, net32, net31, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1772 ( net55, net54, net53, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1897 ( net22, net21, net20, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1819 ( net33, net32, net31, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1882 ( net22, net21, net20, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1846 ( net11, net10, net9, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1768 ( net55, net54, net53, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1893 ( net22, net21, net20, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1790 ( net121, net120, net119, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1915 ( net110, net109, net108, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1862 ( net11, net10, net9, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1826 ( net33, net32, net31, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1909 ( net110, net109, net108, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1873 ( net22, net21, net20, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1808 ( net33, net32, net31, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1866 ( net11, net10, net9, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1830 ( net33, net32, net31, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1777 ( net121, net120, net119, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1902 ( net22, net21, net20, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1824 ( net33, net32, net31, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1788 ( net121, net120, net119, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1913 ( net110, net109, net108, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1810 ( net33, net32, net31, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1943 ( net88, net87, net86, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I2047 ( net83, net208, net207, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I2034 ( net83, net208, net207, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I2060 ( net83, net208, net207, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I2050 ( net83, net208, net207, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1886 ( net22, net21, net20, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1850 ( net11, net10, net9, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1797 ( net121, net120, net119, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1764 ( net55, net54, net53, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1844 ( net11, net10, net9, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1907 ( net110, net109, net108, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1829 ( net33, net32, net31, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1793 ( net121, net120, net119, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1918 ( net110, net109, net108, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1815 ( net33, net32, net31, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1949 ( net88, net87, net86, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1887 ( net22, net21, net20, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1851 ( net11, net10, net9, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1773 ( net55, net54, net53, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1898 ( net22, net21, net20, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1833 ( net33, net32, net31, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1891 ( net22, net21, net20, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1855 ( net11, net10, net9, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1802 ( net121, net120, net119, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1766 ( net55, net54, net53, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1849 ( net11, net10, net9, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1813 ( net33, net32, net31, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1835 ( net33, net32, net31, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1782 ( net121, net120, net119, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1911 ( net110, net109, net108, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1875 ( net22, net21, net20, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1822 ( net33, net32, net31, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1786 ( net121, net120, net119, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1869 ( net11, net10, net9, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1771 ( net55, net54, net53, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1854 ( net11, net10, net9, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1818 ( net33, net32, net31, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1876 ( net22, net21, net20, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1840 ( net11, net10, net9, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1787 ( net121, net120, net119, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1912 ( net110, net109, net108, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1834 ( net33, net32, net31, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1798 ( net121, net120, net119, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1763 ( net55, net54, net53, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1858 ( net11, net10, net9, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1916 ( net110, net109, net108, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1880 ( net22, net21, net20, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1827 ( net33, net32, net31, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1791 ( net121, net120, net119, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1874 ( net22, net21, net20, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1838 ( net33, net32, net31, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1896 ( net22, net21, net20, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1860 ( net11, net10, net9, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1926 ( net110, net109, net108, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1952 ( net88, net87, net86, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1939 ( net88, net87, net86, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1942 ( net88, net87, net86, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I1929 ( net110, net109, net108, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1900 ( net22, net21, net20, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1847 ( net11, net10, net9, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1811 ( net33, net32, net31, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1894 ( net22, net21, net20, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I2061 ( net83, net208, net207, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I2048 ( net83, net208, net207, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I2051 ( net83, net208, net207, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I2038 ( net83, net208, net207, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I2005 ( net540, net539, net538, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1992 ( net584, net583, net582, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I2018 ( net540, net539, net538, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I2021 ( net540, net539, net538, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I2008 ( net540, net539, net538, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I2052 ( net83, net208, net207, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I2035 ( net83, net208, net207, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I2022 ( net540, net539, net538, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1945 ( net88, net87, net86, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1932 ( net110, net109, net108, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1971 ( net584, net583, net582, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1958 ( net88, net87, net86, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1961 ( net88, net87, net86, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1948 ( net88, net87, net86, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1928 ( net110, net109, net108, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I2041 ( net83, net208, net207, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I2028 ( net540, net539, net538, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I2054 ( net83, net208, net207, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I2057 ( net83, net208, net207, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I2044 ( net83, net208, net207, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I1954 ( net88, net87, net86, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I1941 ( net88, net87, net86, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1934 ( net110, net109, net108, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1920 ( net110, net109, net108, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1923 ( net110, net109, net108, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I2058 ( net83, net208, net207, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1981 ( net584, net583, net582, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I1968 ( net584, net583, net582, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I2007 ( net540, net539, net538, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I1994 ( net584, net583, net582, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1997 ( net584, net583, net582, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1984 ( net584, net583, net582, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I1951 ( net88, net87, net86, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1938 ( net88, net87, net86, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1977 ( net584, net583, net582, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1964 ( net88, net87, net86, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1940 ( net88, net87, net86, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1927 ( net110, net109, net108, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I1930 ( net110, net109, net108, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1990 ( net584, net583, net582, net61, net60, srclkneg,
     srclkpos, vdd, vss, net51, net90);
sram1b_2port I1957 ( net88, net87, net86, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I1944 ( net88, net87, net86, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1983 ( net584, net583, net582, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I1970 ( net584, net583, net582, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1973 ( net584, net583, net582, net78, net76, srclkneg,
     srclkpos, vdd, vss, net334, net114);
sram1b_2port I1960 ( net88, net87, net86, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I1947 ( net88, net87, net86, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I2017 ( net540, net539, net538, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I2004 ( net540, net539, net538, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I2043 ( net83, net208, net207, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I2030 ( net540, net539, net538, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I2033 ( net83, net208, net207, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I2020 ( net540, net539, net538, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1987 ( net584, net583, net582, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I1974 ( net584, net583, net582, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I2013 ( net540, net539, net538, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I2000 ( net540, net539, net538, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I2003 ( net540, net539, net538, net81, net80, srclkneg,
     srclkpos, vdd, vss, net304, net77);
sram1b_2port I1976 ( net584, net583, net582, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I1979 ( net584, net583, net582, net425, net424, srclkneg,
     srclkpos, vdd, vss, net423, net748);
sram1b_2port I1966 ( net88, net87, net86, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I1953 ( net88, net87, net86, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1921 ( net110, net109, net108, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1946 ( net88, net87, net86, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I1933 ( net110, net109, net108, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I1936 ( net88, net87, net86, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1924 ( net110, net109, net108, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I2026 ( net540, net539, net538, net6, net5, srclkneg,
     srclkpos, vdd, vss, net56, net95);
sram1b_2port I1993 ( net584, net583, net582, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1980 ( net584, net583, net582, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I2019 ( net540, net539, net538, net545, net544, srclkneg,
     srclkpos, vdd, vss, net543, net836);
sram1b_2port I2006 ( net540, net539, net538, net26, net25, srclkneg,
     srclkpos, vdd, vss, net23, net68);
sram1b_2port I2009 ( net540, net539, net538, net396, net395, srclkneg,
     srclkpos, vdd, vss, net394, net591);
sram1b_2port I1996 ( net584, net583, net582, net39, net38, srclkneg,
     srclkpos, vdd, vss, net57, net100);
sram1b_2port I1963 ( net88, net87, net86, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1950 ( net88, net87, net86, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1989 ( net584, net583, net582, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I2053 ( net83, net208, net207, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I2040 ( net83, net208, net207, net24, net19, srclkneg,
     srclkpos, vdd, vss, net27, net71);
sram1b_2port I2056 ( net83, net208, net207, net15, net14, srclkneg,
     srclkpos, vdd, vss, net52, net91);
sram1b_2port I2023 ( net540, net539, net538, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I2010 ( net540, net539, net538, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I2049 ( net83, net208, net207, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I2036 ( net83, net208, net207, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I2039 ( net83, net208, net207, net64, net62, srclkneg,
     srclkpos, vdd, vss, net364, net147);
sram1b_2port I2012 ( net540, net539, net538, net18, net17, srclkneg,
     srclkpos, vdd, vss, net36, net79);
sram1b_2port I2015 ( net540, net539, net538, net484, net483, srclkneg,
     srclkpos, vdd, vss, net482, net792);
sram1b_2port I2002 ( net540, net539, net538, net45, net43, srclkneg,
     srclkpos, vdd, vss, net12, net66);
sram1b_2port I1969 ( net584, net583, net582, net72, net70, srclkneg,
     srclkpos, vdd, vss, net275, net30);
sram1b_2port I1956 ( net88, net87, net86, net2, net1, srclkneg,
     srclkpos, vdd, vss, net50, net89);
sram1b_2port I1995 ( net584, net583, net582, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I1982 ( net584, net583, net582, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram1b_2port I1985 ( net584, net583, net582, net74, net73, srclkneg,
     srclkpos, vdd, vss, net511, net814);
sram1b_2port I1972 ( net584, net583, net582, net29, net28, srclkneg,
     srclkpos, vdd, vss, net16, net67);
sram1b_2port I1959 ( net88, net87, net86, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I2062 ( net83, net208, net207, net58, net49, srclkneg,
     srclkpos, vdd, vss, net59, net101);
sram1b_2port I2029 ( net540, net539, net538, net693, net692, srclkneg,
     srclkpos, vdd, vss, net691, net946);
sram1b_2port I2016 ( net540, net539, net538, net42, net41, srclkneg,
     srclkpos, vdd, vss, net44, net84);
sram1b_2port I2055 ( net83, net208, net207, net93, net92, srclkneg,
     srclkpos, vdd, vss, net604, net880);
sram1b_2port I2042 ( net83, net208, net207, net47, net46, srclkneg,
     srclkpos, vdd, vss, net34, net75);
sram1b_2port I2045 ( net83, net208, net207, net69, net65, srclkneg,
     srclkpos, vdd, vss, net452, net770);
sram1b_2port I2032 ( net83, net208, net207, net37, net35, srclkneg,
     srclkpos, vdd, vss, net7, net63);
sram1b_2port I1986 ( net584, net583, net582, net4, net3, srclkneg,
     srclkpos, vdd, vss, net48, net85);
sram1b_2port I2025 ( net540, net539, net538, net635, net634, srclkneg,
     srclkpos, vdd, vss, net633, net902);
sram1b_2port I1925 ( net110, net109, net108, net574, net573, srclkneg,
     srclkpos, vdd, vss, net572, net858);
sram1b_2port I2059 ( net83, net208, net207, net664, net663, srclkneg,
     srclkpos, vdd, vss, net662, net924);
sram1b_2port I2046 ( net83, net208, net207, net13, net8, srclkneg,
     srclkpos, vdd, vss, net40, net82);
sram_2port_sensor I2127 ( outB_0_, net207, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2126 ( outB_1_, net538, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2125 ( outB_2_, net582, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2124 ( outB_3_, net86, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2073 ( outA_6_, net10, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2070 ( outA_9_, net54, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2114 ( outB_13_, net474, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2065 ( outA_14_, net2520, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2119 ( outB_8_, net119, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2078 ( outA_1_, net539, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2068 ( outA_11_, net2485, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2123 ( outB_4_, net108, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2112 ( outB_15_, net375, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2115 ( outB_12_, net355, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2074 ( outA_5_, net21, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2067 ( outA_12_, net2302, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2116 ( outB_11_, net331, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2071 ( outA_8_, net120, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2077 ( outA_2_, net583, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2064 ( outA_15_, net2000, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2118 ( outB_9_, net53, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2121 ( outB_6_, net9, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2122 ( outB_5_, net20, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2079 ( outA_0_, net208, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2066 ( outA_13_, net1494, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2069 ( outA_10_, net1488, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2117 ( outB_10_, net186, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2076 ( outA_3_, net87, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2120 ( outB_7_, net31, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2113 ( outB_14_, net98, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2072 ( outA_7_, net32, clkneg_5_, clkpos_5_, vdd,
     vss);
sram_2port_sensor I2075 ( outA_4_, net109, clkneg_5_, clkpos_5_, vdd,
     vss);
sram1b_2port_reg0 I1583 ( net2000, net375, vdd, vss, net720, net968);
sram1b_2port_reg0 I1679 ( net2302, net355, vdd, vss, net720, net968);
sram1b_2port_reg0 I1647 ( net1494, net474, vdd, vss, net720, net968);
sram1b_2port_reg0 I1839 ( net32, net31, vdd, vss, net720, net968);
sram1b_2port_reg0 I1743 ( net1488, net186, vdd, vss, net720, net968);
sram1b_2port_reg0 I1615 ( net2520, net98, vdd, vss, net720, net968);
sram1b_2port_reg0 I1711 ( net2485, net331, vdd, vss, net720, net968);
sram1b_2port_reg0 I1903 ( net21, net20, vdd, vss, net720, net968);
sram1b_2port_reg0 I2063 ( net208, net207, vdd, vss, net720, net968);
sram1b_2port_reg0 I1871 ( net10, net9, vdd, vss, net720, net968);
sram1b_2port_reg0 I1807 ( net120, net119, vdd, vss, net720, net968);
sram1b_2port_reg0 I1775 ( net54, net53, vdd, vss, net720, net968);
sram1b_2port_reg0 I2031 ( net539, net538, vdd, vss, net720, net968);
sram1b_2port_reg0 I1935 ( net109, net108, vdd, vss, net720, net968);
sram1b_2port_reg0 I1967 ( net87, net86, vdd, vss, net720, net968);
sram1b_2port_reg0 I1999 ( net583, net582, vdd, vss, net720, net968);
sram_decoderB_GLS2 I2203 ( net114, net67, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_BBar_2_, Addr_B_3_, Addr_B_4_, vdd,
     vss);
sram_decoderB_GLS2 I2204 ( net147, net68, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_BBar_2_, Addr_B_3_, Addr_B_4_,
     vdd, vss);
sram_decoderB_GLS2 I2205 ( net591, net71, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_B_2_, Addr_BBar_3_, Addr_B_4_, vdd,
     vss);
sram_decoderB_GLS2 I2206 ( net748, net75, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_B_2_, Addr_BBar_3_, Addr_B_4_,
     vdd, vss);
sram_decoderB_GLS2 I2207 ( net770, net79, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_BBar_2_, Addr_BBar_3_, Addr_B_4_,
     vdd, vss);
sram_decoderB_GLS2 I2202 ( net77, net66, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_B_2_, Addr_B_3_, Addr_B_4_, vdd,
     vss);
sram_decoderB_GLS2 I2209 ( net814, net84, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_B_2_, Addr_B_3_, Addr_BBar_4_, vdd,
     vss);
sram_decoderB_GLS2 I2210 ( net836, net85, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_B_2_, Addr_B_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2211 ( net858, net89, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_BBar_2_, Addr_B_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2212 ( net880, net90, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_BBar_2_, Addr_B_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2208 ( net792, net82, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_BBar_2_, Addr_BBar_3_, Addr_B_4_,
     vdd, vss);
sram_decoderB_GLS2 I2213 ( net902, net91, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_B_2_, Addr_BBar_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2214 ( net924, net95, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_B_2_, Addr_BBar_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2215 ( net946, net100, ReadEn, clkneg_1_,
     clkneg_2_, clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_BBar_2_, Addr_BBar_3_, Addr_BBar_4_,
     vdd, vss);
sram_decoderB_GLS2 I2216 ( net968, net101, ReadEn, clkneg_1_,
     clkneg_2_, clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_BBar_1_, Addr_BBar_2_, Addr_BBar_3_,
     Addr_BBar_4_, vdd, vss);
sram_decoderB_GLS2 I2181 ( net30, net63, ReadEn, clkneg_1_, clkneg_2_,
     clkneg_3_, clkpos_1_, clkpos_2_, clkpos_3_, Addr_B_0_,
     Addr_BBar_0_, Addr_B_1_, Addr_B_2_, Addr_B_3_, Addr_B_4_, vdd,
     vss);
inv_fo4 I2221 ( Addr_ABar_1_, clkneg_1_, clkpos_1_, Addr_A_1_, vdd,
     vss);
inv_fo4 I2222 ( Addr_ABar_2_, clkneg_1_, clkpos_1_, Addr_A_2_, vdd,
     vss);
inv_fo4 I2223 ( Addr_ABar_3_, clkneg_1_, clkpos_1_, Addr_A_3_, vdd,
     vss);
inv_fo4 I2224 ( Addr_ABar_4_, clkneg_1_, clkpos_1_, Addr_A_4_, vdd,
     vss);
inv_fo4 I2197 ( Addr_BBar_0_, clkneg_1_, clkpos_1_, Addr_B_0_, vdd,
     vss);
inv_fo4 I2220 ( Addr_BBar_4_, clkneg_1_, clkpos_1_, Addr_B_4_, vdd,
     vss);
inv_fo4 I2218 ( Addr_BBar_2_, clkneg_1_, clkpos_1_, Addr_B_2_, vdd,
     vss);
inv_fo4 I2219 ( Addr_BBar_3_, clkneg_1_, clkpos_1_, Addr_B_3_, vdd,
     vss);
inv_fo4 I2217 ( Addr_BBar_1_, clkneg_1_, clkpos_1_, Addr_B_1_, vdd,
     vss);
inv_fo4 I2176 ( Addr_ABar_0_, clkneg_1_, clkpos_1_, Addr_A_0_, vdd,
     vss);
sram_decoderA_GLS2 I2175 ( net724, net723, net58, net49, net720, net59,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_ABar_2_, Addr_ABar_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2174 ( net693, net692, net39, net38, net691, net57,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_ABar_2_, Addr_ABar_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2173 ( net664, net663, net6, net5, net662, net56,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_A_2_, Addr_ABar_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2172 ( net635, net634, net15, net14, net633, net52,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_A_2_, Addr_ABar_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2171 ( net93, net92, net61, net60, net604, net51,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_ABar_2_, Addr_A_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2170 ( net574, net573, net2, net1, net572, net50,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_ABar_2_, Addr_A_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2169 ( net545, net544, net4, net3, net543, net48,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_A_2_, Addr_A_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2168 ( net74, net73, net42, net41, net511, net44,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_A_2_, Addr_A_3_, Addr_ABar_4_, vdd, vss);
sram_decoderA_GLS2 I2167 ( net484, net483, net13, net8, net482, net40,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_ABar_2_, Addr_ABar_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2166 ( net69, net65, net18, net17, net452, net36,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_ABar_2_, Addr_ABar_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2165 ( net425, net424, net47, net46, net423, net34,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_A_2_, Addr_ABar_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2164 ( net396, net395, net24, net19, net394, net27,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_A_2_, Addr_ABar_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2163 ( net64, net62, net26, net25, net364, net23,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_ABar_2_, Addr_A_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2162 ( net78, net76, net29, net28, net334, net16,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_ABar_2_, Addr_A_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2161 ( net81, net80, net45, net43, net304, net12,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_ABar_1_, Addr_A_2_, Addr_A_3_, Addr_A_4_, vdd, vss);
sram_decoderA_GLS2 I2160 ( net72, net70, net37, net35, net275, net7,
     ReadEn, RegWrtBar, WriteEn, clkneg_2_, clkneg_3_, clkneg_4_,
     clkpos_2_, clkpos_3_, clkpos_4_, Addr_A_0_, Addr_ABar_0_,
     Addr_A_1_, Addr_A_2_, Addr_A_3_, Addr_A_4_, vdd, vss);

endmodule


// End HDL models
