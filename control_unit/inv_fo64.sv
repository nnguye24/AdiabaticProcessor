
// Library - MIPS25, Cell - inv_fo64, View - schematic
// LAST TIME SAVED: Apr 30 10:43:22 2025
// NETLIST TIME: Jul 22 15:07:05 2025
`timescale 1ns / 1ns 

module inv_fo64 ( out, clkneg, clkpos, in, vdd, vss );

output  out;

input  clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "inv_fo64";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN1 ( .b(vss), .d(out), .g(in), .s(clkneg));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(out));

endmodule
