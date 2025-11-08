`timescale 1ns / 1ns
`include "../../bennettclock/bennettClock.sv"

module inv_fo4_tb();

  // Inputs
  wire [9:0] clkneg;
  wire [9:0] clkpos;

  reg in;
  supply1 vdd;
  supply0 vss;
  wire Mclk;
  wire instFlag;
  reg reset;
  reg clk;

  // Outputs
  wire out;
  bennett_clock #(.PHASES(10)) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
  );

  assign clkneg = ~clkpos;
  // Instantiate
  inv_fo4 dut (
    .out(out),
    .clkneg(clkneg[4]), // phase 5, first clock in the sram bank
    .clkpos(clkpos[4]),
    .in(in),
    .vdd(vdd),
    .vss(vss)
  );

  // Dump waves
  initial begin
    $dumpfile("inv_fo4.vcd");
    $dumpvars(0, inv_fo4_tb);
  end

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin
    // reset
    reset = 1;
    #10;
    reset = 0;  
    in = 0;
    // test vectors
    @(posedge clkpos[2]);
    in = 0;
    @(posedge clkpos[2]);
    in = 0;
    @(posedge clkpos[2]);
    in = 1;

    #400;


    $finish;
  end

endmodule
