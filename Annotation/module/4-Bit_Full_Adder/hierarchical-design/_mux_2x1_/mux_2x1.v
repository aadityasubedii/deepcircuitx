`timescale 1ns / 1ps
module mux_2x1(
    input in_0, in_1 ,sel, 
    output mux_out
    );
    wire w1, w2, w3;
    not(w1,sel);
    and(w2,in_0,w1);
    and(w3,in_1,sel);
    or(mux_out,w2,w3);
endmodule