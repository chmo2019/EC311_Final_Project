`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 12:23:52 AM
// Design Name: 
// Module Name: binary_bcd
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


module binary_bcd(
    input [5:0] bin,
    output reg [7:0] bcd
    );
    
    always @(*) begin
        if (bin < 10) begin
            bcd = bin;
        end
        else if (bin < 20) begin 
            bcd[7:4] = 1; 
            bcd[3:0] = bin - 10;
        end
        else if (bin < 30) begin 
            bcd[7:4] = 2; 
            bcd[3:0] = bin - 20;
        end
        else if (bin < 40) begin 
            bcd[7:4] = 3; 
            bcd[3:0] = bin - 30;
        end
        else if (bin < 50) begin 
            bcd[7:4] = 4; 
            bcd[3:0] = bin - 40;
        end    
        else if (bin < 60) begin 
            bcd[7:4] = 5; 
            bcd[3:0] = bin - 50;
        end
        else begin 
            bcd[7:4] = 6; 
            bcd[3:0] = bin - 60;
        end
    end
endmodule

