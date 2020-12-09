`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 10:06:30 PM
// Design Name: 
// Module Name: lfsr_random_num
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


module lfsr_random_num(
    input clk,
    input reset,
    output reg [23:0] randnum //24 bit random number generator
    ); 

    reg [23:0] n, left_shift;
    reg [4:0] t1, t2; //tracking shifts
    wire feed_poly = n[23] ^ n[22] ^ n[21] ^ n[16]; //obtained from Xilinx calculated values 
    wire shift = n[22:0];
    
    always @ (*) begin  
        left_shift = {shift, feed_poly}; 
        t2 = t1 + 1'b1;

        if (t1 == 24) begin
            randnum <= n;
            t1 = 5'b00000;
        end
    end
    
    always @ (posedge clk or posedge reset) begin
        if (!reset) begin
            n <= left_shift;
            t1 <= t2;
        end
        else begin
            n <= 24'hF; 
            t1 <= 5'b00000;
        end
    end

endmodule
