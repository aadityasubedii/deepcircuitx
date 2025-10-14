`timescale 1ns / 1ps

module tb();
reg [3:0]A;
reg [3:0]B;
reg Cin = 0;
wire Cout,s0,s1,s2,s3;
integer i=0;

 Ripple_adder_design_wrapper
   U1(A,
    B,
    Cin,
    Cout,
    s0,
    s1,
    s2,
    s3);
initial begin
    for(i=0;i<16;i=i+1)begin
        {A[3],A[2],A[1],A[0]}<=i;
        B <= $urandom_range(0,15);
        #5;
    end
end
    
endmodule
