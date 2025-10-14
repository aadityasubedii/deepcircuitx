// Lab 4 | RC Adder/Subtractor Testbench
module four_bit_rcaTB();

reg[3:0] a,b;
reg mode;

wire[3:0] result, cout;
wire ovfl;

//Instantiation
four_bit_rca(.A(a), .B(b), .S(result), .Cout(cout), .dir(mode), .overflow(ovfl));


initial begin
	$monitor("A=%b, B=%b, Mode=%b, Result=%b, cout[3]=%b, cout[2]=%b, ovfl=%b", a, b, mode, result, cout[3], cout[2], ovfl);
end

initial begin
	//addition
	#0 a = 4'b0000; b = 4'b0001; mode = 1'b0;
	#10 a = 4'b0010; b = 4'b0101;
	#10 a = 4'b0110; b = 4'b0001;
	#10 a = 4'b0101; b = 4'b0001;

	//subtraction
	#10 a = 4'b0111; b = 4'b0101; mode = 1'b1;
	#10 a = 4'b0101; b = 4'b0100;
	#10 a = 4'b0110; b = 4'b0011;
	#10 a = 4'b0110; b = 4'b0010;

	//overflow
	#10 a = 4'b0111; b = 4'b0101; mode = 1'b0;
	#10 a = 4'b1000; b = 4'b1011;
	#10 a = 4'b0110; b = 4'b1100; mode = 1'b1;
	#10 a = 4'b1000; b = 4'b0010;
end
endmodule
