module sram_array(
    output [15:0] outA,
    output [15:0] outB,
    input [31:0] wordA,
    input [31:0] wordB,
    input ReadEn,
    input WriteEn,
    input [15:0] in,
    input srclkneg,
    input srclkpos,
);

// need to define the memory unit
// 5 bit addressable = 32 addresses
// each address has 16 bits of data

// 32 word lines
// each word is an address 

// to connect decoder to this we would do concatenating that wordA0 and wordA1 with each two rows

reg [15:0] sram [0:31];
// sram[3] would access the 4th row, 
// array of wordA/B is a 1hot thing, choses 1 of the 32 rows
// but accessing each sram cell in the register array is done by index
// so we need to convert the 1hot to index

reg [4:0] conv; // used to convert 1hot to index
// we will loop through the 32 bits of wordA and wordB, if it is high we will set conv to that index
integer i;

always @(*) begin
    conv = 5'b00000;
    for (i = 0; i < 32; i = i + 1) begin
        if (wordA[i]) begin
            conv = i[4:0];
        end
    end
end

always @(*) begin
    // writing to SRAM 
    if (ReadEn) begin
        outA = sram[conv];
        outB = sram[conv];
    end

    if(writeEn) begin
        sram[conv] <= in;
    end
end

endmodule