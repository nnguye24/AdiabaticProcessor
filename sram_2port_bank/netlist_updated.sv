
// timscale directive file
//`include "/afs/crc.nd.edu/user/g/gsnider/MIPS25/V1.10.513/VirtuosoOA/examples/sram_2port_bank_run1/hdlFilesDir/timescaleF"

`include "custom_tranif.sv"
`timescale 1ns / 1ns 
// Verilog HDL and netlist files of
// "MIPS25 sram_2port_bank schematic"

// Netlisted models

// Library - MIPS25, Cell - sram_2port_writedriver, View - schematic
// LAST TIME SAVED: Aug  5 16:05:12 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_2port_writedriver ( bitA, bitnotA, clkneg1, clkneg2,
     clkpos1, clkpos2, in, vdd, vss, write );

output  bitA, bitnotA;

input  clkneg1, clkneg2, clkpos1, clkpos2, in, vdd, vss, write;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_writedriver";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( vss, bitnotA, write, net2);
ctranif1  MN11 ( vss, bitA, write, net1);
ctranif1  MN7 ( vss, net2, in, clkneg1);
ctranif1  MN8 ( vss, net1, net2, clkneg2);
ctranif0  MP8 ( vdd, net2, in, clkpos1);
ctranif0  MP9 ( vdd, net1, net2, clkpos2);

endmodule
// Library - MIPS25, Cell - sram1b_2port, View - schematic
// LAST TIME SAVED: Aug  5 16:07:17 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram1b_2port ( bitA, bitnotA, bitnotB, PEn, PEnnot, srclkneg,
     srclkpos, vdd, vss, wordA, wordB );

inout  bitA, bitnotA, bitnotB;

input  PEn, PEnnot, srclkneg, srclkpos, vdd, vss, wordA, wordB;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN23 ( vss, net2, net5, net4);
ctranif1  MN22 ( vss, net5, wordA, bitA);
ctranif1  MN21 ( vss, bitnotA, wordA, net2);
ctranif1  MN20 ( vss, net4, net2, net5);
ctranif1  MN19 ( vss, vss, PEnnot, net4);
ctranif1  MN18 ( vss, net4, PEn, srclkneg);
ctranif1  MN49 ( vss, bitnotB, wordB, net2);
ctranif0  MP17 ( vdd, net3, net2, net5);
ctranif0  MP16 ( vdd, net2, net5, net3);
ctranif0  MP15 ( vdd, net3, PEnnot, srclkpos);
ctranif0  MP14 ( vdd, vdd, PEn, net3);

endmodule
// Library - MIPS25, Cell - sram_2port_sensor, View - schematic
// LAST TIME SAVED: Jul  1 11:17:36 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_2port_sensor ( outA, bitnot, clkneg1, clkpos1, vdd, vss );

output  outA;

input  bitnot, clkneg1, clkpos1, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_sensor";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN46 ( vss, outA, bitnot, clkneg1);
ctranif0  MP38 ( vdd, outA, bitnot, clkpos1);

endmodule
// Library - MIPS25, Cell - sram1b_2port_reg0, View - schematic
// LAST TIME SAVED: Jul  4 07:38:07 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram1b_2port_reg0 ( bitnotA, bitnotB, vdd, vss, wordA, wordB );

output  bitnotA, bitnotB;

input  vdd, vss, wordA, wordB;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port_reg0";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( vss, bitnotB, wordB, vdd);
ctranif1  MN2 ( vss, bitnotA, wordA, vdd);

endmodule
// Library - MIPS25, Cell - sram_nand2b, View - schematic
// LAST TIME SAVED: Jun 19 09:26:03 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nand2b ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( vss, net014, a, clkneg);
ctranif1  MN1 ( vss, out, b, net014);
ctranif0  MP0 ( vdd, out, b, clkpos);
ctranif0  MP1 ( vdd, out, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_invPhi2, View - schematic
// LAST TIME SAVED: Jul  4 17:22:32 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_invPhi2 ( out, clkneg, clkpos, in, vdd, vss );

output  out;

input  clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_invPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( vss, out, in, clkneg);
ctranif0  MP1 ( vdd, out, in, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nand3b, View - schematic
// LAST TIME SAVED: Jun 16 21:06:07 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nand3b ( out, a, b, c, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( vss, net018, a, clkneg);
ctranif1  MN0 ( vss, net014, b, net018);
ctranif1  MN1 ( vss, out, c, net014);
ctranif0  MP2 ( vdd, out, a, clkpos);
ctranif0  MP0 ( vdd, out, c, clkpos);
ctranif0  MP1 ( vdd, out, b, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor2b_fo4_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:11:46 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nor2b_fo4_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( vss, out, b, vss);
ctranif1  MN0 ( vss, out, a, vss);
ctranif0  MP2 ( vdd, out, b, net016);
ctranif0  MP0 ( vdd, net016, a, vdd);

endmodule
// Library - MIPS25, Cell - sram_inv_irr, View - schematic
// LAST TIME SAVED: Jul 11 07:19:55 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_inv_irr ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_inv_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( vss, out, in, vss);
ctranif0  MP1 ( vdd, out, in, vdd);

endmodule
// Library - MIPS25, Cell - sram_nor2bPhi2, View - schematic
// LAST TIME SAVED: Jun 30 11:03:34 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nor2bPhi2 ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2bPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( vss, out, b, clkneg);
ctranif1  MN0 ( vss, out, a, clkneg);
ctranif0  MP2 ( vdd, out, b, net016);
ctranif0  MP0 ( vdd, net016, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_decoderB_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:16 2025
// NETLIST TIME: Sep 29 18:41:10 2025


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


module inv_fo4 ( out, clkneg, clkpos, in, vdd, vss );

output  out;

input  clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( vss, out, in, clkneg);
ctranif1  MN0 ( vss, out, in, clkneg);
ctranif1  MN2 ( vss, out, in, clkneg);
ctranif1  MN1 ( vss, out, in, clkneg);
ctranif0  MP3 ( vdd, out, in, clkpos);
ctranif0  MP0 ( vdd, out, in, clkpos);
ctranif0  MP2 ( vdd, out, in, clkpos);
ctranif0  MP1 ( vdd, out, in, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor3b, View - schematic
// LAST TIME SAVED: Jul 10 08:56:15 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nor3b ( out, a, b, c, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( vss, out, c, clkneg);
ctranif1  MN0 ( vss, out, b, clkneg);
ctranif1  MN1 ( vss, out, a, clkneg);
ctranif0  MP2 ( vdd, out, c, net016);
ctranif0  MP0 ( vdd, net016, b, net022);
ctranif0  MP1 ( vdd, net022, a, clkpos);

endmodule
// Library - MIPS25, Cell - sram_nor2b_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:18:37 2025
// NETLIST TIME: Sep 29 18:41:10 2025


module sram_nor2b_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( vss, out, b, vss);
ctranif1  MN0 ( vss, out, a, vss);
ctranif0  MP2 ( vdd, out, b, net016);
ctranif0  MP0 ( vdd, net016, a, vdd);

endmodule
// Library - MIPS25, Cell - sram_decoderA_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:04 2025
// NETLIST TIME: Sep 29 18:41:10 2025


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

sram_array array(outA_15_, outA_14_, outA_13_, outA_12_, outA_11_, outA_10_,
     outA_9_, outA_8_, outA_7_, outA_6_, outA_5_, outA_4_, outA_3_,
     outA_2_, outA_1_, outA_0_, outB_15_, outB_14_, outB_13_, outB_12_,
     outB_11_, outB_10_, outB_9_, outB_8_, outB_7_, outB_6_, outB_5_,
     outB_4_, outB_3_, outB_2_, outB_1_, outB_0_,
    // concatenate all outputs from decoders, word determines address, 1 hot
     // wordA
     {net720,net59,net691,net57,net662,net56,net633,net52,net604,net51,net572,net50,
     net543,net48,net511,net44,net482,net40,net452,net36,net423,net34,net394,net27,
     net364,net23,net334,net16,net304,net12,net275,net7},
     // wordB
     {net968,net101,net946,net100,net924,net95,net902,net91,net880,net90,net858,
     net89,net836,net85,net814,net84,net792,net82,net770,net79,net748,
     net75,net591,net71,net147,net68,net114, net67,net77,net66,net30,net63}, 

     ReadEn, WriteEn, in_15_, in_14_, in_13_, in_12_, in_11_, in_10_, in_9_, in_8_,
     in_7_, in_6_, in_5_, in_4_, in_3_, in_2_, in_1_, in_0_, srclkneg,
     srclkpos
);
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
     
// sram1b_2port_reg0 I1583 ( net2000, net375, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1679 ( net2302, net355, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1647 ( net1494, net474, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1839 ( net32, net31, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1743 ( net1488, net186, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1615 ( net2520, net98, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1711 ( net2485, net331, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1903 ( net21, net20, vdd, vss, net720, net968);
// sram1b_2port_reg0 I2063 ( net208, net207, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1871 ( net10, net9, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1807 ( net120, net119, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1775 ( net54, net53, vdd, vss, net720, net968);
// sram1b_2port_reg0 I2031 ( net539, net538, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1935 ( net109, net108, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1967 ( net87, net86, vdd, vss, net720, net968);
// sram1b_2port_reg0 I1999 ( net583, net582, vdd, vss, net720, net968);
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
