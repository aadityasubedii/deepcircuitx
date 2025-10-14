// define a 1-bit full adder
module fulladd(sum, c_out, a, b, c_in);

// I/O declaration
output sum, c_out;
input a, b, c_in;

reg sum, c_out;

// behavioral logic description
always @ (a or b or c_in)
begin
	{c_out, sum} <=  a + b + c_in;
end

// call system function to show the model being used
initial
begin
        $display("--------------Using bh model-----------------\n");
end

endmodule
