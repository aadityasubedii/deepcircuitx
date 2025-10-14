`timescale 1ns / 1ps
module full_adder(
    input a_in,b_in,c_in,
    output sum,carry   
    );
    wire w1,w2,w3;
half_adder1 ha_0(w1,w2,a_in,b_in);
half_adder2 ha_1(sum,c_out,w1,c_in);
or(carry,w2,w3);
endmodule