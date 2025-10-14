`timescale 1ns/1ns
`include "decoder2to4.v"

module tb;

reg [0:1] A;
wire [3:0] b;

deco2to4 uut(A, b);

initial begin

    $dumpfile("tb.vcd");
    $dumpvars(0, tb);


    A[0] =0 ;  
    A[1] =0 ; #12;
    A[0] =1 ; 
    A[1] =0 ; #12;
    A[0] =0 ; 
    A[1] =1 ; #12;
    A[0] =1 ; 
    A[1] =1 ; #12;

    $display("end of test reached");
end


endmodule