`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2022 13:57:40
// Design Name: 
// Module Name: singen_to_effects_TEST
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


module singen_to_effects_TEST;

reg clk;

wire [11:0] data_out_sin;
wire [11:0] data_out_OD;
wire [11:0] data_out_DELAY;
wire [11:0] data_out_ECHO;
wire [11:0] data_out_REVERB;

singen_to_effects uut (
    .clk(clk), 
    .data_out_sin(data_out_sin), 
    .data_out_OD(data_out_OD), 
    .data_out_DELAY(data_out_DELAY),
    .data_out_ECHO(data_out_ECHO),
    .data_out_REVERB(data_out_REVERB)
    );
    
    initial begin
     clk = 0;
    end
    always begin
     #5 clk = ~clk;
    end
endmodule
