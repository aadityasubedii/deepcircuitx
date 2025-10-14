// Lab 3 | 4-bit RC Adder Testbench

`timescale 1ns/1ns
module four_bit_rcaTB();

reg[3:0] a, b;
reg cin;
wire[3:0] sum;
wire cout;

//Instantiation
four_bit_rca(.A(a), .B(b), .Cin(cin), .S(sum), .Cout(cout));

initial begin: apply_stimulus
	reg[3:0] invect;
	cin = 1'b0;
	
	for(invect = 0; invect < 9; invect=invect+1) begin
		if(invect == 4) cin = 1'b1;
		a = invect;
		b = invect;
		#5;
		end
end
endmodule
