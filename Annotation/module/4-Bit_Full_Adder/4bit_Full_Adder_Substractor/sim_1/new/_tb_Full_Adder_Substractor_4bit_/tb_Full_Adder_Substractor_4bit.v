`timescale 1ns / 1ps

module tb_Full_Adder_Substractor_4bit();

    reg [3:0] i_A;
    reg [3:0] i_B;
    reg i_Mode;
    wire [3:0] o_Sum;
    wire o_Cout;
    
    Full_Adder_Substractor_4bit dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_Mode(i_Mode),
        .o_Sum(o_Sum),
        .o_Cout(o_Cout)
    );

    initial begin
        #00 i_A = 4'd10; i_B= 4'd8; i_Mode = 1'b0;
        #10 i_A = 4'd10; i_B= 4'd9; i_Mode = 1'b1;

        #10 $finish;
    end

endmodule
