
// Library - MIPS25, Cell - flipflop2b, View - schematic
// LAST TIME SAVED: Jul 23 15:21:51 2025
// NETLIST TIME: Sep 19 16:13:51 2025
`timescale 1ns / 1ns 
/*
module flipflop2b ( Out, OutBar, Fclkneg, Fclkpos, In, Mclkneg,
     Mclkpos, Tclkneg, Tclkpos, vdd, vss );

output  Out, OutBar;

input  Fclkneg, Fclkpos, In, Mclkneg, Mclkpos, Tclkneg, Tclkpos, vdd,
     vss;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "flipflop2b";
    specparam CDS_VIEWNAME = "schematic";
endspecify

ctranif1  M12 ( .b(vss), .d(vss), .g(Out), .s(OutBar));
ctranif1  M10 ( .b(vss), .d(Out), .g(net024), .s(vss));
ctranif1  M8 ( .b(vss), .d(net024), .g(Fclkneg), .s(OutBar));
ctranif1  M7 ( .b(vss), .d(net024), .g(Fclkpos), .s(net19));
ctranif1  M6 ( .b(vss), .d(net19), .g(net15), .s(Mclkneg));
ctranif1  M4 ( .b(vss), .d(Mclkneg), .g(net19), .s(net15));
ctranif1  M1 ( .b(vss), .d(net15), .g(Tclkpos), .s(In));
ctranif0  M11 ( .b(vdd), .s(OutBar), .g(Out), .d(vdd));
ctranif0  M9 ( .b(vdd), .s(vdd), .g(net024), .d(Out));
ctranif0  M5 ( .b(vdd), .s(Mclkpos), .g(net15), .d(net19));
ctranif0  M3 ( .b(vdd), .s(net15), .g(net19), .d(Mclkpos));
ctranif0  M2 ( .b(vdd), .s(In), .g(Tclkneg), .d(net15));

endmodule
*/

module flipflop2b ( Out, OutBar, Fclkneg, Fclkpos, In, Mclkneg, Mclkpos,
     Tclkneg, Tclkpos, vdd, vss );
	
  input Fclkneg, Fclkpos, Tclkpos, Tclkneg, In, Mclkneg, Mclkpos, vdd, vss;
  output reg Out, OutBar; 
    
  reg node;
    
  always @(posedge Mclkpos) begin	// changed from Tclk, maybe a good change
          node <= In;
  end
    
  always @(posedge Fclkpos) begin
          Out <= node;
          OutBar <= ~node;
  end

endmodule
