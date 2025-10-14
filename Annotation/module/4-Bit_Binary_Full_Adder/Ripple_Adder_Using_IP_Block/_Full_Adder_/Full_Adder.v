`timescale 1ns / 1ps
module Full_Adder(
    input A,
    input B,
    input Cin,
    output S,
    output Co
    );
    assign S = A^B^Cin;
    assign Co = (A^B)&Cin | (A&B);
endmodule
