`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 06:13:54 PM
// Design Name: 
// Module Name: highscore
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


module highscore(
    input highscore, 
    input currentscore, 
    output reg highestscore
    );
    
always @ (*) begin 
    if (highscore < currentscore) begin 
        highestscore = currentscore;
    end 
    else begin 
        highestscore = highscore;
    end 
end 

endmodule
