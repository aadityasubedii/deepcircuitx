/*

	s10
  s	s
  2	0
  0	0
	s11
  s	s
  2	0
  1	1
	s12	*s02
   
	\/s22
  
*/

module data_decoder 
(	
	input  [4:0] char0,
	input  [4:0] char1,
	input  [4:0] char2,
	input  [4:0] char3,
	input  [4:0] char4,
	input  [4:0] char5,
	input  [4:0] char6,
	input  [4:0] char7,
	
	input  [7:0] point,
	
	output [71:0] data_out
);

	wire [4:0] ichar [7:0]; 
	
	reg [71:0] data_buf;
	
	assign ichar[7] = char7;
	assign ichar[6] = char6;
	assign ichar[5] = char5;
	assign ichar[4] = char4;
	assign ichar[3] = char3;
	assign ichar[2] = char2;
	assign ichar[1] = char1;
	assign ichar[0] = char0;

	
	
	
	

	genvar i;
	generate
		for(i = 0; i < 8;  i= i + 1)
		begin: LOOP
			always @*
			begin
				case(ichar[i])
					5'h0: data_buf[i*9+8 : i*9] = 9'b011_101_011;
					5'h1: data_buf[i*9+8 : i*9] = 9'b000_000_011;
					5'h2: data_buf[i*9+8 : i*9] = 9'b010_111_001;
					5'h3: data_buf[i*9+8 : i*9] = 9'b000_111_011;
					5'h4: data_buf[i*9+8 : i*9] = 9'b001_010_011;
					5'h5: data_buf[i*9+8 : i*9] = 9'b001_111_010;
					5'h6: data_buf[i*9+8 : i*9] = 9'b011_111_010;
					5'h7: data_buf[i*9+8 : i*9] = 9'b000_001_011;
					5'h8: data_buf[i*9+8 : i*9] = 9'b011_111_011;
					5'h9: data_buf[i*9+8 : i*9] = 9'b001_111_011;
					5'hA: data_buf[i*9+8 : i*9] = 9'b011_011_011;
					5'hB: data_buf[i*9+8 : i*9] = 9'b011_110_010;
					5'hC: data_buf[i*9+8 : i*9] = 9'b011_101_000;
					5'hD: data_buf[i*9+8 : i*9] = 9'b010_110_011;
					5'hE: data_buf[i*9+8 : i*9] = 9'b011_111_000;
					5'hF: data_buf[i*9+8 : i*9] = 9'b011_011_000;
					
					5'h1F: data_buf[i*9+8 : i*9] = 9'b111_111_111; // all segments is on
					
					5'h1E: data_buf[i*9+8 : i*9] = 9'b011_010_011; // H sign
					
					5'h1D: data_buf[i*9+8 : i*9] = 9'b001_011_001; // o(degree) sign
					
					
					
					default: data_buf[i*9+8 : i*9] = 9'b0; // all segments is off
				endcase
			end
			
			assign data_out[i*9+8 : i*9] = data_buf[i*9+8 : i*9] | {point[i],2'b0};
			
		end
	endgenerate
		
endmodule












