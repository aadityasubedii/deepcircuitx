module Four_bit_adder (Num_1, Num_2, C_in, Out, C_out);
	input wire [3:0] Num_1,Num_2;
	input wire C_in;
	output wire [3:0] Out;
	output wire C_out;
	
	wire [4:0]sum;
	assign  sum  = Num_1+Num_2+C_in;
	assign C_out = sum[4];
	assign Out =sum[3:0];
	
endmodule

