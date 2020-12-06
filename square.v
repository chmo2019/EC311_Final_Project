`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2020 06:45:56 PM
// Design Name: 
// Module Name: square
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


module square #(
    PH=10,
    H_SIZE=80,      // half square width (for ease of co-ordinate calculations)
    IX=320,         // initial horizontal position of square centre
    IY=240,         // initial vertical position of square centre
    IY_DIR=0,       // initial vertical direction: 1 is down, 0 is up
    D_WIDTH=640,    // width of display
    D_HEIGHT=480    // height of display
    )
    (
    input wire i_x1, // paddle left edge
    input wire i_x2, // paddle right edge
    input wire i_clk,         // base clock
    input wire i_ani_stb,     // animation clock: pixel clock is 1 pix/frame
    input wire i_rst,         // reset: returns animation to starting position
    input wire i_animate,     // animate when input is high
    output reg [11:0] o_x1,  // square left edge: 12-bit value: 0-4095
    output reg [11:0] o_x2,  // square right edge
    output reg [11:0] o_y1,  // square top edge
    output reg [11:0] o_y2   // square bottom edge
    );

    reg [11:0] x = IX;   // horizontal position of square centre
    reg [11:0] y = IY;   // vertical position of square centre
    reg y_dir = IY_DIR;  // vertical animation direction
    reg x_dir;
    reg [10:0] ctr = 0;
    reg [5:0] inc = 1; 
    
    wire IX_DIR;
    assign IX_DIR = i_clk;
    
    //reg ctr; // acceleration counter
    // || (o_y2 == i_y1 && o_x2 <= i_x2 && o_x2 >= i_x1) ||  (o_y2 == i_y1 && o_x1 <= i_x2 && o_x1 >= i_x1)
    always @ (posedge i_clk)
    begin
        if (i_rst)//|| (y == D_HEIGHT - H_SIZE - 1))  // on reset return to starting position
        begin
            x <= IX;
            y <= IY;
            x_dir <= IX_DIR;
            y_dir <= IY_DIR;
            ctr = 0;
            inc = 1;
        end
        if (i_animate && i_ani_stb)
        begin
            if (ctr==3)
                inc <= inc + 1;
            x <= (x_dir) ? x + inc : x - inc;  // move left if positive x_dir
            y <= (y_dir) ? y + inc : y - inc;  // move down if positive y_dir

            if (x <= H_SIZE + 1)  // edge of square is at left of screen
                x_dir <= 1;  // change direction to right
                ctr = ctr + 1;
            if (x >= (D_WIDTH - H_SIZE - 1))  // edge of square at right
                x_dir <= 0;  // change direction to left
                ctr = ctr + 1;          
            if (y <= H_SIZE + 1)  // edge of square at top of screen
                y_dir <= 1;  // change direction to down
                ctr = ctr + 1;
            if (y >= (D_HEIGHT - H_SIZE - 1) || y == (D_HEIGHT - PH - 1))  // edge of square at bottom
                y_dir <= 0;  // change direction to up
                ctr = ctr + 1;              
        end
    end
    //  || (o_x2==i_x1 && o_y1 == i_y1)  || (o_x1==i_x1 && o_y1 == i_y1)
    always @(*)
    begin
        o_x1 = x - H_SIZE;  // left: centre minus half horizontal size
        o_x2 = x + H_SIZE;  // right
        o_y1 = y - H_SIZE;  // top
        o_y2 = y + H_SIZE;  // bottom     
    end
endmodule
