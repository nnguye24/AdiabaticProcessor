
// Library - MIPS25, Cell - nor2b_fo4_irr, View - schematic
// LAST TIME SAVED: Aug 14 10:54:34 2025
// NETLIST TIME: Sep 19 16:13:50 2025
`timescale 1ns / 1ns 

module nor2b_fo4_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


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
