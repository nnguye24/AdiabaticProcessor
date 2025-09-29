
// Library - MIPS25, Cell - phasedetFO, View - schematic
// LAST TIME SAVED: Aug  6 09:25:48 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 

module phasedetFO ( En, EnBar, IN, vdd, vss );

output  En, EnBar;

input  IN, vdd, vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "phasedetFO";
    specparam CDS_VIEWNAME = "schematic";
endspecify

inv_fo64_irr I3 ( En, EnBar, vdd, vss);
inv_fo64_irr I2 ( EnBar, net3, vdd, vss);
inv_fo16_irr I1 ( net3, net4, vdd, vss);
inv_fo4_irr I05 ( net4, net7, vdd, vss);
phasedetector I0 ( net7, IN, vdd, vss);

endmodule
