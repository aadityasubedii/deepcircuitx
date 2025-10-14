module ALU16bit (x, y, z, sign, carry, overflow, parity, zero);
	input [15:0] x, y;
	output [15:0] z;
	output sign, carry, overflow, parity, zero;
	wire [3:1] c_wire;
	
	assign sign = z[15];
	assign zero = ~|z;
	assign parity = ~^z;
	assign overflow = (x[15] & y[15] & ~z[15]) | (~x[15] & ~y[15] & z[15]);
	
	ALU4bit ALU0(.A(x[3:0]), .B(y[3:0]), .Result(z[3:0]), .Cin(1'b0), .Cout(c_wire[1]));
	ALU4bit ALU1(.A(x[7:4]), .B(y[7:4]), .Result(z[7:4]), .Cin(c_wire[1]), .Cout(c_wire[2]));
	ALU4bit ALU2(.A(x[11:8]), .B(y[11:8]), .Result(z[11:8]), .Cin(c_wire[2]), .Cout(c_wire[3]));
	ALU4bit ALU3(.A(x[15:12]), .B(y[15:12]), .Result(z[15:12]), .Cin(c_wire[3]), .Cout(carry));
endmodule