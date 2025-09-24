
// Library - MIPS25, Cell - inv_irr, View - schematic
// LAST TIME SAVED: Aug 14 11:41:34 2025
// NETLIST TIME: Sep 19 16:13:50 2025
`timescale 1ns / 1ns 

module inv_irr ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
