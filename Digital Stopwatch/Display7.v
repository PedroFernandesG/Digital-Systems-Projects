module Display7(
    input wire [3:0] Hundred,
    input wire [3:0] Ten,
    input wire [3:0] Unit,
    input wire [3:0] Tenth,
    output reg [6:0] segHundred,
    output reg [6:0] segTen,
    output reg [6:0] segUnit,
    output reg [6:0] segTenth,
    input wire displayActive
);


always @(*) begin
    if (displayActive == 1) begin
        case (Tenth)
            4'b0000: segTenth = 7'b1000000; // 0
            4'b0001: segTenth = 7'b1111001; // 1
            4'b0010: segTenth = 7'b0100100; // 2
            4'b0011: segTenth = 7'b0110000; // 3
            4'b0100: segTenth = 7'b0011001; // 4
            4'b0101: segTenth = 7'b0010010; // 5
            4'b0110: segTenth = 7'b0000010; // 6
            4'b0111: segTenth = 7'b1111000; // 7
            4'b1000: segTenth = 7'b0000000; // 8
            4'b1001: segTenth = 7'b0010000; // 9
            default: segTenth = 7'b1111111; // Blank
        endcase

        case (Unit)
            4'b0000: segUnit = 7'b1000000; // 0
            4'b0001: segUnit = 7'b1111001; // 1
            4'b0010: segUnit = 7'b0100100; // 2
            4'b0011: segUnit = 7'b0110000; // 3
            4'b0100: segUnit = 7'b0011001; // 4
            4'b0101: segUnit = 7'b0010010; // 5
            4'b0110: segUnit = 7'b0000010; // 6
            4'b0111: segUnit = 7'b1111000; // 7
            4'b1000: segUnit = 7'b0000000; // 8
            4'b1001: segUnit = 7'b0010000; // 9
            default: segUnit = 7'b1111111; // Blank
        endcase

        case (Ten)
				4'b0000: segTen = 7'b1000000; // 0
            4'b0001: segTen = 7'b1111001; // 1
            4'b0010: segTen = 7'b0100100; // 2
            4'b0011: segTen = 7'b0110000; // 3
            4'b0100: segTen = 7'b0011001; // 4
            4'b0101: segTen = 7'b0010010; // 5
            4'b0110: segTen = 7'b0000010; // 6
            4'b0111: segTen = 7'b1111000; // 7
            4'b1000: segTen = 7'b0000000; // 8
            4'b1001: segTen = 7'b0010000; // 9
            default: segTen = 7'b1111111; // Blank
        endcase

        case (Hundred)
            4'b0000: segHundred = 7'b1000000; // 0
            4'b0001: segHundred = 7'b1111001; // 1
            4'b0010: segHundred = 7'b0100100; // 2
            4'b0011: segHundred = 7'b0110000; // 3
            4'b0100: segHundred = 7'b0011001; // 4
            4'b0101: segHundred = 7'b0010010; // 5
            4'b0110: segHundred = 7'b0000010; // 6
            4'b0111: segHundred = 7'b1111000; // 7
            4'b1000: segHundred = 7'b0000000; // 8
            4'b1001: segHundred = 7'b0010000; // 9
            default: segHundred = 7'b1111111; // Blank
        endcase
    end 
end

endmodule
