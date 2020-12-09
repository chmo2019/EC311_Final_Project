`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:19:40 AM
// Design Name: 
// Module Name: timer_display
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


module timer_display(
    input [5:0] hour,
    input [5:0] min,
    input [5:0] sec,
    input clk,
    output reg [6:0] segments,
    output reg [7:0] anode
    );
    
    wire [7:0] hour_bcd;
    wire [7:0] min_bcd;
    wire [7:0] sec_bcd;
    
    binary_to_bcd btb_h(.bin(hour), .bcd(hour_bcd));
    binary_to_bcd btb_m(.bin(min), .bcd(min_bcd));
    binary_to_bcd btb_s(.bin(sec), .bcd(sec_bcd));
    
    wire [6:0] seg0, seg1, seg2, seg3, seg4, seg5;
    wire [3:0] n0 = sec_bcd[3:0], n1 = sec_bcd[7:4];
    wire [3:0] n2 = min_bcd[3:0], n3 = min_bcd[7:4];
    wire [3:0] n4 = hour_bcd[3:0], n5 = hour_bcd[7:4];
    
    one_num s0(.num(n0), .segments(seg0));
    one_num s1(.num(n1), .segments(seg1));
    one_num s2(.num(n2), .segments(seg2));
    one_num s3(.num(n3), .segments(seg3));
    one_num s4(.num(n4), .segments(seg4));
    one_num s5(.num(n5), .segments(seg5));
    
    // declare a counter
    reg [2:0] counter = 0;
    
endmodule