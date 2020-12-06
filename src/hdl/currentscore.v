`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 11:07:06 PM
// Design Name: 
// Module Name: currentscore
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


module currentscore( 
    input collision, 
    output reg [7:0] scorecounter
    );
    
initial scorecounter = 0; 

always @(*) begin 
    if (collision == 1) begin 
        scorecounter = scorecounter  + 1; 
    end
    else if (collision == 0) begin 
        scorecounter = scorecounter; 
    end 
end 
    
endmodule
