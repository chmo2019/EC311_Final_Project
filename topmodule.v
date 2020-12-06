`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 09:03:24 PM
// Design Name: 
// Module Name: topmodule
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


module topmodule();

reg [7:0] highscore = 0; 
wire [7:0] highestscore = 0; 
wire [7:0] currentscore = 0;

compare ct(.highscore(highscore), .currentscore(currentscore), .highestscore(highestscore));

always @(*) begin 
    highscore = highestscore; 
end 

endmodule
