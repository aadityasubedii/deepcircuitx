//Verilog Testbench Code for one digit BCD Adder
module one_digit_BCD_adder_tb();

reg [3:0]A,B;
reg Cin;
wire [3:0]S;
wire C;

one_digit_BCD_adder dut(A,B,Cin,S,C);

initial begin
   A=4'b0000;B=4'b0000;Cin=0;
#5 A=4'b0001;B=4'b0001;
#5 A=4'b0010;B=4'b0010;
#5 A=4'b0011;B=4'b0011;
#5 A=4'b0100;B=4'b0100;
#5 A=4'b0101;B=4'b0101;
#5 A=4'b0110;B=4'b0110;
#5 A=4'b0111;B=4'b0111;
#5 A=4'b1000;B=4'b1000;
#5 A=4'b1001;B=4'b1001;
// Can Add More Cases
#5 $finish;
end

endmodule
