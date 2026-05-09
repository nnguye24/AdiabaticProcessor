`include "../../bennettclock/bennettClock.sv"
`include "../../bennettclock/bennettClock_square.sv"
`include "../../bennettclock/bennettClock_noX.sv"
`include "../../modules/phasedetFO.sv"
`include "../../modules/phasedetector.sv"
`include "../../modules/inv_fo4_irr.sv"
`include "../../modules/inv_fo16_irr.sv"
`include "../../modules/inv_fo64_irr.sv"
`include "../../tranif/custom_tranif.sv"

module phasedetFO_tb();

localparam WIDTH = 10;

// Clock signals
reg  clk, reset;
wire [WIDTH-1:0] clkpos;
wire [WIDTH-1:0] clkneg;
wire instFlag;
reg Mclk;

supply1 vdd;
supply0 vss;

// DUT I/O — one instance per phase under test
wire [WIDTH-1:0] En, EnBar;

// Bennett clock
bennett_clock_square #(.WIDTH(WIDTH)) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);

assign clkneg = ~clkpos;

// Instantiate phasedetFO for each clock phase
genvar g;
generate
    for (g = 0; g < WIDTH; g = g + 1) begin : phase_dets
        phasedetFO dut (
            .En(En[g]),
            .EnBar(EnBar[g]),
            .IN(clkpos[g]),
            .vdd(vdd),
            .vss(vss)
        );
    end
endgenerate

// Dump waves
initial begin
    $dumpfile("phasedetFO.vcd");
    $dumpvars(0, phasedetFO_tb);
end

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    reset = 1;
    #10;
    reset = 0;

    $display("=== phasedetFO Testbench ===");
    $display("Phase |  En  | EnBar");

    // Run through several instruction cycles and print En/EnBar per phase
    repeat (5) begin
        @(posedge instFlag); #1;
        $display("Cycle: En=%b EnBar=%b", En, EnBar);

        // Check complementarity for each valid (non-X) phase
        begin : check_block
            integer i;
            for (i = 0; i < WIDTH; i = i + 1) begin
                if (clkpos[i] !== 1'bX) begin
                    if (En[i] !== ~EnBar[i])
                        $display("  ERROR: phase %0d En=%b EnBar=%b not complementary", i, En[i], EnBar[i]);
                end
            end
        end
    end

    $display("=== TEST COMPLETE ===");
    $finish;
end

endmodule
