`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2016 11:37:46 AM
// Design Name: 
// Module Name: TopMod
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


module TopMod(
    input [7:0] sw, // switch 0-8
    input btnU, // button 1
    input btnL, // button 2
    input btnC, // clear this is tied into both registers so you only need 1
	output [3:0] led // led ouput
    );
    
wire [3:0] A;
wire [3:0] B;
wire [3:0] Y;


RegA regA(sw[7:4],btnC,btnU,A);
RegB regB(sw[7:4],btnC,btnL,B);
ALU alu(A,B,sw[3:2],Y);
Multiplexer1 MUX(sw[1:0],A,B,Y,led);
	
endmodule
