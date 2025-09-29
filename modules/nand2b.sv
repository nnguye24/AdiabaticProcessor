
// Library - MIPS25, Cell - nand2b, View - schematic
// LAST TIME SAVED: Jul 23 16:01:00 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 

module nand2b ( out, a, b, clkneg, clkpos, vdd, vss );

output  out;

input  a, b, clkneg, clkpos, vdd, vss;


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
