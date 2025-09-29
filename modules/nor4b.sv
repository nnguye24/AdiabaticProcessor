
// Library - MIPS25, Cell - nor4b, View - schematic
// LAST TIME SAVED: Jun 16 21:16:30 2025
// NETLIST TIME: Jul 22 15:07:06 2025
`timescale 1ns / 1ns 

module nor4b ( out, a, b, c, clkneg, clkpos, d, vdd, vss );

output  out;

input  a, b, c, clkneg, clkpos, d, vdd, vss;


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
