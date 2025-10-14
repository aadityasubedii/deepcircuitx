`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 15:44:43
// Design Name: 
// Module Name: tb_FA_SUB_4bit
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


module tb_FA_SUB_4bit();

    reg [3:0] i_A, i_B;
    reg i_mode;

    wire [3:0] o_sum;
    wire o_carry;

    FA_SUB_4bit dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_mode(i_mode),
        .o_sum(o_sum),
        .o_carry(o_carry)
    );

    initial begin
        #00 i_A = 4'd5; i_B = 4'd3; i_mode = 0;
        #10 i_A = 4'd11; i_B = 4'd12; i_mode = 0;
        #10 i_A = 4'd9; i_B = 4'd5; i_mode = 0;
        #10 i_A = 4'd7; i_B = 4'd3; i_mode = 1;
        #10 i_A = 4'd2; i_B = 4'd8; i_mode = 1;
        #10 i_A = 4'd3; i_B = 4'd12; i_mode = 1;
        #10 $finish;
    end
endmodule
