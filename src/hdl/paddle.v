`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 05:08:13 PM
// Design Name: 
// Module Name: paddle
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


module paddle
    #(
    P_WIDTH=30,     // half the paddle width
    P_HEIGHT=5,     // half the paddle height     
    IX=320,         // initial horizontal position of square centre
    IY=480,         // initial vertical position of square centre
    IX_DIR=0,       // initial horizontal direction: 0 idle, 1 is left, 2 is right
    D_WIDTH=640,    // width of display
    D_HEIGHT=480    // height of display
    )
    (
    input wire i_clk,         // base clock
    input wire i_ani_stb,     // animation clock: pixel clock is 1 pix/frame
    input wire i_rst,         // reset: returns animation to starting position
    input wire i_animate,
    input wire [1:0] BTN_LR,     // bit 0 - right, bit 1 - left
    output reg [11:0] o_x1,  // square left edge: 12-bit value: 0-4095
    output reg [11:0] o_x2,  // square right edge
    output reg [11:0] o_y1,  // square top edge
    output reg [11:0] o_y2   // square bottom edge
    );
    
    reg [11:0] x = IX;   // horizontal position of square centre
    reg [11:0] y = IY;   // vertical position of square centre
    
    always @ (posedge i_clk)
    begin
        if (i_rst)  // on reset return to starting position
        begin
            x <= IX;
            y <= IY;
        end
        if (i_animate && i_ani_stb)
        begin
            // TODO accelerate paddle if pressed for longer time
            if (BTN_LR[0] && ! BTN_LR[1] && o_x2<=D_WIDTH)
                x <= x + 5; // move paddle to right
            if (BTN_LR[1] && ! BTN_LR[0] && o_x1>=2)
                x <= x - 5; // move paddle to left
        end
    end
    
    always @(*)
    begin
        o_x1 = x - P_WIDTH;  // left
        o_x2 = x + P_WIDTH;  // right
        o_y1 = y - P_HEIGHT;  // top
        o_y2 = y + P_HEIGHT;  // bottom
    end
    
endmodule
