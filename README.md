# Ultimate Pong

Contributors: Charles Mo, Patricia Luis, Suzelle Mejia

Inspired by Will Green's Blog. Check out his blog at: https://projectf.io/.

# Video Demonstration

If you'd like to check out our game in action, here's the link: 

# Project Overview

Our final project for EC311 at Boston University is a single player VGA pong game, similar to the classic Atari game in which there is a slider on the bottom and a ball bouncing around. The objective of the game is to catch the falling ball with the paddle at the bottom. To increase difficulty we added speed with each collision, and to add our own spin on the classic several decoy balls as the game progresses. We also implemented a score counter, which increments each time there is a collision of the ball on the paddle. This score is shown on the 7-segment display as the player runs the game. If you miss the ball, the game will end displaying a game over screen before returning to the home screen.  

# How run our project

Download the zip file and modify the constraints as needed (the constraints used as for the Nexys-A7 100T FPGA board). Open the 'pong2.xpr' file with Vivado 2020.1. Then, either run the synthesis, implementation, then bitstream or program the device with top.bit under 'pong2.runs/impl_1'.  Turn the FPGA on and connect the VGA and you will see the main menu screen. To begin playing press the center button (or button corresponding to your constraints file) in order to prompt the game to run. As the game is running, use two buttons (again, left or right button or corresponding buttons in your constraints file) on the FPGA board to move the paddle left and right and catch the ball. The longer you play the more challenging it gets. As you play your score will be available on the 7-segment display. Once you lose the screen will say GAME OVER, and then press the start button again to return to the home screen that says PONG (note: the game over screen will still be present unless the player presses the left/right button in the game mode i.e. left/right not in the main menu screen).

# Code Overview

-First we needed to get the VGA display actually working (vga640x480.v), and the timing working (clock_divider.v). 
-After that we needed to add the actual game onto the screen as well as graphics to the background (game.v & bg_gen.v). 
-The opening screen also needed to be designed (menu_screen.v & sram.v). 
-Then making the sqaures on the screen and the paddle functional (paddle.v & square.v & start_square.v & debounce.v).
-The start button for the game to begin and exit the homescreen (increment_one.v).
-Pushing the score onto the 7 segment display (dec_bcd.v & num_hex.v & score_to_7seg.v). 
-Then calling the modules to work together and actually implement the game (topmodule.v)


