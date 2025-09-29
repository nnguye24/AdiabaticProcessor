
// Library - MIPS25, Cell - nand3b_fo4, View - schematic
// LAST TIME SAVED: Jun 16 21:07:35 2025
// NETLIST TIME: Jul 22 15:07:06 2025
`timescale 1ns / 1ns 

module nand3b_fo4 ( out, a, b, c, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, vdd, vss;


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
