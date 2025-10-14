module sxrRISC621_grp (data_in, eq);

input [1:0] data_in;

output reg	[4:0] eq;

always @ (data_in)

	case (data_in)
		
		2'h0:
			eq = 4'h0001;
		
		2'h1:
			eq = 4'h0002;
		
		2'h2:
			eq = 4'h0004;
		
		2'h3:
			eq = 4'h0008;
		
		default:
			eq = 4'h0000;
		
	endcase
	
endmodule
