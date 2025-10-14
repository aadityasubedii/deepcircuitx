`timescale 1ns / 1ps

// Test Bench of FullAdder
module tb_FullAdder();
    
    reg i_A, i_B, i_Cin;
    wire o_Sum, o_Cout;

    // dut -> design under test
    FullAdder dut(
        .i_A(i_A),
        .i_B(i_B),
        .i_Cin(i_Cin),
        .o_Sum(o_Sum),
        .o_Cout(o_Cout)
    );

    initial begin
        #00 i_A = 1'b0; i_B = 1'b0; i_Cin = 1'b0;
        #10 i_A = 1'b0; i_B = 1'b0; i_Cin = 1'b1;
        #10 i_A = 1'b0; i_B = 1'b1; i_Cin = 1'b0;
        #10 i_A = 1'b0; i_B = 1'b1; i_Cin = 1'b1;
        #10 i_A = 1'b1; i_B = 1'b0; i_Cin = 1'b0;
        #10 i_A = 1'b1; i_B = 1'b0; i_Cin = 1'b1;
        #10 i_A = 1'b1; i_B = 1'b1; i_Cin = 1'b0;
        #10 i_A = 1'b1; i_B = 1'b1; i_Cin = 1'b1;
        #10 $finish;
    end

endmodule
