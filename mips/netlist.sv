// Verilog HDL and netlist files of
// "MIPS25 mips schematic"


// alias module. For internal use only.
`include "custom_tranif.sv"

// Netlisted models

// Library - MIPS25, Cell - flipflop2b, View - schematic
// LAST TIME SAVED: Jul 23 15:21:51 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module flipflop2b ( 
output   Out, 
output   OutBar, 
input   Fclkneg, 
input   Fclkpos, 
input   In, 
input   Mclkneg, 
input   Mclkpos, 
input   Tclkneg, 
input   Tclkpos, 
input   vdd, 
input   vss );

wire net15 ;

wire net024 ;

wire net19 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "flipflop2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  M12 ( .b(vss), .d(vss), .g(Out), .s(OutBar));
ctranif1  M10 ( .b(vss), .d(Out), .g(net024), .s(vss));
ctranif1  M8 ( .b(vss), .d(net024), .g(Fclkneg), .s(OutBar));
ctranif1  M7 ( .b(vss), .d(net024), .g(Fclkpos), .s(net19));
ctranif1  M6 ( .b(vss), .d(net19), .g(net15), .s(Mclkneg));
ctranif1  M4 ( .b(vss), .d(Mclkneg), .g(net19), .s(net15));
ctranif1  M1 ( .b(vss), .d(net15), .g(Tclkpos), .s(In));
ctranif0  M11 ( .b(vdd), .s(OutBar), .g(Out), .d(vdd));
ctranif0  M9 ( .b(vdd), .s(vdd), .g(net024), .d(Out));
ctranif0  M5 ( .b(vdd), .s(Mclkpos), .g(net15), .d(net19));
ctranif0  M3 ( .b(vdd), .s(net15), .g(net19), .d(Mclkpos));
ctranif0  M2 ( .b(vdd), .s(In), .g(Tclkneg), .d(net15));

endmodule
// Library - MIPS25, Cell - Register16b, View - schematic
// LAST TIME SAVED: Jul  4 10:48:34 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module Register16b ( 
output  [15:0] out, 
input   Fclkneg, 
input   Fclkpos, 
input   Tclkneg, 
input   Tclkpos, 
input   clkneg, 
input   clkpos, 
input  [15:0] in, 
input   vdd, 
input   vss );

wire outBar;

specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "Register16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

flipflop2b I22[15:0] ( out[15:0], outBar, Fclkneg, Fclkpos, in[15:0], clkneg,
     clkpos, Tclkneg, Tclkpos, vdd, vss);

endmodule
// Library - MIPS25, Cell - mux2to1_irr, View - schematic
// LAST TIME SAVED: Jun 16 22:48:44 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module mux2to1_irr ( 
inout   a, 
inout   b, 
inout   out, 
input   in, 
input   vdd, 
input   vss );

wire net24 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux2to1_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif0  M4 ( .b(vdd), .s(b), .g(net24), .d(out));
ctranif0  M2 ( .b(vdd), .s(a), .g(in), .d(out));
ctranif0  M0 ( .b(vdd), .s(vdd), .g(in), .d(net24));
ctranif1  M5 ( .b(vss), .d(out), .g(in), .s(b));
ctranif1  M3 ( .b(vss), .d(out), .g(net24), .s(a));
ctranif1  M1 ( .b(vss), .d(net24), .g(in), .s(vss));

endmodule
// Library - MIPS25, Cell - inv_fo16_irr, View - schematic
// LAST TIME SAVED: Jun 16 20:43:25 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module inv_fo16_irr ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo16_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN15 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN14 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN13 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN12 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN11 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN10 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN9 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN8 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN7 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN6 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN5 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN4 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN2 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN3 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP15 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP14 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP13 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP12 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP11 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP10 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP9 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP8 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP7 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP6 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP5 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP4 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP3 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - flipflop_En2b, View - schematic
// LAST TIME SAVED: Jul 20 16:29:17 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module flipflop_En2b ( 
output   Out, 
input   En, 
input   EnInv, 
input   Fclkneg, 
input   Fclkpos, 
input   In, 
input   Mclkneg, 
input   Mclkpos, 
input   Tclkneg, 
input   Tclkpos, 
input   vdd, 
input   vss );

wire net069 ;

wire net19 ;

wire net036 ;

wire net15 ;

wire net024 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "flipflop_En2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN4 ( .b(vss), .d(net069), .g(EnInv), .s(Out));
ctranif1  MN2 ( .b(vss), .d(In), .g(En), .s(net069));
ctranif1  M12 ( .b(vss), .d(vss), .g(Out), .s(net036));
ctranif1  M10 ( .b(vss), .d(Out), .g(net024), .s(vss));
ctranif1  M8 ( .b(vss), .d(net024), .g(Fclkneg), .s(net036));
ctranif1  M7 ( .b(vss), .d(net024), .g(Fclkpos), .s(net19));
ctranif1  M6 ( .b(vss), .d(net19), .g(net15), .s(Mclkneg));
ctranif1  M4 ( .b(vss), .d(Mclkneg), .g(net19), .s(net15));
ctranif1  M1 ( .b(vss), .d(net15), .g(Tclkpos), .s(net069));
ctranif0  MP3 ( .b(vdd), .s(net069), .g(EnInv), .d(In));
ctranif0  MP4 ( .b(vdd), .s(Out), .g(En), .d(net069));
ctranif0  M11 ( .b(vdd), .s(net036), .g(Out), .d(vdd));
ctranif0  M9 ( .b(vdd), .s(vdd), .g(net024), .d(Out));
ctranif0  M5 ( .b(vdd), .s(Mclkpos), .g(net15), .d(net19));
ctranif0  M3 ( .b(vdd), .s(net15), .g(net19), .d(Mclkpos));
ctranif0  M2 ( .b(vdd), .s(net069), .g(Tclkneg), .d(net15));

endmodule
// Library - MIPS25, Cell - Register_En16b, View - schematic
// LAST TIME SAVED: Jul  4 10:15:01 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module Register_En16b ( 
output  [15:0] out, 
input   En, 
input   EnInv, 
input   Fclkneg, 
input   Fclkpos, 
input   Mclkneg, 
input   Mclkpos, 
input   Tclkneg, 
input   Tclkpos, 
input  [15:0] in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "Register_En16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

flipflop_En2b I0[15:0] ( out[15:0], En, EnInv, Fclkneg, Fclkpos,
     in[15:0], Mclkneg, Mclkpos, Tclkneg, Tclkpos, vdd, vss);

endmodule
// Library - MIPS25, Cell - mux2to1, View - schematic
// LAST TIME SAVED: Jun 16 20:48:24 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module mux2to1 ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );

wire net35 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux2to1";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(b), .g(net35), .s(out));
ctranif1  MN0 ( .b(vss), .d(a), .g(in), .s(out));
ctranif1  MN1 ( .b(vss), .d(net35), .g(in), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(out), .g(in), .d(b));
ctranif0  MP0 ( .b(vdd), .s(out), .g(net35), .d(a));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(net35));

endmodule
// Library - MIPS25, Cell - InstrDataReg, View - schematic
// LAST TIME SAVED: Aug 27 14:04:04 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module InstrDataReg ( 
output  [4:0] a3, 
output  [15:0] io, 
output  [31:0] out, 
output  [15:0] out_wd, 
input  [15:0] ALU_in, 
input   Fclk, 
input   IRWr0, 
input   IRWr1, 
input   MemWrite, 
input   MemtoReg, 
input   RegDst, 
input   Tclk, 
input  [15:0] WriteData, 
input  [10:10] clkneg, 
input  [10:10] clkpos, 
input  [15:0] data_in, 
input   vdd, 
input   vss );

wire net20 ;

wire net18 ;

wire net3 ;

wire net7 ;

wire net6 ;

wire net5 ;

wire net13 ;

wire net4 ;

// Buses in the design

wire [0:15]  net1;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "InstrDataReg";
    specparam CDS_VIEWNAME = "schematic";
endspecify

Register16b I75 ( net1[0:15], net20, Fclk, net18, Tclk, clkneg[10],
     clkpos[10], data_in[15:0], vdd, vss);
mux2to1_irr I59[15:0] ( data_in[15:0], WriteData[15:0], io[15:0],
     MemWrite, vdd, vss);
inv_fo16_irr I63 ( net6, Fclk, vdd, vss);
inv_fo16_irr I62 ( net7, IRWr0, vdd, vss);
inv_fo16_irr I61 ( net5, Fclk, vdd, vss);
inv_fo16_irr I60 ( net4, IRWr1, vdd, vss);
inv_fo16_irr I73 ( net13, Tclk, vdd, vss);
inv_fo16_irr I74 ( net3, Tclk, vdd, vss);
inv_fo16_irr I76 ( net20, Fclk, vdd, vss);
inv_fo16_irr I77 ( net18, Tclk, vdd, vss);
Register_En16b I65 ( out[15:0], IRWr0, net7, net6, Fclk, clkneg[10],
     clkpos[10], net3, Tclk, data_in[15:0], vdd, vss);
Register_En16b I64 ( out[31:16], IRWr1, net4, net5, Fclk, clkneg[10],
     clkpos[10], net13, Tclk, data_in[15:0], vdd, vss);
mux2to1 I72[15:0] ( out_wd[15:0], net1[0:15], ALU_in[15:0], vss, vdd,
     MemtoReg, vdd, vss);
mux2to1 I70 ( a3[0], out[11], out[16], vss, vdd, RegDst, vdd, vss);
mux2to1 I69 ( a3[1], out[12], out[17], vss, vdd, RegDst, vdd, vss);
mux2to1 I68 ( a3[2], out[13], out[18], vss, vdd, RegDst, vdd, vss);
mux2to1 I67 ( a3[3], out[14], out[19], vss, vdd, RegDst, vdd, vss);
mux2to1 I66 ( a3[4], out[15], out[20], vss, vdd, RegDst, vdd, vss);

endmodule
// Library - MIPS25, Cell - PC, View - schematic
// LAST TIME SAVED: Jul 30 19:32:46 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module PC ( 
output  [15:0] fan_out, 
output  [15:0] out, 
input   Fclk, 
input   IorD, 
input   PC_En, 
input  cdsNet0, 
input   Tclk, 
input  [10:10] clkneg, 
input  [10:10] clkpos, 
input  [15:0] in, 
input  [15:0] mux_in, 
input   vdd, 
input   vss );

wire cdsNet1 ;

wire cdsNet2 ;

// Buses in the design

wire [0:15]  net9;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "PC";
    specparam CDS_VIEWNAME = "schematic";
endspecify

mux2to1 I51[15:0] ( net9[0:15], mux_in[15:0], out[15:0], vss, vdd,
     IorD, vdd, vss);
inv_fo16_irr I54 ( cdsNet1, Tclk, vdd, vss);
inv_fo16_irr I52[15:0] ( fan_out[15:0], net9[0:15], vdd, vss);
inv_fo16_irr I1 ( cdsNet2, Fclk, vdd, vss);
Register_En16b I0 ( out[15:0], PC_En, cdsNet0, cdsNet2, Fclk,
     clkneg[10], clkpos[10], cdsNet1, Tclk, in[15:0], vdd, vss);

endmodule
// Library - MIPS25, Cell - inv_fo64, View - schematic
// LAST TIME SAVED: Apr 30 10:43:22 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module inv_fo64 ( 
output   out, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo64";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - sram_2port_writedriver, View - schematic
// LAST TIME SAVED: Nov  7 19:39:06 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_2port_writedriver ( 
output   bitA, 
output   bitnotA, 
input   clkneg1, 
input   clkneg2, 
input   clkpos1, 
input   clkpos2, 
input   in, 
input   vdd, 
input   vss, 
input   write );

wire net1 ;

wire net2 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_writedriver";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(bitnotA), .g(write), .s(net2));
ctranif1  MN11 ( .b(vss), .d(bitA), .g(write), .s(net1));
ctranif1  MN7 ( .b(vss), .d(net2), .g(in), .s(clkneg1));
ctranif1  MN8 ( .b(vss), .d(net1), .g(net2), .s(clkneg2));
ctranif0  MP8 ( .b(vdd), .s(clkpos1), .g(in), .d(net2));
ctranif0  MP9 ( .b(vdd), .s(clkpos2), .g(net2), .d(net1));

endmodule
// Library - MIPS25, Cell - sram1b_2port, View - schematic
// LAST TIME SAVED: Aug  5 16:07:17 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram1b_2port ( 
inout   bitA, 
inout   bitnotA, 
inout   bitnotB, 
input   PEn, 
input   PEnnot, 
input   srclkneg, 
input   srclkpos, 
input   vdd, 
input   vss, 
input   wordA, 
input   wordB );

wire net2 ;

wire net4 ;

wire net5 ;

wire net3 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN23 ( .b(vss), .d(net2), .g(net5), .s(net4));
ctranif1  MN22 ( .b(vss), .d(net5), .g(wordA), .s(bitA));
ctranif1  MN21 ( .b(vss), .d(bitnotA), .g(wordA), .s(net2));
ctranif1  MN20 ( .b(vss), .d(net4), .g(net2), .s(net5));
ctranif1  MN19 ( .b(vss), .d(vss), .g(PEnnot), .s(net4));
ctranif1  MN18 ( .b(vss), .d(net4), .g(PEn), .s(srclkneg));
ctranif1  MN49 ( .b(vss), .d(bitnotB), .g(wordB), .s(net2));
ctranif0  MP17 ( .b(vdd), .s(net5), .g(net2), .d(net3));
ctranif0  MP16 ( .b(vdd), .s(net3), .g(net5), .d(net2));
ctranif0  MP15 ( .b(vdd), .s(srclkpos), .g(PEnnot), .d(net3));
ctranif0  MP14 ( .b(vdd), .s(net3), .g(PEn), .d(vdd));

endmodule
// Library - MIPS25, Cell - sram_2port_sensor, View - schematic
// LAST TIME SAVED: Jul  1 11:17:36 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_2port_sensor ( 
output   outA, 
input   bitnot, 
input   clkneg1, 
input   clkpos1, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_sensor";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN46 ( .b(vss), .d(outA), .g(bitnot), .s(clkneg1));
ctranif0  MP38 ( .b(vdd), .s(clkpos1), .g(bitnot), .d(outA));

endmodule
// Library - MIPS25, Cell - sram1b_2port_reg0, View - schematic
// LAST TIME SAVED: Jul  4 07:38:07 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram1b_2port_reg0 ( 
output   bitnotA, 
output   bitnotB, 
input   vdd, 
input   vss, 
input   wordA, 
input   wordB );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram1b_2port_reg0";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( .b(vss), .d(bitnotB), .g(wordB), .s(vdd));
ctranif1  MN2 ( .b(vss), .d(bitnotA), .g(wordA), .s(vdd));

endmodule
// Library - MIPS25, Cell - sram_nand2b, View - schematic
// LAST TIME SAVED: Jun 19 09:26:03 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nand2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(b), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(out));

endmodule
// Library - MIPS25, Cell - sram_invPhi2, View - schematic
// LAST TIME SAVED: Jul  4 17:22:32 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_invPhi2 ( 
output   out, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_invPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - sram_nand3b, View - schematic
// LAST TIME SAVED: Jun 16 21:06:07 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nand3b ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net018 ;

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nand3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(net018), .g(a), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(net014), .g(b), .s(net018));
ctranif1  MN1 ( .b(vss), .d(out), .g(c), .s(net014));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(a), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(c), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(b), .d(out));

endmodule
// Library - MIPS25, Cell - sram_nor2b_fo4_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:11:46 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nor2b_fo4_irr ( 
output   out, 
input   a, 
input   b, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - sram_inv_irr, View - schematic
// LAST TIME SAVED: Jul 11 07:19:55 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_inv_irr ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_inv_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - sram_nor2bPhi2, View - schematic
// LAST TIME SAVED: Jun 30 11:03:34 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nor2bPhi2 ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2bPhi2";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - sram_decoderB_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:16 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_decoderB_GLS2 ( 
output   WordB0, 
output   WordB1, 
input   ReadEn, 
input   clkneg, 
input   clkneg2, 
input   clkneg3, 
input   clkpos, 
input   clkpos2, 
input   clkpos3, 
input   in0B, 
input   in0BBar, 
input   in1B, 
input   in2B, 
input   in3B, 
input   in4B, 
input   vdd, 
input   vss );

wire net1 ;

wire net029 ;

wire net076 ;

wire net065 ;

wire net071 ;

wire net3 ;

wire net040 ;

wire net044 ;


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
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module inv_fo4 ( 
output   out, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN2 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP3 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - sram_nor3b, View - schematic
// LAST TIME SAVED: Jul 10 08:56:15 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nor3b ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net022 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(c), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(c), .d(out));
ctranif0  MP0 ( .b(vdd), .s(net022), .g(b), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(net022));

endmodule
// Library - MIPS25, Cell - sram_nor2b_irr, View - schematic
// LAST TIME SAVED: Jul  7 10:18:37 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_nor2b_irr ( 
output   out, 
input   a, 
input   b, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_nor2b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - sram_decoderA_GLS2, View - schematic
// LAST TIME SAVED: Aug 28 08:59:04 2025
// NETLIST TIME: Feb  2 20:06:54 2026
`timescale 1ns / 1ns 

module sram_decoderA_GLS2 ( 
output   PenOut0, 
output   PenOut0Bar, 
output   PenOut1, 
output   PenOut1Bar, 
output   WordA0, 
output   WordA1, 
input   ReadEn, 
input   RegWrtBar, 
input   WriteEn, 
input   clkneg, 
input   clkneg2, 
input   clkneg3, 
input   clkpos, 
input   clkpos2, 
input   clkpos3, 
input   in0A, 
input   in0ABar, 
input   in1A, 
input   in2A, 
input   in3A, 
input   in4A, 
input   vdd, 
input   vss );

wire net071 ;

wire net1 ;

wire net076 ;

wire net040 ;

wire net044 ;

wire net065 ;

wire net3 ;

wire net029 ;


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
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module sram_2port_bank ( 
output  [15:0] outA, 
output  [15:0] outB, 
input  [4:0] Addr_A, 
input  [4:0] Addr_B, 
input   ReadEn, 
input   RegWrtBar, 
input   WriteEn, 
input  [1:5] clkneg, 
input  [1:5] clkpos, 
input  [15:0] in, 
input   srclkneg, 
input   srclkpos, 
input   vdd, 
input   vss );

wire net924 ;

wire net60 ;

wire net82 ;

wire net77 ;

wire net545 ;

wire net539 ;

wire net2485 ;

wire net58 ;

wire net748 ;

wire net16 ;

wire net89 ;

wire net968 ;

wire net902 ;

wire net93 ;

wire net364 ;

wire net38 ;

wire net635 ;

wire net573 ;

wire net692 ;

wire net304 ;

wire net56 ;

wire net88 ;

wire net483 ;

wire net663 ;

wire net538 ;

wire net65 ;

wire net691 ;

wire net633 ;

wire net44 ;

wire net114 ;

wire net70 ;

wire net544 ;

wire net36 ;

wire net50 ;

wire net792 ;

wire net120 ;

wire net81 ;

wire net108 ;

wire net63 ;

wire net511 ;

wire net13 ;

wire net64 ;

wire net20 ;

wire net33 ;

wire net880 ;

wire net59 ;

wire net3161 ;

wire net543 ;

wire net946 ;

wire net35 ;

wire net1 ;

wire net42 ;

wire net48 ;

wire net51 ;

wire net9 ;

wire net26 ;

wire net57 ;

wire net29 ;

wire net101 ;

wire net78 ;

wire net39 ;

wire net27 ;

wire net723 ;

wire net84 ;

wire net3822 ;

wire net5906 ;

wire net584 ;

wire net31 ;

wire net98 ;

wire net19 ;

wire net85 ;

wire net10 ;

wire net331 ;

wire net53 ;

wire net34 ;

wire net724 ;

wire net423 ;

wire net355 ;

wire net572 ;

wire net21 ;

wire net1494 ;

wire net66 ;

wire net858 ;

wire net28 ;

wire net67 ;

wire net55 ;

wire net147 ;

wire net74 ;

wire net2302 ;

wire net334 ;

wire net87 ;

wire net54 ;

wire net4 ;

wire net14 ;

wire net37 ;

wire net95 ;

wire net3866 ;

wire net24 ;

wire net540 ;

wire net72 ;

wire net208 ;

wire net75 ;

wire net17 ;

wire net79 ;

wire net7 ;

wire net90 ;

wire net40 ;

wire net574 ;

wire net3789 ;

wire net2520 ;

wire net61 ;

wire net2000 ;

wire net32 ;

wire net634 ;

wire net207 ;

wire net119 ;

wire net662 ;

wire net11 ;

wire net15 ;

wire net52 ;

wire net86 ;

wire net3811 ;

wire net91 ;

wire net836 ;

wire net22 ;

wire net92 ;

wire net23 ;

wire net68 ;

wire net591 ;

wire net12 ;

wire net693 ;

wire net3 ;

wire net8 ;

wire net604 ;

wire net474 ;

wire net396 ;

wire net49 ;

wire net69 ;

wire net62 ;

wire net394 ;

wire net76 ;

wire net45 ;

wire net47 ;

wire net424 ;

wire net664 ;

wire net25 ;

wire net41 ;

wire net1488 ;

wire net452 ;

wire net582 ;

wire net814 ;

wire net720 ;

wire net425 ;

wire net30 ;

wire net73 ;

wire net121 ;

wire net43 ;

wire net2 ;

wire net395 ;

wire net80 ;

wire net110 ;

wire net18 ;

wire net375 ;

wire net46 ;

wire net770 ;

wire net6 ;

wire net583 ;

wire net5 ;

wire net109 ;

wire net83 ;

wire net100 ;

wire net484 ;

wire net275 ;

wire net186 ;

wire net71 ;

wire net482 ;

// Buses in the design

wire [0:4]  Addr_BBar;

wire [0:4]  Addr_ABar;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "sram_2port_bank";
    specparam CDS_VIEWNAME = "schematic";
endspecify

sram_2port_writedriver I2143 ( net83, net208, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[0], vdd, vss, WriteEn);
sram_2port_writedriver I2128 ( net5906, net2000, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[15], vdd, vss, WriteEn);
sram_2port_writedriver I2142 ( net540, net539, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[1], vdd, vss, WriteEn);
sram_2port_writedriver I2141 ( net584, net583, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[2], vdd, vss, WriteEn);
sram_2port_writedriver I2140 ( net88, net87, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[3], vdd, vss, WriteEn);
sram_2port_writedriver I2139 ( net110, net109, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[4], vdd, vss, WriteEn);
sram_2port_writedriver I2138 ( net22, net21, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[5], vdd, vss, WriteEn);
sram_2port_writedriver I2137 ( net11, net10, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[6], vdd, vss, WriteEn);
sram_2port_writedriver I2136 ( net33, net32, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[7], vdd, vss, WriteEn);
sram_2port_writedriver I2135 ( net121, net120, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[8], vdd, vss, WriteEn);
sram_2port_writedriver I2134 ( net55, net54, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[9], vdd, vss, WriteEn);
sram_2port_writedriver I2133 ( net3866, net1488, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[10], vdd, vss, WriteEn);
sram_2port_writedriver I2132 ( net3811, net2485, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[11], vdd, vss, WriteEn);
sram_2port_writedriver I2131 ( net3789, net2302, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[12], vdd, vss, WriteEn);
sram_2port_writedriver I2130 ( net3822, net1494, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[13], vdd, vss, WriteEn);
sram_2port_writedriver I2129 ( net3161, net2520, clkneg[2], clkneg[3],
     clkpos[2], clkpos[3], in[14], vdd, vss, WriteEn);
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
sram_2port_sensor I2127 ( outB[0], net207, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2126 ( outB[1], net538, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2125 ( outB[2], net582, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2124 ( outB[3], net86, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2073 ( outA[6], net10, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2070 ( outA[9], net54, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2114 ( outB[13], net474, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2065 ( outA[14], net2520, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2119 ( outB[8], net119, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2078 ( outA[1], net539, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2068 ( outA[11], net2485, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2123 ( outB[4], net108, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2112 ( outB[15], net375, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2115 ( outB[12], net355, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2074 ( outA[5], net21, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2067 ( outA[12], net2302, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2116 ( outB[11], net331, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2071 ( outA[8], net120, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2077 ( outA[2], net583, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2064 ( outA[15], net2000, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2118 ( outB[9], net53, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2121 ( outB[6], net9, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2122 ( outB[5], net20, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2079 ( outA[0], net208, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2066 ( outA[13], net1494, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2069 ( outA[10], net1488, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2117 ( outB[10], net186, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2076 ( outA[3], net87, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2120 ( outB[7], net31, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2113 ( outB[14], net98, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2072 ( outA[7], net32, clkneg[5], clkpos[5], vdd,
     vss);
sram_2port_sensor I2075 ( outA[4], net109, clkneg[5], clkpos[5], vdd,
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
sram_decoderB_GLS2 I2203 ( net114, net67, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_BBar[2], Addr_B[3], Addr_B[4], vdd,
     vss);
sram_decoderB_GLS2 I2204 ( net147, net68, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_BBar[2], Addr_B[3], Addr_B[4],
     vdd, vss);
sram_decoderB_GLS2 I2205 ( net591, net71, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_B[2], Addr_BBar[3], Addr_B[4], vdd,
     vss);
sram_decoderB_GLS2 I2206 ( net748, net75, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_B[2], Addr_BBar[3], Addr_B[4],
     vdd, vss);
sram_decoderB_GLS2 I2207 ( net770, net79, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_BBar[2], Addr_BBar[3], Addr_B[4],
     vdd, vss);
sram_decoderB_GLS2 I2202 ( net77, net66, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_B[2], Addr_B[3], Addr_B[4], vdd,
     vss);
sram_decoderB_GLS2 I2209 ( net814, net84, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_B[2], Addr_B[3], Addr_BBar[4], vdd,
     vss);
sram_decoderB_GLS2 I2210 ( net836, net85, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_B[2], Addr_B[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2211 ( net858, net89, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_BBar[2], Addr_B[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2212 ( net880, net90, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_BBar[2], Addr_B[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2208 ( net792, net82, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_BBar[2], Addr_BBar[3], Addr_B[4],
     vdd, vss);
sram_decoderB_GLS2 I2213 ( net902, net91, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_B[2], Addr_BBar[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2214 ( net924, net95, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_B[2], Addr_BBar[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2215 ( net946, net100, ReadEn, clkneg[1],
     clkneg[2], clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_BBar[2], Addr_BBar[3], Addr_BBar[4],
     vdd, vss);
sram_decoderB_GLS2 I2216 ( net968, net101, ReadEn, clkneg[1],
     clkneg[2], clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_BBar[1], Addr_BBar[2], Addr_BBar[3],
     Addr_BBar[4], vdd, vss);
sram_decoderB_GLS2 I2181 ( net30, net63, ReadEn, clkneg[1], clkneg[2],
     clkneg[3], clkpos[1], clkpos[2], clkpos[3], Addr_B[0],
     Addr_BBar[0], Addr_B[1], Addr_B[2], Addr_B[3], Addr_B[4], vdd,
     vss);
inv_fo4 I2221 ( Addr_ABar[1], clkneg[1], clkpos[1], Addr_A[1], vdd,
     vss);
inv_fo4 I2222 ( Addr_ABar[2], clkneg[1], clkpos[1], Addr_A[2], vdd,
     vss);
inv_fo4 I2223 ( Addr_ABar[3], clkneg[1], clkpos[1], Addr_A[3], vdd,
     vss);
inv_fo4 I2224 ( Addr_ABar[4], clkneg[1], clkpos[1], Addr_A[4], vdd,
     vss);
inv_fo4 I2197 ( Addr_BBar[0], clkneg[1], clkpos[1], Addr_B[0], vdd,
     vss);
inv_fo4 I2220 ( Addr_BBar[4], clkneg[1], clkpos[1], Addr_B[4], vdd,
     vss);
inv_fo4 I2218 ( Addr_BBar[2], clkneg[1], clkpos[1], Addr_B[2], vdd,
     vss);
inv_fo4 I2219 ( Addr_BBar[3], clkneg[1], clkpos[1], Addr_B[3], vdd,
     vss);
inv_fo4 I2217 ( Addr_BBar[1], clkneg[1], clkpos[1], Addr_B[1], vdd,
     vss);
inv_fo4 I2176 ( Addr_ABar[0], clkneg[1], clkpos[1], Addr_A[0], vdd,
     vss);
sram_decoderA_GLS2 I2175 ( net724, net723, net58, net49, net720, net59,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_ABar[2], Addr_ABar[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2174 ( net693, net692, net39, net38, net691, net57,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_ABar[2], Addr_ABar[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2173 ( net664, net663, net6, net5, net662, net56,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_A[2], Addr_ABar[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2172 ( net635, net634, net15, net14, net633, net52,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_A[2], Addr_ABar[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2171 ( net93, net92, net61, net60, net604, net51,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_ABar[2], Addr_A[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2170 ( net574, net573, net2, net1, net572, net50,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_ABar[2], Addr_A[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2169 ( net545, net544, net4, net3, net543, net48,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_A[2], Addr_A[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2168 ( net74, net73, net42, net41, net511, net44,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_A[2], Addr_A[3], Addr_ABar[4], vdd, vss);
sram_decoderA_GLS2 I2167 ( net484, net483, net13, net8, net482, net40,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_ABar[2], Addr_ABar[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2166 ( net69, net65, net18, net17, net452, net36,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_ABar[2], Addr_ABar[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2165 ( net425, net424, net47, net46, net423, net34,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_A[2], Addr_ABar[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2164 ( net396, net395, net24, net19, net394, net27,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_A[2], Addr_ABar[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2163 ( net64, net62, net26, net25, net364, net23,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_ABar[2], Addr_A[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2162 ( net78, net76, net29, net28, net334, net16,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_ABar[2], Addr_A[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2161 ( net81, net80, net45, net43, net304, net12,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_ABar[1], Addr_A[2], Addr_A[3], Addr_A[4], vdd, vss);
sram_decoderA_GLS2 I2160 ( net72, net70, net37, net35, net275, net7,
     ReadEn, RegWrtBar, WriteEn, clkneg[2], clkneg[3], clkneg[4],
     clkpos[2], clkpos[3], clkpos[4], Addr_A[0], Addr_ABar[0],
     Addr_A[1], Addr_A[2], Addr_A[3], Addr_A[4], vdd, vss);

endmodule
// Library - MIPS25, Cell - inv_fo16, View - schematic
// LAST TIME SAVED: Jun 16 20:44:11 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module inv_fo16 ( 
output   out, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo16";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN15 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN14 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN13 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN12 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN11 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN10 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN9 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN8 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN7 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN6 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN5 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN4 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN2 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN3 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP15 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP14 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP13 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP12 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP11 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP10 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP9 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP8 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP7 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP6 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP5 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP4 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP3 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(in), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - nand2b, View - schematic
// LAST TIME SAVED: Jul 23 16:01:00 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module nand2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(b), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(out));

endmodule
// Library - MIPS25, Cell - mux4to1, View - schematic
// LAST TIME SAVED: Jul 22 14:13:21 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module mux4to1 ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkneg1, 
input   clkpos, 
input   clkpos1, 
input   d, 
input   in0, 
input   in1, 
input   vdd, 
input   vss );

wire net097 ;

wire net072 ;

wire net079 ;

wire net0105 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux4to1";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN8 ( .b(vss), .d(net0105), .g(in1), .s(clkneg1));
ctranif1  MN7 ( .b(vss), .d(net072), .g(in1), .s(out));
ctranif1  MN6 ( .b(vss), .d(net079), .g(net0105), .s(out));
ctranif1  MN5 ( .b(vss), .d(d), .g(net097), .s(net079));
ctranif1  MN4 ( .b(vss), .d(c), .g(in0), .s(net079));
ctranif1  MN2 ( .b(vss), .d(b), .g(net097), .s(net072));
ctranif1  MN0 ( .b(vss), .d(a), .g(in0), .s(net072));
ctranif1  MN1 ( .b(vss), .d(net097), .g(in0), .s(clkneg));
ctranif0  MP8 ( .b(vdd), .s(out), .g(in1), .d(net079));
ctranif0  MP7 ( .b(vdd), .s(clkpos1), .g(in1), .d(net0105));
ctranif0  MP6 ( .b(vdd), .s(out), .g(net0105), .d(net072));
ctranif0  MP5 ( .b(vdd), .s(net079), .g(net097), .d(c));
ctranif0  MP3 ( .b(vdd), .s(net079), .g(in0), .d(d));
ctranif0  MP2 ( .b(vdd), .s(net072), .g(in0), .d(b));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in0), .d(net097));
ctranif0  MP0 ( .b(vdd), .s(net072), .g(net097), .d(a));

endmodule
// Library - MIPS25, Cell - mux3to1_16b, View - schematic
// LAST TIME SAVED: Jun 16 21:52:53 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module mux3to1_16b ( 
output  [15:0] out, 
input  [15:0] b, 
input  [15:0] c, 
input   clkneg, 
input   clkneg1, 
input   clkpos, 
input   clkpos1, 
input  [15:0] d, 
input   in0, 
input   in1, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux3to1_16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

mux4to1 I17[15:0] ( out[15:0], vss, b[15:0], c[15:0], clkneg, clkneg1,
     clkpos, clkpos1, d[15:0], in0, in1, vdd, vss);

endmodule
// Library - MIPS25, Cell - cond_inv2b, View - schematic
// LAST TIME SAVED: Jun 16 20:14:03 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module cond_inv2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net31 ;

wire net30 ;

wire net23 ;

wire net28 ;

wire net29 ;

wire net18 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "cond_inv2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif0  MP1 ( .b(vdd), .s(net30), .g(a), .d(out));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(net23), .d(net30));
ctranif0  M6 ( .b(vdd), .s(net31), .g(net18), .d(out));
ctranif0  M4 ( .b(vdd), .s(clkpos), .g(b), .d(net31));
ctranif0  M12 ( .b(vdd), .s(clkpos), .g(b), .d(net23));
ctranif0  M0 ( .b(vdd), .s(clkpos), .g(a), .d(net18));
ctranif1  M10 ( .b(vss), .d(out), .g(net18), .s(net28));
ctranif1  M8 ( .b(vss), .d(net28), .g(net23), .s(clkneg));
ctranif1  M7 ( .b(vss), .d(net29), .g(b), .s(clkneg));
ctranif1  M5 ( .b(vss), .d(out), .g(a), .s(net29));
ctranif1  M3 ( .b(vss), .d(net23), .g(b), .s(clkneg));
ctranif1  M13 ( .b(vss), .d(net18), .g(a), .s(clkneg));

endmodule
// Library - MIPS25, Cell - cond_inv16b, View - schematic
// LAST TIME SAVED: Jun 16 20:15:52 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module cond_inv16b ( 
output  [15:0] out, 
input  [15:0] a, 
input  [15:0] b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "cond_inv16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

cond_inv2b I16[15:0] ( out[15:0], a[15:0], b[15:0], clkneg, clkpos,
     vdd, vss);

endmodule
// Library - MIPS25, Cell - and2b, View - schematic
// LAST TIME SAVED: Jun 16 16:35:57 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module and2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkneg2, 
input   clkpos, 
input   clkpos2, 
input   vdd, 
input   vss );

wire net014 ;

wire net017 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "and2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(clkneg));
ctranif1  MN2 ( .b(vss), .d(out), .g(net017), .s(clkneg2));
ctranif1  MN1 ( .b(vss), .d(net017), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(b), .d(net017));
ctranif0  MP2 ( .b(vdd), .s(clkpos2), .g(net017), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(net017));

endmodule
// Library - MIPS25, Cell - and16b, View - schematic
// LAST TIME SAVED: Jun 16 16:42:25 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module and16b ( 
output  [15:0] out, 
input  [15:0] a, 
input  [15:0] b, 
input   clkneg, 
input   clkneg2, 
input   clkpos, 
input   clkpos2, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "and16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

and2b I0[15:0] ( out[15:0], a[15:0], b[15:0], clkneg, clkneg2, clkpos,
     clkpos2, vdd, vss);

endmodule
// Library - MIPS25, Cell - nor3b, View - schematic
// LAST TIME SAVED: Jun 16 21:13:37 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module nor3b ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net022 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(c), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(c), .d(out));
ctranif0  MP0 ( .b(vdd), .s(net022), .g(b), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(net022));

endmodule
// Library - MIPS25, Cell - xor2b, View - schematic
// LAST TIME SAVED: Jun 16 21:24:43 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module xor2b ( 
output   Cout, 
input   A, 
input   B, 
input   clkneg1, 
input   clkneg2, 
input   clkpos1, 
input   clkpos2, 
input   vdd, 
input   vss );

wire net042 ;

wire net018 ;

wire net027 ;

wire net022 ;

wire net016 ;

wire net043 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "xor2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN7 ( .b(vss), .d(net022), .g(B), .s(clkneg1));
ctranif1  MN6 ( .b(vss), .d(Cout), .g(net027), .s(net042));
ctranif1  MN1 ( .b(vss), .d(net027), .g(A), .s(clkneg1));
ctranif1  MN2 ( .b(vss), .d(Cout), .g(A), .s(net018));
ctranif1  MN5 ( .b(vss), .d(net042), .g(net022), .s(clkneg2));
ctranif1  MN4 ( .b(vss), .d(net018), .g(B), .s(clkneg2));
ctranif0  MP7 ( .b(vdd), .s(clkpos1), .g(B), .d(net022));
ctranif0  MP1 ( .b(vdd), .s(clkpos1), .g(A), .d(net027));
ctranif0  MP6 ( .b(vdd), .s(net016), .g(A), .d(Cout));
ctranif0  MP0 ( .b(vdd), .s(clkpos2), .g(B), .d(net043));
ctranif0  MP4 ( .b(vdd), .s(clkpos2), .g(net022), .d(net016));
ctranif0  MP5 ( .b(vdd), .s(net043), .g(net027), .d(Cout));

endmodule
// Library - MIPS25, Cell - xor16b, View - schematic
// LAST TIME SAVED: Jun 16 21:26:56 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module xor16b ( 
output  [15:0] Cout, 
input  [15:0] A, 
input  [15:0] B, 
input   clkneg1, 
input   clkneg2, 
input   clkpos1, 
input   clkpos2, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "xor16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

xor2b I0[15:0] ( Cout[15:0], A[15:0], B[15:0], clkneg1, clkneg2,
     clkpos1, clkpos2, vdd, vss);

endmodule
// Library - MIPS25, Cell - inv, View - schematic
// LAST TIME SAVED: Sep 11 10:05:43 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module inv ( 
output   out, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - nand3b, View - schematic
// LAST TIME SAVED: Jun 16 21:06:07 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module nand3b ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net018 ;

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand3b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(net018), .g(a), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(net014), .g(b), .s(net018));
ctranif1  MN1 ( .b(vss), .d(out), .g(c), .s(net014));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(a), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(c), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(b), .d(out));

endmodule
// Library - MIPS25, Cell - nor2b_fo4, View - schematic
// LAST TIME SAVED: Aug 14 10:53:00 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module nor2b_fo4 ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor2b_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - zero_detector, View - schematic
// LAST TIME SAVED: Jul 29 13:53:55 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module zero_detector ( out_Bar, A[15:0], B[15:0], clkneg[0], clkneg[1],
     clkneg[2], clkneg[3], clkneg[4], clkpos[0], clkpos[1], clkpos[2],
     clkpos[3], clkpos[4], vdd, vss );

output out_Bar;

input vdd;
input vss;

input  [15:0]  A;
input  [0:4]  clkneg;
input  [15:0]  B;
input  [0:4]  clkpos;

wire net08 ;

wire net06 ;

wire net039 ;

wire net027 ;

wire net52 ;

wire net010 ;

wire net016 ;

wire net49 ;

// Buses in the design

wire [15:0]  Cout;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "zero_detector";
    specparam CDS_VIEWNAME = "schematic";
endspecify

nor3b I5 ( net039, Cout[3], Cout[2], Cout[1], clkneg[2], clkpos[2],
     vdd, vss);
nor3b I4 ( net010, Cout[6], Cout[5], Cout[4], clkneg[2], clkpos[2],
     vdd, vss);
nor3b I3 ( net027, Cout[9], Cout[8], Cout[7], clkneg[2], clkpos[2],
     vdd, vss);
nor3b I2 ( net06, Cout[12], Cout[11], Cout[10], clkneg[2], clkpos[2],
     vdd, vss);
nor3b I1 ( net49, Cout[15], Cout[14], Cout[13], clkneg[2], clkpos[2],
     vdd, vss);
xor16b I9 ( Cout[15:0], A[15:0], B[15:0], clkneg[0], clkneg[1],
     clkpos[0], clkpos[1], vdd, vss);
inv I6 ( net016, clkneg[2], clkpos[2], Cout[0], vdd, vss);
nand3b I11 ( net08, net010, net039, net016, clkneg[3], clkpos[3], vdd,
     vss);
nand3b I10 ( net52, net49, net06, net027, clkneg[3], clkpos[3], vdd,
     vss);
nor2b_fo4 I14 ( out_Bar, net52, net08, clkneg[4], clkpos[4], vdd, vss);

endmodule
// Library - MIPS25, Cell - or2b, View - schematic
// LAST TIME SAVED: Jun 16 21:18:02 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module or2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkneg2, 
input   clkpos, 
input   clkpos2, 
input   vdd, 
input   vss );

wire net017 ;

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "or2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(net017), .g(b), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(net017), .g(a), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(net017), .s(clkneg2));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(net017));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(a), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(clkpos2), .g(net017), .d(out));

endmodule
// Library - MIPS25, Cell - or16b, View - schematic
// LAST TIME SAVED: Jun 16 21:19:57 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module or16b ( 
output  [15:0] out, 
input  [15:0] a, 
input  [15:0] b, 
input   clkneg, 
input   clkneg2, 
input   clkpos, 
input   clkpos2, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "or16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

or2b I0[15:0] ( out[15:0], a[15:0], b[15:0], clkneg, clkneg2, clkpos,
     clkpos2, vdd, vss);

endmodule
// Library - MIPS25, Cell - black_cell2b, View - schematic
// LAST TIME SAVED: Jun 16 20:08:49 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module black_cell2b ( 
output   Gout, 
output   Pout, 
input   G, 
input   Gprev, 
input   P, 
input   Pin, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net039 ;

wire net018 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "black_cell2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(Gout), .g(Gprev), .s(net018));
ctranif1  MN0 ( .b(vss), .d(Gout), .g(G), .s(clkneg));
ctranif1  MN4 ( .b(vss), .d(net018), .g(P), .s(clkneg));
ctranif1  MN5 ( .b(vss), .d(net039), .g(Pin), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(Pout), .g(P), .s(net039));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(G), .d(Gout));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(P), .d(net016));
ctranif0  MP4 ( .b(vdd), .s(clkpos), .g(Gprev), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(P), .d(Pout));
ctranif0  MP5 ( .b(vdd), .s(clkpos), .g(Pin), .d(Pout));

endmodule
// Library - MIPS25, Cell - gray_cell_inv2b, View - schematic
// LAST TIME SAVED: Jun 16 20:21:17 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module gray_cell_inv2b ( 
output   Cout, 
input   G, 
input   Gprev, 
input   P, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net018 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "gray_cell_inv2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(Cout), .g(G), .s(net018));
ctranif1  MN0 ( .b(vss), .d(net018), .g(Gprev), .s(clkneg));
ctranif1  MN4 ( .b(vss), .d(net018), .g(P), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(Gprev), .d(Cout));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(P), .d(net016));
ctranif0  MP4 ( .b(vdd), .s(clkpos), .g(G), .d(Cout));

endmodule
// Library - MIPS25, Cell - black_cell_inv2b, View - schematic
// LAST TIME SAVED: Jun 16 20:11:41 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module black_cell_inv2b ( 
output   Cout, 
output   Pout, 
input   G, 
input   Gprev, 
input   P, 
input   Pprev, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net018 ;

wire net036 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "black_cell_inv2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(Cout), .g(G), .s(net018));
ctranif1  MN0 ( .b(vss), .d(net018), .g(Gprev), .s(clkneg));
ctranif1  MN4 ( .b(vss), .d(net018), .g(P), .s(clkneg));
ctranif1  MN5 ( .b(vss), .d(Pout), .g(Pprev), .s(clkneg));
ctranif1  MN6 ( .b(vss), .d(Pout), .g(P), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(Gprev), .d(Cout));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(P), .d(net016));
ctranif0  MP4 ( .b(vdd), .s(clkpos), .g(G), .d(Cout));
ctranif0  MP5 ( .b(vdd), .s(clkpos), .g(Pprev), .d(net036));
ctranif0  MP6 ( .b(vdd), .s(net036), .g(P), .d(Pout));

endmodule
// Library - MIPS25, Cell - gray_cell2b, View - schematic
// LAST TIME SAVED: Jun 16 20:19:01 2025
// NETLIST TIME: Feb  2 20:06:55 2026
`timescale 1ns / 1ns 

module gray_cell2b ( 
output   Cout, 
input   G, 
input   Gprev, 
input   P, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;

wire net018 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "gray_cell2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(Cout), .g(Gprev), .s(net018));
ctranif1  MN0 ( .b(vss), .d(Cout), .g(G), .s(clkneg));
ctranif1  MN4 ( .b(vss), .d(net018), .g(P), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(G), .d(Cout));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(P), .d(net016));
ctranif0  MP4 ( .b(vdd), .s(clkpos), .g(Gprev), .d(net016));

endmodule
// Library - MIPS25, Cell - adder, View - schematic
// LAST TIME SAVED: Jun 16 21:33:02 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module adder ( cout, out[0], out[1], out[2], out[3], out[4], out[5],
     out[6], out[7], out[8], out[9], out[10], out[11], out[12],
     out[13], out[14], out[15], a[0], a[1], a[2], a[3], a[4], a[5],
     a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15],
     b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7], b[8], b[9], b[10],
     b[11], b[12], b[13], b[14], b[15], cin, clkneg[0], clkneg[1],
     clkneg[2], clkneg[3], clkneg[4], clkneg[5], clkneg[6], clkneg[7],
     clkpos[0], clkpos[1], clkpos[2], clkpos[3], clkpos[4], clkpos[5],
     clkpos[6], clkpos[7], vdd, vss );

output cout;

input cin;
input vdd;
input vss;

output  [0:15]  out;

input  [0:7]  clkneg;
input  [0:7]  clkpos;
input  [0:15]  b;
input  [0:15]  a;

wire net0629 ;

wire net559 ;

wire net513 ;

wire net0736 ;

wire net0301 ;

wire net333 ;

wire net0308 ;

wire net557 ;

wire net439 ;

wire net0382 ;

wire net414 ;

wire net0628 ;

wire net0687 ;

wire net0684 ;

wire net0878 ;

wire net0197 ;

wire net456 ;

wire net279 ;

wire net487 ;

wire net458 ;

wire net640 ;

wire net496 ;

wire net573 ;

wire net503 ;

wire net591 ;

wire net0316 ;

wire net186 ;

wire net0726 ;

wire net313 ;

wire net228 ;

wire net319 ;

wire net0359 ;

wire net377 ;

wire net0361 ;

wire net316 ;

wire net0526 ;

wire net517 ;

wire net504 ;

wire net0314 ;

wire net214 ;

wire net521 ;

wire net0705 ;

wire net734 ;

wire net780 ;

wire net0699 ;

wire net0711 ;

wire net754 ;

wire net551 ;

wire net746 ;

wire net0324 ;

wire net434 ;

wire net283 ;

wire net301 ;

wire net0318 ;

wire net574 ;

wire net0341 ;

wire net327 ;

wire net0313 ;

wire net378 ;

wire net664 ;

wire net0377 ;

wire net298 ;

wire net0681 ;

wire net0425 ;

wire net393 ;

wire net280 ;

wire net0675 ;

wire net758 ;

wire net762 ;

wire net607 ;

wire net0287 ;

wire net386 ;

wire net0345 ;

wire net630 ;

wire net0449 ;

wire net0470 ;

wire net779 ;

wire net0373 ;

wire net172 ;

wire net0298 ;

wire net0743 ;

wire net289 ;

wire net417 ;

wire net0617 ;

wire net638 ;

wire net0385 ;

wire net0326 ;

wire net647 ;

wire net629 ;

wire net0353 ;

wire net0652 ;

wire net0848 ;

wire net136 ;

wire net463 ;

wire net480 ;

wire net0300 ;

wire net345 ;

wire net0866 ;

wire net0342 ;

wire net0338 ;

wire net0666 ;

wire net338 ;

wire net525 ;

wire net663 ;

wire net266 ;

wire net486 ;

wire net549 ;

wire net494 ;

wire net0731 ;

wire net291 ;

wire net528 ;

wire net455 ;

wire net193 ;

wire net0311 ;

wire net0441 ;

wire cin_inv ;

// Buses in the design

wire [0:15]  p1;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "adder";
    specparam CDS_VIEWNAME = "schematic";
endspecify

black_cell2b I87 ( net279, net0301, net0342, net327, net0338, net0743,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I86 ( net0361, net283, net0711, net333, net0449, net0359,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I85 ( net291, net289, net0705, net458, net0441, net0731,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I84 ( net378, net377, net0699, net345, net0313, net0345,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I83 ( net386, net301, net0311, net0342, net0425, net0338,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I82 ( net0629, net393, net0687, net0711, net513, net0449,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I81 ( net0326, net313, net0681, net0705, net521, net0441,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I80 ( net0617, net319, net0675, net0699, net0314, net0313,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I79 ( net0666, net417, net0308, net0311, net414, net0425,
     clkneg[4], clkpos[4], vdd, vss);
black_cell2b I61 ( net439, net551, net557, net549, p1[1], p1[0],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I60 ( net0736, net559, net734, net557, p1[2], p1[1],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I59 ( net455, net0382, net573, net734, p1[3], p1[2],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I58 ( net463, net0377, net574, net573, p1[4], p1[3],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I57 ( net456, net0373, net746, net574, p1[5], p1[4],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I56 ( net0726, net591, net0526, net746, p1[6], p1[5],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I55 ( net487, net0353, net754, net0526, p1[7], p1[6],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I54 ( net480, net607, net758, net754, p1[8], p1[7],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I53 ( net503, net486, net762, net758, p1[9], p1[8],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I52 ( net496, net494, net629, net762, p1[10], p1[9],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I51 ( net504, net517, net630, net629, p1[11], p1[10],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I50 ( net640, net525, net638, net630, p1[12], p1[11],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I49 ( net0684, net647, net0470, net638, p1[13], p1[12],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I48 ( net528, net0316, net779, net0470, p1[14], p1[13],
     clkneg[2], clkpos[2], vdd, vss);
black_cell2b I47 ( net664, net663, net780, net779, p1[15], p1[14],
     clkneg[2], clkpos[2], vdd, vss);
inv I126 ( cin_inv, clkneg[0], clkpos[0], cin, vdd, vss);
inv I125 ( net0287, clkneg[4], clkpos[4], net434, vdd, vss);
inv I124 ( net338, clkneg[4], clkpos[4], net0318, vdd, vss);
inv I104 ( net172, clkneg[5], clkpos[5], net0341, vdd, vss);
inv I103 ( net266, clkneg[5], clkpos[5], net0866, vdd, vss);
inv I102 ( net186, clkneg[5], clkpos[5], net0197, vdd, vss);
inv I101 ( net193, clkneg[5], clkpos[5], net0878, vdd, vss);
inv I78 ( net0324, clkneg[3], clkpos[3], net0385, vdd, vss);
gray_cell_inv2b I100 ( net280, net279, cin_inv, net0301, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I99 ( net0652, net0361, net0385, net283, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I98 ( net214, net291, net338, net289, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I97 ( net298, net378, net0287, net377, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I96 ( net228, net386, net0341, net301, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I95 ( net0628, net0629, net0866, net393, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I94 ( net316, net0326, net0197, net313, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I93 ( net136, net0617, net0878, net319, clkneg[5],
     clkpos[5], vdd, vss);
gray_cell_inv2b I77 ( net0318, net439, cin_inv, net551, clkneg[3],
     clkpos[3], vdd, vss);
gray_cell_inv2b I76 ( net434, net0736, net0385, net559, clkneg[3],
     clkpos[3], vdd, vss);
black_cell_inv2b I105 ( net0300, net0298, net0666, net279, net417,
     net0301, clkneg[5], clkpos[5], vdd, vss);
black_cell_inv2b I75 ( net327, net0743, net455, net439, net0382,
     net551, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I74 ( net333, net0359, net463, net0736, net0377,
     net559, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I73 ( net458, net0731, net456, net455, net0373,
     net0382, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I72 ( net345, net0345, net0726, net463, net591,
     net0377, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I71 ( net0342, net0338, net487, net456, net0353,
     net0373, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I70 ( net0711, net0449, net480, net0726, net607,
     net591, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I69 ( net0705, net0441, net503, net487, net486,
     net0353, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I68 ( net0699, net0313, net496, net480, net494,
     net607, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I67 ( net0311, net0425, net504, net503, net517,
     net486, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I66 ( net0687, net513, net640, net496, net525, net494,
     clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I65 ( net0681, net521, net0684, net504, net647,
     net517, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I64 ( net0675, net0314, net528, net640, net0316,
     net525, clkneg[3], clkpos[3], vdd, vss);
black_cell_inv2b I63 ( net0308, net414, net664, net0684, net663,
     net647, clkneg[3], clkpos[3], vdd, vss);
inv_fo16 I123 ( cout, clkneg[7], clkpos[7], net0848, vdd, vss);
and2b I30 ( net549, a[0], b[0], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I29 ( net557, a[1], b[1], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I28 ( net734, a[2], b[2], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I27 ( net573, a[3], b[3], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I26 ( net574, a[4], b[4], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I25 ( net746, a[5], b[5], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I24 ( net0526, a[6], b[6], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I23 ( net754, a[7], b[7], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I22 ( net758, a[8], b[8], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I21 ( net762, a[9], b[9], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I20 ( net629, a[10], b[10], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I19 ( net630, a[11], b[11], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I18 ( net638, a[12], b[12], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I17 ( net0470, a[13], b[13], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I16 ( net779, a[14], b[14], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
and2b I15 ( net780, a[15], b[15], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I121 ( out[0], p1[0], cin, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I120 ( out[1], p1[1], net0324, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I119 ( out[2], p1[2], net0318, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I118 ( out[3], p1[3], net434, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I117 ( out[4], p1[4], net172, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I116 ( out[5], p1[5], net266, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I115 ( out[6], p1[6], net186, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I114 ( out[7], p1[7], net193, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I113 ( out[8], p1[8], net280, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I112 ( out[9], p1[9], net0652, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I111 ( out[10], p1[10], net214, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I110 ( out[11], p1[11], net298, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I109 ( out[12], p1[12], net228, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I108 ( out[13], p1[13], net0628, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I107 ( out[14], p1[14], net316, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I106 ( out[15], p1[15], net136, clkneg[6], clkneg[7], clkpos[6],
     clkpos[7], vdd, vss);
xor2b I46 ( p1[0], a[0], b[0], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I45 ( p1[1], a[1], b[1], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I44 ( p1[2], a[2], b[2], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I43 ( p1[3], a[3], b[3], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I42 ( p1[4], a[4], b[4], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I41 ( p1[5], a[5], b[5], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I40 ( p1[6], a[6], b[6], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I39 ( p1[7], a[7], b[7], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I38 ( p1[8], a[8], b[8], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I37 ( p1[9], a[9], b[9], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I36 ( p1[10], a[10], b[10], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I35 ( p1[11], a[11], b[11], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I34 ( p1[12], a[12], b[12], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I33 ( p1[13], a[13], b[13], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I32 ( p1[14], a[14], b[14], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
xor2b I31 ( p1[15], a[15], b[15], clkneg[0], clkneg[1], clkpos[0],
     clkpos[1], vdd, vss);
gray_cell2b I122 ( net0848, net0300, net136, net0298, clkneg[6],
     clkpos[6], vdd, vss);
gray_cell2b I91 ( net0341, net327, cin, net0743, clkneg[4], clkpos[4],
     vdd, vss);
gray_cell2b I90 ( net0866, net333, net0324, net0359, clkneg[4],
     clkpos[4], vdd, vss);
gray_cell2b I89 ( net0197, net458, net0318, net0731, clkneg[4],
     clkpos[4], vdd, vss);
gray_cell2b I88 ( net0878, net345, net434, net0345, clkneg[4],
     clkpos[4], vdd, vss);
gray_cell2b I62 ( net0385, net549, cin, p1[0], clkneg[2], clkpos[2],
     vdd, vss);

endmodule
// Library - MIPS25, Cell - mux4to1_16b, View - schematic
// LAST TIME SAVED: Jun 16 21:01:39 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module mux4to1_16b ( 
output  [15:0] out, 
input  [15:0] a, 
input  [15:0] b, 
input  [15:0] c, 
input   clkneg, 
input   clkneg1, 
input   clkpos, 
input   clkpos1, 
input  [15:0] d, 
input   in0, 
input   in1, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux4to1_16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

mux4to1 I17[15:0] ( out[15:0], a[15:0], b[15:0], c[15:0], clkneg,
     clkneg1, clkpos, clkpos1, d[15:0], in0, in1, vdd, vss);

endmodule
// Library - MIPS25, Cell - mux2to1_16b, View - schematic
// LAST TIME SAVED: Jun 16 20:50:12 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module mux2to1_16b ( 
output  [15:0] out, 
input  [15:0] a, 
input  [15:0] b, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux2to1_16b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

mux2to1 I0[15:0] ( out[15:0], a[15:0], b[15:0], clkneg, clkpos, in,
     vdd, vss);

endmodule
// Library - MIPS25, Cell - ALU, View - schematic
// LAST TIME SAVED: Sep 14 11:18:32 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module ALU ( a_regout, alu_out, out, out_Zero_DetectBar, ALU_Control0,
     ALU_Control1, A_mux, Adder_Cin, B_mux0, B_mux1, Fclkpos, PC_in,
     STL, SUB, Tclkpos, a, b, clkneg, clkpos, instr_in, mux3_0, mux3_1,
     vdd, vss );

output out_Zero_DetectBar;

input ALU_Control0;
input ALU_Control1;
input A_mux;
input Adder_Cin;
input B_mux0;
input B_mux1;
input Fclkpos;
input STL;
input SUB;
input Tclkpos;
input mux3_0;
input mux3_1;
input vdd;
input vss;

output  [15:0]  a_regout;
output  [15:0]  alu_out;
output  [15:0]  out;

input  [15:0]  instr_in;
input  [15:0]  b;
input  [15:0]  a;
input  [1:10]  clkpos;
input  [15:0]  PC_in;
input  [1:10]  clkneg;

wire net1 ;

wire net3 ;

wire net2 ;

wire adder_cout ;

wire net4 ;

// Buses in the design

wire [15:0]  a_muxout;

wire [15:0]  b_muxout;

wire [15:0]  and_out;

wire [15:0]  or_out;

wire [15:0]  alu_muxout;

wire [15:0]  b_regout;

wire [15:0]  adder_out;

wire [15:0]  b_invout;

wire [15:0]  a_invout;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "ALU";
    specparam CDS_VIEWNAME = "schematic";
endspecify

mux3to1_16b I13 ( out[15:0], {vss, instr_in[15:1]}, alu_out[15:0],
     clkneg[5], clkneg[5], clkpos[5], clkpos[5], alu_muxout[15:0],
     mux3_0, mux3_1, vdd, vss);
cond_inv16b I7 ( b_invout[15:0], b_muxout[15:0], {STL, STL, STL, STL,
     STL, STL, STL, STL, STL, STL, STL, STL, STL, STL, STL, STL},
     clkneg[1], clkpos[1], vdd, vss);
cond_inv16b I6 ( a_invout[15:0], a_muxout[15:0], {SUB, SUB, SUB, SUB,
     SUB, SUB, SUB, SUB, SUB, SUB, SUB, SUB, SUB, SUB, SUB, SUB},
     clkneg[1], clkpos[1], vdd, vss);
and16b I9 ( and_out[15:0], a_muxout[15:0], b_muxout[15:0], clkneg[6],
     clkneg[7], clkpos[6], clkpos[7], vdd, vss);
zero_detector I14 ( out_Zero_DetectBar, a_regout[15:0], b_regout[15:0],
     clkneg[1], clkneg[2], clkneg[3], clkneg[4], clkneg[5], clkpos[1],
     clkpos[2], clkpos[3], clkpos[4], clkpos[5], vdd, vss);
or16b I10 ( or_out[15:0], a_muxout[15:0], b_muxout[15:0], clkneg[6],
     clkneg[7], clkpos[6], clkpos[7], vdd, vss);
adder I8 ( adder_cout, adder_out[0], adder_out[1], adder_out[2],
     adder_out[3], adder_out[4], adder_out[5], adder_out[6],
     adder_out[7], adder_out[8], adder_out[9], adder_out[10],
     adder_out[11], adder_out[12], adder_out[13], adder_out[14],
     adder_out[15], a_invout[0], a_invout[1], a_invout[2], a_invout[3],
     a_invout[4], a_invout[5], a_invout[6], a_invout[7], a_invout[8],
     a_invout[9], a_invout[10], a_invout[11], a_invout[12],
     a_invout[13], a_invout[14], a_invout[15], b_invout[0],
     b_invout[1], b_invout[2], b_invout[3], b_invout[4], b_invout[5],
     b_invout[6], b_invout[7], b_invout[8], b_invout[9], b_invout[10],
     b_invout[11], b_invout[12], b_invout[13], b_invout[14],
     b_invout[15], Adder_Cin, clkneg[2], clkneg[3], clkneg[4],
     clkneg[5], clkneg[6], clkneg[7], clkneg[8], clkneg[9], clkpos[2],
     clkpos[3], clkpos[4], clkpos[5], clkpos[6], clkpos[7], clkpos[8],
     clkpos[9], vdd, vss);
inv_fo16_irr I18 ( net2, Tclkpos, vdd, vss);
inv_fo16_irr I17 ( net1, Tclkpos, vdd, vss);
inv_fo16_irr I16 ( net4, Fclkpos, vdd, vss);
inv_fo16_irr I15 ( net3, Fclkpos, vdd, vss);
Register16b I12 ( alu_out[15:0], net3, Fclkpos, net2, Tclkpos,
     clkneg[10], clkpos[10], alu_muxout[15:0], vdd, vss);
Register16b I2 ( a_regout[15:0], net4, Fclkpos, net1, Tclkpos,
     clkneg[10], clkpos[10], a[15:0], vdd, vss);
Register16b I3 ( b_regout[15:0], net4, Fclkpos, net1, Tclkpos,
     clkneg[10], clkpos[10], b[15:0], vdd, vss);
mux4to1_16b I11 ( alu_muxout[15:0], and_out[15:0], or_out[15:0],
     adder_out[15:0], clkneg[5], clkneg[6], clkpos[5], clkpos[6],
     {adder_cout, adder_cout, adder_cout, adder_cout, adder_cout,
     adder_cout, adder_cout, adder_cout, adder_cout, adder_cout,
     adder_cout, adder_cout, adder_cout, adder_cout, adder_cout,
     adder_cout}, ALU_Control0, ALU_Control1, vdd, vss);
mux4to1_16b I4 ( a_muxout[15:0], {vss, instr_in[15:1]}, instr_in[15:0],
     {vss, vss, vss, vss, vss, vss, vss, vss, vss, vss, vss, vss, vss,
     vss, vdd, vss}, vss, vss, vdd, vdd, a_regout[15:0], B_mux0,
     B_mux1, vdd, vss);
mux2to1_16b I5 ( b_muxout[15:0], PC_in[15:0], b_regout[15:0], vss, vdd,
     A_mux, vdd, vss);

endmodule
// Library - MIPS25, Cell - inv_irr, View - schematic
// LAST TIME SAVED: Aug 14 11:41:34 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module inv_irr ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - inv_fo64_irr, View - schematic
// LAST TIME SAVED: May  3 10:25:05 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module inv_fo64_irr ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo64_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - nand3b_irr, View - schematic
// LAST TIME SAVED: Sep 11 09:36:36 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nand3b_irr ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   vdd, 
input   vss );

wire net018 ;

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand3b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(net018), .g(a), .s(vss));
ctranif1  MN0 ( .b(vss), .d(net014), .g(b), .s(net018));
ctranif1  MN1 ( .b(vss), .d(out), .g(c), .s(net014));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(a), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(c), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(b), .d(out));

endmodule
// Library - MIPS25, Cell - mux2to1_control, View - schematic
// LAST TIME SAVED: Jun 16 20:52:16 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module mux2to1_control ( 
output   out, 
input   a, 
input   clkneg, 
input   clkpos, 
input   in, 
input   vdd, 
input   vss );

wire net35 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux2to1_control";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(a), .g(net35), .s(out));
ctranif1  MN0 ( .b(vss), .d(vss), .g(in), .s(out));
ctranif1  MN1 ( .b(vss), .d(net35), .g(in), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(out), .g(in), .d(a));
ctranif0  MP0 ( .b(vdd), .s(out), .g(net35), .d(vss));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(net35));

endmodule
// Library - MIPS25, Cell - phas_enH1, View - schematic
// LAST TIME SAVED: Aug  7 11:35:02 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module phas_enH1 ( 
output   out, 
input   B, 
input   BBar, 
input   En, 
input   EnBar, 
input   vdd, 
input   vss );

wire net021 ;

wire net026 ;

wire net64 ;

wire net63 ;

wire net61 ;

wire net030 ;

wire net028 ;

wire net027 ;

wire net031 ;

wire net025 ;

wire net024 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phas_enH1";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN6 ( .b(net024), .d(net025), .g(net026), .s(net027));
ctranif1  MN5 ( .b(net028), .d(net61), .g(net030), .s(net031));
ctranif1  MN2 ( .b(vss), .d(out), .g(En), .s(net64));
ctranif1  MN4 ( .b(vss), .d(net64), .g(BBar), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(En), .d(net021));
ctranif0  MP1 ( .b(vdd), .s(net021), .g(B), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(EnBar), .d(net63));
ctranif0  MP5 ( .b(vdd), .s(net63), .g(BBar), .d(out));

endmodule
// Library - MIPS25, Cell - nor3b_irr, View - schematic
// LAST TIME SAVED: Aug 14 11:13:59 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nor3b_irr ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   vdd, 
input   vss );

wire net022 ;

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor3b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(c), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(b), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(a), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(c), .d(out));
ctranif0  MP0 ( .b(vdd), .s(net022), .g(b), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(a), .d(net022));

endmodule
// Library - MIPS25, Cell - nor2b_fo4_irr, View - schematic
// LAST TIME SAVED: Aug 14 10:54:34 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nor2b_fo4_irr ( 
output   out, 
input   a, 
input   b, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor2b_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - nand2b_fo4_irr, View - schematic
// LAST TIME SAVED: Aug 14 12:04:45 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nand2b_fo4_irr ( 
output   out, 
input   a, 
input   b, 
input   vdd, 
input   vss );

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand2b_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(b), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(a), .d(out));

endmodule
// Library - MIPS25, Cell - inv_fo4_irr, View - schematic
// LAST TIME SAVED: Jun 16 20:27:28 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module inv_fo4_irr ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN2 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP3 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - phasedetector, View - schematic
// LAST TIME SAVED: Jul 17 10:22:20 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module phasedetector ( 
output   out, 
input   in, 
input   vdd, 
input   vss );


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phasedetector";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
// Library - MIPS25, Cell - phasedetFO, View - schematic
// LAST TIME SAVED: Aug  6 09:25:48 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module phasedetFO ( 
output   En, 
output   EnBar, 
input   IN, 
input   vdd, 
input   vss );

wire net3 ;

wire net7 ;

wire net4 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phasedetFO";
    specparam CDS_VIEWNAME = "schematic";
endspecify

inv_fo64_irr I3 ( En, EnBar, vdd, vss);
inv_fo64_irr I2 ( EnBar, net3, vdd, vss);
inv_fo16_irr I1 ( net3, net4, vdd, vss);
inv_fo4_irr I05 ( net4, net7, vdd, vss);
phasedetector I0 ( net7, IN, vdd, vss);

endmodule
// Library - MIPS25, Cell - nand2b_fo4, View - schematic
// LAST TIME SAVED: Jun 16 21:04:39 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nand2b_fo4 ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand2b_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(b), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(a), .d(out));

endmodule
// Library - MIPS25, Cell - nor2b, View - schematic
// LAST TIME SAVED: Jun 16 21:10:40 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nor2b ( 
output   out, 
input   a, 
input   b, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net016 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(b), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(a), .d(net016));

endmodule
// Library - MIPS25, Cell - nor4b, View - schematic
// LAST TIME SAVED: Jun 16 21:16:30 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nor4b ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   d, 
input   vdd, 
input   vss );

wire net022 ;

wire net016 ;

wire net019 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nor4b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( .b(vss), .d(out), .g(a), .s(clkneg));
ctranif1  MN2 ( .b(vss), .d(out), .g(d), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(out), .g(c), .s(clkneg));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(clkneg));
ctranif0  MP3 ( .b(vdd), .s(clkpos), .g(a), .d(net019));
ctranif0  MP2 ( .b(vdd), .s(net016), .g(d), .d(out));
ctranif0  MP0 ( .b(vdd), .s(net022), .g(c), .d(net016));
ctranif0  MP1 ( .b(vdd), .s(net019), .g(b), .d(net022));

endmodule
// Library - MIPS25, Cell - nand2b_irr, View - schematic
// LAST TIME SAVED: Sep 11 09:35:54 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nand2b_irr ( 
output   out, 
input   a, 
input   b, 
input   vdd, 
input   vss );

wire net014 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand2b_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(net014), .g(a), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(b), .s(net014));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(b), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(a), .d(out));

endmodule
// Library - MIPS25, Cell - nand3b_fo4, View - schematic
// LAST TIME SAVED: Jun 16 21:07:35 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module nand3b_fo4 ( 
output   out, 
input   a, 
input   b, 
input   c, 
input   clkneg, 
input   clkpos, 
input   vdd, 
input   vss );

wire net014 ;

wire net018 ;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "nand3b_fo4";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(net018), .g(a), .s(clkneg));
ctranif1  MN0 ( .b(vss), .d(net014), .g(b), .s(net018));
ctranif1  MN1 ( .b(vss), .d(out), .g(c), .s(net014));
ctranif0  MP2 ( .b(vdd), .s(clkpos), .g(a), .d(out));
ctranif0  MP0 ( .b(vdd), .s(clkpos), .g(c), .d(out));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(b), .d(out));

endmodule
// Library - MIPS25, Cell - control_unit, View - schematic
// LAST TIME SAVED: Sep 30 10:48:37 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

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

output ReadEn;
output WriteEn;
output out_ALUCont0;
output out_ALUCont1;
output out_ALUCont2;
output out_ALUSrcA;
output out_ALUSrcB0;
output out_ALUSrcB1;
output out_Addi;
output out_Branch_PCSrc0;
output out_Decode;
output out_IRWr0;
output out_IRWr1;
output out_IorD;
output out_LB;
output out_MemWrite;
output out_Memadr;
output out_MemtoReg;
output out_PCSrc1;
output out_PCWrite;
output out_PC_En;
output out_PC_EnBar;
output out_RegDst;
output out_RegWriteBar;
output out_Rtype;
output out_S3;
output out_S4;
output out_S5;
output out_S6;
output out_SB;
output out_STL;
output out_SUB;
output out_fetch;
output out_fetch1;
output out_lbrd;
output out_other4;
output out_zeros;

input F0;
input F1;
input F2;
input F3;
input Fclk;
input OP1;
input OP2;
input OP3;
input OP5;
input Reset;
input Tclk;
input Zero_DetectBar;
input vdd;
input vss;

output  [0:7]  S;
output  [0:7]  Nout;

input  [0:9]  clkneg;
input  [0:9]  clkpos;

wire net160 ;

wire net460 ;

wire net0178 ;

wire net525 ;

wire net5 ;

wire net57 ;

wire net7 ;

wire net0170 ;

wire net0187 ;

wire net164 ;

wire net376 ;

wire net0174 ;

wire net70 ;

wire net16 ;

wire net229 ;

wire net15 ;

wire net0172 ;

wire net523 ;

wire net384 ;

wire net536 ;

wire net410 ;

wire net466 ;

wire net8 ;

wire net0175 ;

wire net99 ;

wire net259 ;

wire net65 ;

wire net53 ;

wire net319 ;

wire net316 ;

wire net67 ;

wire net572 ;

wire net10 ;

wire net1 ;

wire net463 ;

wire net424 ;

wire net224 ;

wire net62 ;

wire net560 ;

wire net0123 ;

wire net0196 ;

wire net409 ;

wire net0270 ;

wire net291 ;

wire net6 ;

wire net4 ;

wire net303 ;

wire net0173 ;

wire net0192 ;

wire net249 ;

wire net308 ;

wire net132 ;

wire net54 ;

wire net0176 ;

wire net0163 ;

wire net64 ;

wire net0457 ;

wire net508 ;

wire net374 ;

wire net0186 ;

wire net0185 ;

wire net399 ;

wire net2 ;

wire net0274 ;

wire net0189 ;

wire net0141 ;

wire net0188 ;

wire net299 ;

wire net3 ;

wire net9 ;

wire cdsNet1 ;

wire net103 ;

wire net278 ;

wire net0161 ;

wire net14 ;

wire net0171 ;

wire net284 ;

wire net404 ;

wire net0143 ;

wire net517 ;

wire net348 ;

wire net0159 ;

wire net59 ;

wire net13 ;

wire net428 ;

wire net386 ;

wire cdsNet0 ;

wire net084 ;

wire net202 ;

wire net0154 ;

wire net61 ;

wire Ph6En ;

wire Ph6EnBar ;

wire net182 ;

wire Ph8EnBar ;

wire net246 ;

wire Ph8En ;

wire net0169 ;

wire net68 ;

wire net177 ;


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
nor2b I101 ( net376, out_lbrd, out_S6, clkneg[4], clkpos[4], vdd, vss);
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
nand2b I78 ( net404, OP1, out_Decode, clkneg[2], clkpos[2], vdd, vss);
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
// Library - MIPS25, Cell - mips, View - schematic
// LAST TIME SAVED: Sep 30 10:35:10 2025
// NETLIST TIME: Feb  2 20:06:56 2026
`timescale 1ns / 1ns 

module mips ( Addi, Decode, Fclk, LB, MemWrite, Memadr, N[0], N[1],
     N[2], N[3], N[4], N[5], N[6], N[7], OP3_spy, OP5_spy, PC[15:0],
     Reset, Rtype, S3, S4, S5, S6, S[0], S[1], S[2], S[3], S[4], S[5],
     S[6], S[7], SB, Tclk, VDD, VSS, clkneg[1:10], clkpos[1:10],
     data_in[15:0], fetch, fetch1, io[15:0], lbrd, nand_in1, nand_in2,
     nand_out, not_in1, not_in2, not_out1, not_out2, other4, zeros,
     srclkneg, srclkpos );

inout Addi;
inout Decode;
inout Fclk;
inout LB;
inout MemWrite;
inout Memadr;
inout OP3_spy;
inout OP5_spy;
inout Reset;
inout Rtype;
inout S3;
inout S4;
inout S5;
inout S6;
inout SB;
inout Tclk;
inout VDD;
inout VSS;
inout fetch;
inout fetch1;
inout lbrd;
inout nand_in1;
inout nand_in2;
inout nand_out;
inout not_in1;
inout not_in2;
inout not_out1;
inout not_out2;
inout other4;
inout zeros;

input srclkneg;
input srclkpos;

inout  [15:0]  io;
inout  [0:7]  N;
inout  [15:0]  PC;
inout  [15:0]  data_in;
inout  [0:7]  S;
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


// End HDL models
