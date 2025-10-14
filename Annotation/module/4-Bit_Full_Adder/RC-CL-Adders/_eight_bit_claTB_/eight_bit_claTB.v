// Lab 3 | 8-bit CL Adder Testbench

`timescale 1ns/1ns
module eight_bit_claTB();

reg[7:0] a, b;
reg cin;
wire[7:0] sum;
wire cout;

//Instantiation
eight_bit_cla(.A(a), .B(b), .C0(cin), .S(sum), .C8(cout));

initial begin: apply_stimulus
	reg[7:0] invect;
	cin = 1'b0;
	
	for(invect = 0; invect < 129; invect=invect+1) begin
		if(invect % 2 != 0) cin = ~cin;
		a = invect;
		b = invect;
		#5;
	end
end
endmodule
