`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:37:58 PM
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
    input [7:0] bin,
    output reg [11:0] bcd
);

    reg [3:0] i;   
  
    always @(bin) begin
        bcd = 0; 
        for (i = 0; i < 8; i = i+1) begin
            bcd = {bcd[10:0],bin[7-i]}; 
            if(i < 7 && bcd[3:0] > 4) begin
		      bcd[3:0] = bcd[3:0] + 3;
		    end
            if(i < 7 && bcd[7:4] > 4) begin
                bcd[7:4] = bcd[7:4] + 3;
            end
            if(i < 7 && bcd[11:8] > 4) begin
                bcd[11:8] = bcd[11:8] + 3;  
            end
        end
    end                 
endmodule
