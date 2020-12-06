`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2020 04:16:16 PM
// Design Name: 
// Module Name: dec_bcd
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dec_bcd(
    input [5:0] bin,
    output reg [7:0] bcd
    );
    
    always @(bin) begin 
        if (bin < 10) begin
            bcd[7:4] = 4'b0000;
            bcd[3:0] = bin[3:0];
        end
        else if (bin >= 10 && bin < 20) begin 
            bcd[7:4] = 4'b0001;
            bcd[3:0] = bin - 10;
        end
        else if (bin >= 20 && bin < 30) begin 
            bcd[7:4] = 4'b0010;
            bcd[3:0] = bin - 20;
        end
        else if (bin >= 30 && bin < 40) begin 
            bcd[7:4] = 4'b0011;
            bcd[3:0] = bin - 30;
        end
        else if (bin >= 40 && bin < 50) begin 
            bcd[7:4] = 4'b0100;
            bcd[3:0] = bin - 40;
        end
        else if (bin >= 50 && bin < 60) begin 
            bcd[7:4] = 4'b0101;
            bcd[3:0] = bin - 50;
        end
    end 
endmodule
