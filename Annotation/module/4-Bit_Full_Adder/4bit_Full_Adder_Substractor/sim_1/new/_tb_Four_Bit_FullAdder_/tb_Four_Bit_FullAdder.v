`timescale 1ns / 1ps

module tb_Four_Bit_FullAdder();

    reg [3:0] i_A;
    reg [3:0] i_B;
    reg i_Cin;
    wire [3:0] o_Sum;
    wire o_Cout;
    
    // dut -> design under test
    Four_Bit_FullAdder dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_Cin(1'b0),
        .o_Sum(o_Sum),
        .o_Cout(o_Cout)
    );

    initial begin
        #00 i_A = 4'd1; i_B= 4'd9;
        #10 i_A = 4'd2; i_B= 4'd9;
        #10 i_A = 4'd3; i_B= 4'd9;
        #10 i_A = 4'd4; i_B= 4'd9;
        #10 $finish;
    end

endmodule
