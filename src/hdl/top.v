`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 07:15:08 PM
// Design Name: 
// Module Name: top
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


module top(
    input CLK,
    input RST_BTN,
    input [1:0] BTN_LR,
    output VGA_HS,
    output VGA_VS,
    output reg [3:0] VGA_R,
    output reg [3:0] VGA_G,
    output reg [3:0] VGA_B
    );
    
    localparam PX = 320; // initial paddle x
    localparam PY = 480; // initial paddle y
    localparam PW = 100;
    localparam PH = 40;
    
    localparam IX = 320; // intial ball x
    localparam IY = 470 - PH - PH; //initial ball y
    localparam B_SIZE = 25; // ball size
    
    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    wire x_in;
    assign x_in = CLK;
    
    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511
    wire animate;  // high when we're ready to animate at end of drawing

    // generate a 25 MHz pixel strobe
    reg [15:0] cnt = 0;
    reg pix_stb = 0;
    
    always @(posedge CLK)
    begin
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000
    end
    
    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS), 
        .o_vs(VGA_VS), 
        .o_x(x), 
        .o_y(y),
        .o_animate(animate)
    );
    
    reg sq_a, sq_b; // registers to assign objects
    
    wire [11:0] sq_a_x1, sq_a_x2, sq_a_y1, sq_a_y2; // positions bits for ball
    wire [11:0] sq_b_x1, sq_b_x2, sq_b_y1, sq_b_y2; // position bits for paddle
    
    square #(.PH(PH), .IX(IX), .IY(IY), .H_SIZE(B_SIZE)) sq_a_anim (
        .i_x1(sq_b_x1),
        .i_x2(sq_b_x2),
        .i_clk(CLK), 
        .i_ani_stb(pix_stb),
        .i_rst(rst),
        .i_animate(animate),
        .o_x1(sq_a_x1),
        .o_x2(sq_a_x2),
        .o_y1(sq_a_y1),
        .o_y2(sq_a_y2)
    ); // ball instance
    
    paddle #(.P_WIDTH(PW), .P_HEIGHT(PH)) p(
        .i_clk(CLK), 
        .i_ani_stb(pix_stb),
        .i_rst(rst),
        .i_animate(animate),
        .BTN_LR(BTN_LR),
        .o_x1(sq_b_x1),
        .o_x2(sq_b_x2),
        .o_y1(sq_b_y1),
        .o_y2(sq_b_y2)
    ); // paddle instance
    
    always @ (*)
    begin
        sq_a = ((x > sq_a_x1) & (y > sq_a_y1) & (x < sq_a_x2) & (y < sq_a_y2)) ? 1 : 0;
        sq_b = ((x > sq_b_x1) & (y > sq_b_y1) & (x < sq_b_x2) & (y < sq_b_y2)) ? 1 : 0;
    end
    
    always @(*)
    begin
        VGA_R[3] = sq_a;
        VGA_G[3] = sq_b;
    end
    
    
endmodule
