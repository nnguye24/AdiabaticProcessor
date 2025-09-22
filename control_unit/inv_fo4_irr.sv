
// Library - MIPS25, Cell - inv_fo4_irr, View - schematic
// LAST TIME SAVED: Jun 16 20:27:28 2025
// NETLIST TIME: Jul 22 15:07:06 2025
`timescale 1ns / 1ns 

module inv_fo4_irr ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo4_irr";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN3 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN2 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP3 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(in), .d(out));
ctranif0  MP1 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
