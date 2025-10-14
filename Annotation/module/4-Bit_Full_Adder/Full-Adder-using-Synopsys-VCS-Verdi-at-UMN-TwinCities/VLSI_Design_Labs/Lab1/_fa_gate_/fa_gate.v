// define 1-bit full adder
module fulladd(sum, c_out, a, b, c_in);

// I/O declaration, wire type by default
output sum, c_out;
input a, b, c_in;

// internal ports
wire s1, c1, c2;

xor(s1, a, b);
and(c1, a, b);
xor(sum, s1, c_in);
and(c2, s1, c_in);
or(c_out, c2, c1);

initial
begin
	$display("--------------Using gate model-----------------\n");
end

endmodule

