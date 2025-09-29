
// Library - MIPS25, Cell - inv_fo64_irr, View - schematic
// LAST TIME SAVED: May  3 10:25:05 2025
// NETLIST TIME: Jul 22 15:07:05 2025
`timescale 1ns / 1ns 

module inv_fo64_irr ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo64_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
