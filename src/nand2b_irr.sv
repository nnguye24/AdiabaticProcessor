
// Library - MIPS25, Cell - nand2b_irr, View - schematic
// LAST TIME SAVED: Sep 11 09:35:54 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 

module nand2b_irr ( out, a, b, vdd, vss );

output  out;

input  a, b, vdd, vss;


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
