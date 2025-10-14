
module deco1to2(A,D);

    input A;
    output [0:1] D;

    //always @(posedge clk ) begin
    assign D[0] = A;
    assign D[1] = ~A;
    //end


endmodule
 