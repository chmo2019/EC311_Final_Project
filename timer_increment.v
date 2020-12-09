`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:25:22 AM
// Design Name: 
// Module Name: timer_increment
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


module timer_increment(
    input [5:0] h,
    input [5:0] m,
    input [5:0] s,
    output reg [5:0] hour,
    output reg [5:0] min,
    output reg [5:0] sec
    );
    
    wire [5:0] add_sec;
    wire [5:0] add_min;
    wire [5:0] add_hour;
    
    carryselect cs_s(.A(s), .B(6'b000001), .C_in(1'b0), .Out(add_sec)); 
    carryselect cs_m(.A(m), .B(6'b000001), .C_in(1'b0), .Out(add_min)); 
    carryselect cs_h(.A(h), .B(6'b000001), .C_in(1'b0), .Out(add_hour)); 
    
    always @(*) begin
        if (s < 59) begin
            sec = add_sec;
            min = m;
            hour = h;
        end
        else if (m < 59) begin
            sec = 0;
            min = add_min;
            hour = h;
        end 
        else if (h < 23) begin
            sec = 0;
            min = 0;
            hour = add_hour;
        end
        
    end
    
    
            
endmodule

