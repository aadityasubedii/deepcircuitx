`timescale 1ns / 1ps

module Four_Bit_FullAdder(
    input [3:0] i_A,
    input [3:0] i_B,
    input i_Cin,
    output [3:0] o_Sum, 
    output o_Cout
    );

    wire w_Cout_0, w_Cout_1, w_Cout_2;

    FullAdder FA0(
        .i_A(i_A[0]),
        .i_B(i_B[0]),
        .i_Cin(i_Cin),
        .o_Sum(o_Sum[0]),
        .o_Cout(w_Cout_0)
    );

    FullAdder FA1(
        .i_A(i_A[1]),
        .i_B(i_B[1]),
        .i_Cin(w_Cout_0),
        .o_Sum(o_Sum[1]),
        .o_Cout(w_Cout_1)
    );
    
    FullAdder FA2(
        .i_A(i_A[2]),
        .i_B(i_B[2]),
        .i_Cin(w_Cout_1),
        .o_Sum(o_Sum[2]),
        .o_Cout(w_Cout_2)
    );

    FullAdder FA3(
        .i_A(i_A[3]),
        .i_B(i_B[3]),
        .i_Cin(w_Cout_2),
        .o_Sum(o_Sum[3]),
        .o_Cout(o_Cout)
    );
    
endmodule
