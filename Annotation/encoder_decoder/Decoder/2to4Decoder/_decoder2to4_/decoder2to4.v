`include "decoder1to2.v"

module deco2to4(A,D);

    input [0:1] A;
    output [3:0] D;

    wire  [3:0] W;

    deco1to2 U0(.A(A[0]), .D(W[3:2]));
    deco1to2 U1(.A(A[1]), .D(W[1:0]));

    assign D[0] = W[3] & W[1];
    assign D[1] = W[2] & W[1];
    assign D[2] = W[3] & W[0];
    assign D[3] = W[2] & W[0]; 
 
endmodule
