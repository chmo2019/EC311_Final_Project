`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:30:20 AM
// Design Name: 
// Module Name: ripplecarry
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


module ripplecarry(
    input [2:0] A,
    input [2:0] B,
    input C_in,
    output [2:0] Out,
    output C_out
    );
    
    wire w1;
    wire w2;
    
    full_adder fa1(.a( A[0] ), .b( B[0] ), .c_in(C_in), .sum( Out[0] ), .c_out(w1));
    full_adder fa2(.a( A[1] ), .b( B[1] ), .c_in(w1), .sum( Out[1] ), .c_out(w2));
    full_adder fa3(.a( A[2] ), .b( B[2] ), .c_in(w2), .sum( Out[2] ), .c_out(C_out));
    
endmodule


