`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/05 10:54:49
// Design Name: 
// Module Name: tb_HalfAdder
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


module tb_HalfAdder();      // ���� ����� ���� �������� ����
    
    reg i_A, i_B;

    wire o_sum, o_carry;

//dut(design under test) : ���� �׽�Ʈ �ϰ� ���� �κ�
    HalfAdder dut(
        .i_A(i_A),
        .i_B(i_B),
        .o_sum(o_sum),
        .o_carry(o_carry)
    );

    initial begin
        #00 i_A = 1'b0; i_B =1'b0;
        #10 i_A = 1'b0; i_B =1'b1;
        #10 i_A = 1'b1; i_B =1'b0;
        #10 i_A = 1'b1; i_B =1'b1;
        #10 $finish;
    end

endmodule
