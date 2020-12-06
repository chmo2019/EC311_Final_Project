`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 09:23:35 PM
// Design Name: 
// Module Name: score_to_7seg
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


module score_to_7seg(
    input clk,
    input [7:0] currscore,
    output reg [7:0] anode,
    output reg [6:0] segment
    );
    
    wire [7:0] bcd_score;
    dec_bcd bcd(.bin(currscore), .bcd(bcd_score));
    
    wire [3:0] score1 = bcd_score[7:4];
    wire [3:0] score2 = bcd_score[3:0];
    wire hseg1, hseg2;
    num_hex hex1(.bnum(score1), .hex_seg(hseg1));
    num_hex hex2(.bnum(score2), .hex_seg(hseg2));
    
    reg counter = 0;
    
    always @(posedge clk) begin
        case (counter)
            0: begin
                anode <= 8'b11111110;
                segment <= hseg1;
            end
            1: begin 
                anode <= 8'b11111101;
                segment <= hseg2;
            end
        endcase
        
        counter = counter + 1;
        if (counter == 2) begin 
            counter = 0;
        end
     end
    
endmodule
