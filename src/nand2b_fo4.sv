
// Library - MIPS25, Cell - nand2b_fo4, View - schematic
// LAST TIME SAVED: Jun 16 21:04:39 2025
// NETLIST TIME: Jul 22 15:07:06 2025
`timescale 1ns / 1ns 

module nand2b_fo4 ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


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
