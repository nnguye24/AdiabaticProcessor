
// Library - MIPS25, Cell - phasedetector, View - schematic
// LAST TIME SAVED: Jul 17 10:22:20 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 

module phasedetector ( out, in, vdd, vss );

output  out;

input  in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phasedetector";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN0 ( .b(vss), .d(out), .g(in), .s(vss));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(in), .d(out));

endmodule
