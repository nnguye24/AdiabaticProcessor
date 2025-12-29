module sram_array(
    output reg [15:0] outA,
    output reg [15:0] outB,
    input [31:0] wordA,
    input [31:0] wordB,
    input ReadEn,
    input WriteEn,
    input [15:0] in,
    input srclkneg,
    input srclkpos
);


reg flag = 1;
reg [15:0] sram [0:31]; // sram array




//initialize all the sram addresses to 0.
always @(srclkneg) begin
    if (flag) begin
        sram[0] = 16'h0000;
        sram[1] = 16'h0000;
        sram[2] = 16'h0000;
        sram[3] = 16'h0000;
        sram[4] = 16'h0000;
        sram[5] = 16'h0000;
        sram[6] = 16'h0000;
        sram[7] = 16'h0000;
        sram[8] = 16'h0000;
        sram[9] = 16'h0000;
        sram[10] = 16'h0000;
        sram[11] = 16'h0000;
        sram[12] = 16'h0000;
        sram[13] = 16'h0000;
        sram[14] = 16'h0000;
        sram[15] = 16'h0000;
        sram[16] = 16'h0000;
        sram[17] = 16'h0000;
        sram[18] = 16'h0000;
        sram[19] = 16'h0000;
        sram[20] = 16'h0000;
        sram[21] = 16'h0000;
        sram[22] = 16'h0000;
        sram[23] = 16'h0000;
        sram[24] = 16'h0000;
        sram[25] = 16'h0000;
        sram[26] = 16'h0000;
        sram[27] = 16'h0000;
        sram[28] = 16'h0000;
        sram[29] = 16'h0000;
        sram[30] = 16'h0000;
        sram[31] = 16'h0000;
        flag = 0;
    end
end

reg [4:0] convA; // used to convert 1hot to index
reg [4:0] convB; // used to convert 1hot to index
// we will loop through the 32 bits of wordA and wordB, if it is high we will set conv to that index
integer i;

always @(*) begin
    convA = 5'b00000;
    convB = 5'b00000;
    for (i = 1; i < 31; i = i + 1) begin
        if (wordA[i]) begin
            convA = i[4:0];
        end
        if (wordB[i]) begin
            convB = i[4:0];
        end
    end
end

always @(posedge ReadEn || WriteEn) begin
    // writing to SRAM 
     
    if (ReadEn) begin
        outA = sram[convA];
        outB = sram[convB];
    end

    if(WriteEn) begin
        sram[0] <= 16'h0000;
        sram[convA] <= in;
        sram[convB] <= in;
    end
end

endmodule
