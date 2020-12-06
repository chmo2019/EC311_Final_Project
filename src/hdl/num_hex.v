`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2020 09:45:00 PM
// Design Name: 
// Module Name: num_hex
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


module num_hex(
    input [3:0] bnum,
    output reg [6:0] hex_seg
    );
    
    always @(*) begin
        case (bnum)
            4'b0000 : hex_seg <= ~7'h7E;
            4'b0001 : hex_seg <= ~7'h30;
            4'b0010 : hex_seg <= ~7'h6D;
            4'b0011 : hex_seg <= ~7'h79;
            4'b0100 : hex_seg <= ~7'h33;          
            4'b0101 : hex_seg <= ~7'h5B;
            4'b0110 : hex_seg <= ~7'h5F;
            4'b0111 : hex_seg <= ~7'h70;
            4'b1000 : hex_seg <= ~7'h7F;
            4'b1001 : hex_seg <= ~7'h7B;
            4'b1010 : hex_seg <= ~7'h77;
            4'b1011 : hex_seg <= ~7'h1F;
            4'b1100 : hex_seg <= ~7'h4E;
            4'b1101 : hex_seg <= ~7'h3D;
            4'b1110 : hex_seg <= ~7'h4F;
            4'b1111 : hex_seg <= ~7'h47;
        endcase
     end
endmodule
