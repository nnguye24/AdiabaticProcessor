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

reg [15:0] sram [0:31]; 
reg [4:0] convA; 
reg [4:0] convB; 

integer k; 
integer i;

logic write_hold;
logic read_hold;

initial begin 
    for (k = 0; k < 32; k = k + 1) begin
        sram[k] = 16'h0000;
    end
end


always @(*) begin
    convA = 5'd0;
    convB = 5'd0;
    for (i = 0; i < 32; i = i + 1) begin
        if (wordA[i]) convA = i[4:0];
        if (wordB[i]) convB = i[4:0];
    end
end

always @(posedge WriteEn or posedge ReadEn or posedge srclkneg) begin
    write_hold <= WriteEn;
    read_hold <= ReadEn;    
end

always @(posedge srclkpos) begin
    if (read_hold) begin
        outA <= sram[convA];
        outB <= sram[convB];
    end

    if (write_hold) begin
        // sram[0] <= 16'h0000; // Warning: This wipes index 0 every write cycle!
        if (convA != 5'd0) begin
            sram[convA] <= in;
        end
        if (convB != 5'd0) begin
            sram[convB] <= in;
        end
    end
end

endmodule