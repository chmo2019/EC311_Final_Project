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
    input [3:0] ctrl,
    input in,
    output Q
    );
    
    wire [3:0] i, o;
    wire n;
    
    flip_flop f1(.clk(clk), .reset(reset), .D(i[3]), .Q(o[3]));
    flip_flop f2(.clk(clk), .reset(reset), .D(i[2]), .Q(o[2])); 
    flip_flop f3(.clk(clk), .reset(reset), .D(i[1]), .Q(o[1]));
    flip_flop f4(.clk(clk), .reset(reset), .D(i[0]), .Q(o[0]));
    
    mux m1(.ctrl(in), .a(ctrl[3]), .b(n), .out(i[3]));
    mux m2(.ctrl(in), .a(ctrl[2]), .b(o[3]), .out(i[2]));
    mux m3(.ctrl(in), .a(ctrl[1]), .b(o[2]), .out(i[1]));
    mux m4(.ctrl(in), .a(ctrl[0]), .b(o[1]), .out(i[0]));
    
    xor G1(n, o[0], o[1]);
    
    assign Q = n;    
    
    
endmodule
