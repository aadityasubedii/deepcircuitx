`timescale 10ns/1ns
module ALU16bit_test;
	reg [15:0] A, B;
	wire [15:0] C;
	wire S, Zr, Cy, P, Ov;
	
	ALU16bit DUT(.x(A), .y(B), .z(C), .sign(S), .zero(Zr), .carry(Cy), .parity(P), .overflow(Ov));
	
	initial
		begin
			$dumpfile("ALU16bit.vcd");
			$dumpvars(0, ALU16bit_test);
			$monitor($time, " A=%h, B=%h, C=%h, Sign=%b, Zero=%b, Carry=%b, Partity=%b, Overflow=%b", A, B, C, S, Zr, Cy, P, Ov);
			#5 A=16'h8fff; B=16'h8000;
			#5 A=16'hfffe; B=16'h0002;
			#5 A=16'hAAAA; B=16'h5555;
			#5 A=16'hA44b; B=16'h10d5;
			#5 $finish;
		end
endmodule