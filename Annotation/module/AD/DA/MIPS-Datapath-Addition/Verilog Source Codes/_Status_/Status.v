module status(n_out, z_out, v_out, alu_result);
input [31:0] alu_result;
output n_out, z_out, v_out;
assign z_out = ~(|alu_result);
assign n_out = alu_result[31];


// create v out
endmodule
