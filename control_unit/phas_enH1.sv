
// Library - MIPS25, Cell - phas_enH1, View - schematic
// LAST TIME SAVED: Aug  7 11:35:02 2025
// NETLIST TIME: Sep 19 16:13:50 2025
`timescale 1ns / 1ns 

module phas_enH1 ( out, B, BBar, En, EnBar, vdd, vss );

output  out;

input  B, BBar, En, EnBar, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phas_enH1";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  MN6 ( .b(net024), .d(net025), .g(net026), .s(net027));
ctranif1  MN5 ( .b(net028), .d(net61), .g(net030), .s(net031));
ctranif1  MN2 ( .b(vss), .d(out), .g(En), .s(net64));
ctranif1  MN4 ( .b(vss), .d(net64), .g(BBar), .s(vss));
ctranif0  MP2 ( .b(vdd), .s(vdd), .g(En), .d(net021));
ctranif0  MP1 ( .b(vdd), .s(net021), .g(B), .d(out));
ctranif0  MP0 ( .b(vdd), .s(vdd), .g(EnBar), .d(net63));
ctranif0  MP5 ( .b(vdd), .s(net63), .g(BBar), .d(out));

endmodule
