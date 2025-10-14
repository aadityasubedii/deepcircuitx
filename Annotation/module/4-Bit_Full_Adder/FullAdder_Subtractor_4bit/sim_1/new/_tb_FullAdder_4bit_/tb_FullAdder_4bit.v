`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 14:06:08
// Design Name: 
// Module Name: tb_FullAdder_4bit
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


module tb_FullAdder_4bit();

    reg [3:0] i_A, i_B;
    reg i_Cin;

    wire [3:0] o_sum;
    wire o_carry;

    fourbit_4bit_Adder dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_Cin(1'b0),
        .o_sum(o_sum),
        .o_carry(o_carry)
    );

    initial begin
        #00 i_A = 4'b0000; i_B = 4'b0000;
        #10 i_A = 4'd3; i_B = 4'd4;
        #10 i_A = 4'ha; i_B = 4'hb;
        #10 i_A = 4'd5; i_B = 4'd9;
        #10 i_A = 4'd6; i_B = 4'd8;
        #10 i_A = 4'd7; i_B = 4'd7;
        #10 i_A = 4'd3; i_B = 4'd6;
        #10 i_A = 4'd2; i_B = 4'd5;
        #10 $finish;
    end
    
endmodule
