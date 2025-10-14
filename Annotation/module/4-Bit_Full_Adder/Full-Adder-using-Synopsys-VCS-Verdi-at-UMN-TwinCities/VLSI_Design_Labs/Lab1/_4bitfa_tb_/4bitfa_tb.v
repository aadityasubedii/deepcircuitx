module fourbitfa_tb; //random inputs, decimal values including a check

reg [3:0] a,b; 	  // 4-bit inputs (to be chosen randomly)
reg c; 		  // carry input (to be chosen randomly)
wire [4:0] s; 	  // 5-bit output of the RCA circuit
reg [4:0] check;  // 5-bit sum value used to check correctness

// instantiate the 4-bit ripple-carry adder
RCA rcal(a, b, c, s);

// apply a specific set of input vectors every 10 time units
initial repeat (20) begin
	// get new operand values and compute and check value
	a = $random; b = $random; c = $random;
	check = a + b + c;

	// compute and display the sum every 10 time units
	#10 $display($time, " %d + %d + %d = %d (%d)", a, b, c, s, check);
end

endmodule
 
