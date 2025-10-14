`timescale 1ns / 1ps
module mux_2x1_conditionaloper(
    input in_0,in_1,sel,
    output mux_outt
    );
    assign mux_outt= sel? in_1: in_0;
endmodule