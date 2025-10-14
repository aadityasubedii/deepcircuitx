module adder(
	input [39:0] a,
    input [39:0] b,
    input addsub,
	input adder_en,
    output [39:0] sum
    );

		assign sum = (addsub == 1'b1) ? (b - a) : 
						 (addsub == 1'b0) ? (b + a) :
						 	sum;	

endmodule