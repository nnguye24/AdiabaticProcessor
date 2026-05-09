`include "../../bennettclock/bennettClock_square.sv"

// Standalone exercise of ALU cond_inv16b with the same Bennett clocking as mips_tb.
// ALU cond_inv uses clkpos[1]/clkneg[1] on the chip's [1:10] bus. In that packed
// range, index 1 is the MSB. mips_driver_pad is driven with
//   .clkpos({clkpos[0],...,clkpos[9]})
// so MSB clkpos[0] maps to chip clkpos[1] — the ALU conditional-inverter phase.

module cond_inv_tb;

    supply1 VDD;
    supply0 VSS;

    localparam WIDTH = 10;

    logic clk, reset;
    logic Mclk, instFlag;
    logic [WIDTH-1:0] clkpos, clkneg;

    logic [15:0] a, b;
    wire [15:0] out;

    bennett_clock_square #(
        .WIDTH(WIDTH)
    ) bennett (
        .clk(clk),
        .reset(reset),
        .clkp(clkpos),
        .Mclk(Mclk),
        .instFlag(instFlag)
    );

    assign clkneg = ~clkpos;

    cond_inv16b_behav dut (
        .out(out),
        .a(a),
        .b(b),
        .clkneg(clkpos[0]),
        .clkpos(clkneg[0]),
        .vdd(VDD),
        .vss(VSS)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("cond_inv.vcd");
        $dumpvars(0, cond_inv_tb);
    end

    initial begin
        reset = 1;
        a = 16'h0000;
        b = {16{1'b1}};

        #50;
        reset = 0;

        repeat (8) @(posedge instFlag);

        a = 16'h00FF;
        b = {16{1'b0}};

        repeat (4) @(posedge instFlag);

        a = 16'hA5A5;
        b = {16{1'b1}};

        repeat (4) @(posedge instFlag);

        $display("cond_inv_tb done at time %0t", $time);
        $finish;
    end

endmodule
