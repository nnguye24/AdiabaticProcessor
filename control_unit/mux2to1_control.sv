
// Library - MIPS25, Cell - mux2to1_control, View - schematic
// LAST TIME SAVED: Jun 16 20:52:16 2025
// NETLIST TIME: Jul 22 15:07:05 2025
`timescale 1ns / 1ns 

module mux2to1_control ( out, a, clkneg, clkpos, in, vdd, vss );

output  out;

input  a, clkneg, clkpos, in, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "mux2to1_control";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN2 ( .b(vss), .d(a), .g(net35), .s(out));
ctranif1  MN0 ( .b(vss), .d(vss), .g(in), .s(out));
ctranif1  MN1 ( .b(vss), .d(net35), .g(in), .s(clkneg));
ctranif0  MP2 ( .b(vdd), .s(out), .g(in), .d(a));
ctranif0  MP0 ( .b(vdd), .s(out), .g(net35), .d(vss));
ctranif0  MP1 ( .b(vdd), .s(clkpos), .g(in), .d(net35));

endmodule
