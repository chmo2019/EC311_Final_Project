`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:22:43 AM
// Design Name: 
// Module Name: carryselect
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


module carryselect(
    input [5:0] A,
    input [5:0] B,
    input C_in,
    output reg [5:0] Out,
    output reg C_out  
    );
    
    wire c0;
    wire [2:0] out00;
    ripplecarry rca0(.A(A[2:0]), .B(B[2:0]), .C_in(C_in), .Out(out00), .C_out(c0));
    
    wire [2:0] out0;
    wire [2:0] out1;
    wire c10;
    wire c11;
    ripplecarry rca10(.A(A[5:3]), .B(B[5:3]), .C_in(1'b0), .Out(out0), .C_out(c10));
    ripplecarry rca11(.A(A[5:3]), .B(B[5:3]), .C_in(1'b1), .Out(out1), .C_out(c11));
    
    always @(*) begin
    case (c0)
        0 : begin Out = {out0,out00}; C_out = c10; end
        1 : begin Out = {out1,out00}; C_out = c11; end 
    endcase
    end
endmodule

 
