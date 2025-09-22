
// Library - MIPS25, Cell - nor3b_irr, View - schematic
// LAST TIME SAVED: Aug 14 11:13:59 2025
// NETLIST TIME: Sep 19 16:13:50 2025
`timescale 1ns / 1ns 

module nor3b_irr ( out, a, b, c, vdd, vss );

output  out;

input  a, b, c, vdd, vss;


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
