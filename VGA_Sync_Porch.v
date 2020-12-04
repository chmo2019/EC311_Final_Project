`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 03:33:44 PM
// Design Name: 
// Module Name: VGA_Sync_Porch
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


module VGA_Sync_Porch #(parameter VIDEO_WIDTH = 3,  // remember to 
                        parameter TOTAL_COLS  = 3,  // overwrite
                        parameter TOTAL_ROWS  = 3,  // these defaults
                        parameter ACTIVE_COLS = 2,
                        parameter ACTIVE_ROWS = 2)
  (input i_Clk,
   input i_HSync,
   input i_VSync,
   input [VIDEO_WIDTH-1:0] i_Red_Video,
   input [VIDEO_WIDTH-1:0] i_Grn_Video,
   input [VIDEO_WIDTH-1:0] i_Blu_Video,
   output reg o_HSync,
   output reg o_VSync,
   output reg [VIDEO_WIDTH-1:0] o_Red_Video,
   output reg [VIDEO_WIDTH-1:0] o_Grn_Video,
   output reg [VIDEO_WIDTH-1:0] o_Blu_Video
   );

  parameter c_FRONT_PORCH_HORZ = 18;
  parameter c_BACK_PORCH_HORZ  = 50;
  parameter c_FRONT_PORCH_VERT = 10;
  parameter c_BACK_PORCH_VERT  = 33;

  wire w_HSync;
  wire w_VSync;
  
  wire [9:0] w_Col_Count;
  wire [9:0] w_Row_Count;
  
  reg [VIDEO_WIDTH-1:0] r_Red_Video = 0;
  reg [VIDEO_WIDTH-1:0] r_Grn_Video = 0;
  reg [VIDEO_WIDTH-1:0] r_Blu_Video = 0;
  
  Sync_To_Count #(.TOTAL_COLS(TOTAL_COLS),
                  .TOTAL_ROWS(TOTAL_ROWS)) UUT 
  (.i_Clk      (i_Clk),
   .i_HSync    (i_HSync),
   .i_VSync    (i_VSync),
   .o_HSync    (w_HSync),
   .o_VSync    (w_VSync),
   .o_Col_Count(w_Col_Count),
   .o_Row_Count(w_Row_Count)
  );
	  
  // Purpose: Modifies the HSync and VSync signals to include Front/Back Porch
  always @(posedge i_Clk)
  begin
    if ((w_Col_Count < c_FRONT_PORCH_HORZ + ACTIVE_COLS) || 
        (w_Col_Count > TOTAL_COLS - c_BACK_PORCH_HORZ - 1))
      o_HSync <= 1'b1;
    else
      o_HSync <= w_HSync;
    
    if ((w_Row_Count < c_FRONT_PORCH_VERT + ACTIVE_ROWS) ||
        (w_Row_Count > TOTAL_ROWS - c_BACK_PORCH_VERT - 1))
      o_VSync <= 1'b1;
    else
      o_VSync <= w_VSync;
  end

  
  // Purpose: Align input video to modified Sync pulses.
  // Adds in 2 Clock Cycles of Delay
  always @(posedge i_Clk)
  begin
    r_Red_Video <= i_Red_Video;
    r_Grn_Video <= i_Grn_Video;
    r_Blu_Video <= i_Blu_Video;

    o_Red_Video <= r_Red_Video;
    o_Grn_Video <= r_Grn_Video;
    o_Blu_Video <= r_Blu_Video;
  end
  
endmodule
