
`include "../../bennettclock/bennettClock.sv"

module sram_array_tb();
// Parameters
localparam WIDTH = 16;
localparam ADDR_WIDTH = 32;

// Inputs
reg clk;
reg reset;
reg [ADDR_WIDTH-1:0] wordA;
reg [ADDR_WIDTH-1:0] wordB;
reg ReadEn;
reg WriteEn;
reg [WIDTH-1:0] in;
wire srclkneg;
wire srclkpos;
reg Mclk;
reg instFlag;

// Outputs
wire [WIDTH-1:0] outA;
wire [WIDTH-1:0] outB;
wire [9:0] clkpos;

bennett_clock #(
    .PHASES(10)
) bennett (
    .clk(clk),
    .reset(reset),
    .clkp(clkpos),
    .Mclk(Mclk),
    .instFlag(instFlag)
);

sram_array dut(
    outA, outB, wordA, wordB, ReadEn, WriteEn, in, srclkneg, srclkpos
);
// sram clock generation
// srclk transitins to null after phase 7. Returns to HiLo within the middle of the last bennett clk.
assign srclkneg = (Mclk ^ clkpos[6]) & clkpos[6];
assign srclkpos = ~srclkneg;

// wave dump
initial begin
    $dumpfile("sram_array.vcd");
    $dumpvars(0, sram_array_tb);
end

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// some notes, read enable arrives on ph7, write enable arrives on ph9
// address arrives on ph3
// data inputs arrive at ph5


// testbench notes:
// 12/27/25 Debug statements. Super weird continuity thing with SRAM on testbench peek vs waveform output.
// The waveform says that outA at wordA = 1, AKA address 1, is AAAA, which is correct.
// but the peek says AAAA actually appears at address 0 for some reason....
// probably something wrong on my for loop side?
reg [4:0] i;
initial begin
    reset = 1;
    #10;
    reset = 0;
    ReadEn = 0;
    WriteEn = 0;

    // Pre operation display all sram cell data
    $display("Pre Test peek into SRAM cells");
    for ( i = 0; i < 31; i = i + 1) begin
        $display("SRAM at address: %b --- Data: %b", i, dut.sram[i]);
    end
    $display("------ End of peek ------\n");

    $display("Begin Test Sequences --------------------------------\n");
    // Write operation
    @(posedge clkpos[2]);
    wordA = 32'b00000000000000000000000000000010;   // actaully the 1 address, because 1 hot!!!, 000.00001 is 0 address
    wordB = 32'b10000000000000000000000000000000;
    @(posedge clkpos[4]);
    in = 16'b1010101010101010;
    @(posedge clkpos[8]);
    WriteEn = 1;
    $display("Writing %b to address A: %h and address B: %h", in, wordA, wordB);
    @(posedge clkpos[9]);
    WriteEn = 0;
    $display("SRAM CELL address A: %h address B: %h\n Data: %b\n", wordA, wordB ,dut.sram[1]);

    // Write operation
    @(posedge clkpos[2]);
    wordA = 32'b00000000000000000000000000100000;       
    wordB = 32'b10000000000000000000000000000000;
    @(posedge clkpos[4]);
    in = 16'hABCD;
    @(posedge clkpos[8]);
    WriteEn = 1;
    $display("Writing %b to address A: %h and address B: %h", in, wordA, wordB);
    @(posedge clkpos[9]);
    WriteEn = 0;
    $display("SRAM CELL address A: %h address B: %h\n Data: %b\n", wordA, wordB ,dut.sram[2]);
   
    // Read operation
    @(posedge clkpos[2]);
    wordA = 32'b00000000000000000000000000000001;       
    wordB = 32'b10000000000000000000000000000000;
    @(posedge clkpos[6]);
    ReadEn = 1;
    $display("Reading from address A: %h --- Data: %b\n", wordA, dut.sram[0]);
    $display("Reading from address B: %h --- Data: %b\n", wordB, dut.sram[1]);
    @(posedge clkpos[8]);
    ReadEn = 0;
    $display("End of Test Sequences-----------------------------\n");

    // End of operation display all sram cell data
    $display("End of Test peek into SRAM cells");
    for ( i = 0; i < 31; i = i + 1) begin
        $display("SRAM at address: %b --- Data: %b", i, dut.sram[i]);
    end
    $display("------ End of peek ------\n");
    #400

    $finish;

end
endmodule

