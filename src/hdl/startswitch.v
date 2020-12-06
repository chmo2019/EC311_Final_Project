`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 06:07:26 PM
// Design Name: 
// Module Name: startswitch
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


module startswitch(
    input startswt, 
    output reg start
    );
    
always @ (*) begin 
    if (startswt == 1) begin 
        start = 1; 
    end 
    else begin 
        start = 0; 
    end 
end 
    
endmodule
