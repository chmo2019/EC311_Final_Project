`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:17:45 AM
// Design Name: 
// Module Name: secondclkdiv
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


module secondclkdiv(
    input clk,
    input [31:0] upto,
    output reg div_clk = 0
    );
    
    integer counter = 0;
     
    always @(posedge clk) begin
    if (counter == upto) begin// 50000) begin
        div_clk = ~div_clk;
        counter = 0;
    end
    else counter = counter + 1;
    
    end
    
endmodule

