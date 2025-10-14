//Verilog Code for 1 Bit Full-adder
module full_adder_1bit(a,b,cin,sum);
input a,b,cin;
output sum;

assign sum=a^b^cin;

endmodule
