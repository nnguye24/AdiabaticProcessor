// Strucutral/gate level netlist of Instruction Data Register. 
/*
+-------------------+
                                |    INSTRUCTION    |
                                |     REGISTER      |
                      +========>| I64 (Upper 16b)   |=========> out[31:16]
                      |         | Enable: IRWr1     |               |
                      |         +-------------------+               |
  data_in [15:0] =====+                                             |
  (From Memory)       |         +-------------------+               v
                      +========>| I65 (Lower 16b)   |=========> out[15:0]
                      |         | Enable: IRWr0     |               |
                      |         +-------------------+               |
                      |                                             |
                      |         +-------------------+               |
                      +========>| I75 (Memory Data  |======+        v
                                |      Register)    |      |    (Instruction Bits)
                                +-------------------+      |    out[20:16]  out[15:11]
                                                           |        |           |
                                                   net1    |        +---+   +---+
                                                  [15:0]   v            |   |
                                                         |===|          v   v
  ALU_in [15:0] ========================================>|MUX|         |=====|
                                                         |I72|         | MUX | I66-I70
                                                         |===|         |=====|
                                                           |              |
                                               (MemtoReg) -+   (RegDst) --+
                                                           |              |
                                                           v              v
                                                      out_wd [15:0]    a3 [4:0]
                                                      (To Reg File)  (Write Reg Addr)
*/
module InstrDataReg ( 
output  [4:0] a3, 
output  [15:0] io, 
output  [31:0] out, 
output  [15:0] out_wd, 
input  [15:0] ALU_in, 
input   Fclk, 
input   IRWr0, 
input   IRWr1, 
input   MemWrite, 
input   MemtoReg, 
input   RegDst, 
input   Tclk, 
input  [15:0] WriteData, 
input  [10:10] clkneg, 
input  [10:10] clkpos, 
input  [15:0] data_in, 
input   vdd, 
input   vss );

wire net20 ;

wire net18 ;

wire net3 ;

wire net7 ;

wire net6 ;

wire net5 ;

wire net13 ;

wire net4 ;

// Buses in the design

wire [0:15]  net1;


specify 
    specparam CDS_LIBNAME  = "MIPS25";
    specparam CDS_CELLNAME = "InstrDataReg";
    specparam CDS_VIEWNAME = "schematic";
endspecify

Register16b I75 ( net1[0:15], net20, Fclk, net18, Tclk, clkneg[10],
     clkpos[10], data_in[15:0], vdd, vss);
mux2to1_irr I59[15:0] ( data_in[15:0], WriteData[15:0], io[15:0],
     MemWrite, vdd, vss);
inv_fo16_irr I63 ( net6, Fclk, vdd, vss);
inv_fo16_irr I62 ( net7, IRWr0, vdd, vss);
inv_fo16_irr I61 ( net5, Fclk, vdd, vss);
inv_fo16_irr I60 ( net4, IRWr1, vdd, vss);
inv_fo16_irr I73 ( net13, Tclk, vdd, vss);
inv_fo16_irr I74 ( net3, Tclk, vdd, vss);
inv_fo16_irr I76 ( net20, Fclk, vdd, vss);
inv_fo16_irr I77 ( net18, Tclk, vdd, vss);
Register_En16b I65 ( out[15:0], IRWr0, net7, net6, Fclk, clkneg[10],
     clkpos[10], net3, Tclk, data_in[15:0], vdd, vss);
Register_En16b I64 ( out[31:16], IRWr1, net4, net5, Fclk, clkneg[10],
     clkpos[10], net13, Tclk, data_in[15:0], vdd, vss);
mux2to1 I72[15:0] ( out_wd[15:0], net1[0:15], ALU_in[15:0], vss, vdd,
     MemtoReg, vdd, vss);
     // RegDst chooses between top or lower portion
mux2to1 I70 ( a3[0], out[11], out[16], vss, vdd, RegDst, vdd, vss);
mux2to1 I69 ( a3[1], out[12], out[17], vss, vdd, RegDst, vdd, vss);
mux2to1 I68 ( a3[2], out[13], out[18], vss, vdd, RegDst, vdd, vss);
mux2to1 I67 ( a3[3], out[14], out[19], vss, vdd, RegDst, vdd, vss);
mux2to1 I66 ( a3[4], out[15], out[20], vss, vdd, RegDst, vdd, vss);

endmodule