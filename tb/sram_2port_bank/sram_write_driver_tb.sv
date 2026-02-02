`timescale 1ns / 1ns
`include "../../bennettclock/bennettClock.sv"


module sram_2port_writedriver_tb();
    localparam WIDTH = 10;
    // Inputs

    reg in;
    supply1 vdd;
    supply0 vss;
    reg write;

    // Outputs
    wire bitA;
    wire bitnotA;


    // clock shit
    reg clk;
    reg reset;
    wire [WIDTH-1:0] clkneg;
    wire [WIDTH-1:0] clkpos;
    wire Mclk;
    wire instFlag;

    wire [WIDTH-1:0] clkpos_strong;
    bennett_clock #(
    .PHASES(WIDTH)   // PHASES(new), WIDTH(square)
    ) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
    );
    
    assign (supply1, supply0) clkneg = ~clkpos;
    assign (supply1, supply0) clkpos_strong = clkpos;
    

    sram_2port_writedriver dut (
        .bitA(bitA),
        .bitnotA(bitnotA),
        .clkneg1(clkneg[5]),    // clocks 2 and 3, in the bank world
        .clkneg2(clkneg[6]),
        .clkpos1(clkpos_strong[5]),
        .clkpos2(clkpos_strong[6]),
        .in(in),
        .vdd(vdd),
        .vss(vss),
        .write(write)
    );

    initial begin
        $dumpfile("sram_write_driver.vcd");
        $dumpvars(0, sram_2port_writedriver_tb);
    
    end
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset = 1;
        #10 
        reset = 0;
        write = 0;
        in = 0;
        // test vectors
        @(posedge clkpos[3]);
        in = 1;
        @(posedge clkpos[8]);   // writeEN/write follows clk9
        write = 1;
        @(negedge clkpos[8]);
        write = 0;

        // second write?
        @(posedge clkpos[8]);
        @(posedge clkpos[8]);
        write = 1;
        @(negedge clkpos[8]);
        write = 0;
        // start test
        #400 
        $finish;
    end




endmodule
