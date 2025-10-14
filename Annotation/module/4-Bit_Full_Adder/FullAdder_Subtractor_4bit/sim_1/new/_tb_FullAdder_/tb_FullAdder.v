`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 11:51:54
// Design Name: 
// Module Name: tb_FullAdder
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


module tb_FullAdder();

    reg i_A, i_B, i_Cin;

    wire o_sum, o_carry;

    FullAdder dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_Cin(i_Cin),
        .o_sum(o_sum),
        .o_carry(o_carry)        
    );

    initial begin
        #00 i_A = 0; i_B = 0; i_Cin = 0;
        #10 i_A = 0; i_B = 0; i_Cin = 1;
        #10 i_A = 0; i_B = 1; i_Cin = 0;
        #10 i_A = 0; i_B = 1; i_Cin = 1;
        #10 i_A = 1; i_B = 0; i_Cin = 0;
        #10 i_A = 1; i_B = 0; i_Cin = 1;
        #10 i_A = 1; i_B = 1; i_Cin = 0;
        #10 i_A = 1; i_B = 1; i_Cin = 1;
        #10 $finish;
    end

endmodule
