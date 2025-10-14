// define 1-bit full adder
module fulladd(sum, c_out, a, b, c_in);

// I/O declaration, wire type by default
output sum, c_out;
input a, b, c_in;

assign sum = a ^ b ^ c_in;
assign c_out = (a & b) | (a & c_in) | (b & c_in);

initial
begin
        $display("--------------Using dataflow model-----------------\n");
end

endmodule
