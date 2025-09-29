
// Library - MIPS25, Cell - nand3b_irr, View - schematic
// LAST TIME SAVED: Sep 11 09:36:36 2025
// NETLIST TIME: Sep 19 16:13:50 2025
`timescale 1ns / 1ns 

module nand3b_irr ( out, a, b, c, vdd, vss );

output  out;

input  a, b, c, vdd, vss;


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
