module signed_adder
#(parameter WIDTH=16)
(
	input signed [WIDTH-1:0] dataa,
	input signed [WIDTH-1:0] datab,
	input cin,
	output [WIDTH:0] result
);

	assign result = dataa + datab + cin;

endmodule


module signed_multiply
#(parameter WIDTH=16)
(
	input signed [WIDTH-1:0] dataa,
	input signed [WIDTH-1:0] datab,
	output [2*WIDTH-1:0] dataout
);

	 assign dataout = dataa * datab;

endmodule


module register
#(parameter WIDTH=16)
(
	input signed [WIDTH-1:0] dataa,
	input clk,
	input reset_n,
	output reg signed [WIDTH-1:0] dataout
);

always @ (posedge clk)
	if(reset_n == 1'b0)
		dataout <= 0;
			
	else				
		dataout <= dataa;

endmodule


module serial_fir_filter
#(parameter WIDTH=16)
(
	input clk, input reset_n,
	input [WIDTH-1:0] d,
	output signed[WIDTH-1:0] q
);
			  
wire signed[WIDTH-1:0] delay[WIDTH-1:0];
wire signed[2*WIDTH-1:0] prod;
wire signed[WIDTH:0] sum;
			  
reg signed [WIDTH-1:0] lut_rom[0:WIDTH-1];			  
reg signed[WIDTH-1:0] coefficient;
			  
assign delay[0] = d;
integer i = 0;
			  
initial
	begin: lut_initalization
		$readmemb("D:/A_Learn/4th_year/232/4_XLTHS_FPGA/FPGA/3_BigProject/B_Project/FPGA_AudioCodec/DE2_i2sound_Group07/rom-data.txt", lut_rom);
	end
					
genvar n;
generate
	for(n = 1; n < WIDTH; n = n + 1)
		begin:generator
			register reg_inst0(.dataa(delay[n-1]),
									 .clk(clk),
									 .reset_n(reset_n),
									 .dataout(delay[n]));
		end
endgenerate
			 
always @(posedge clk)
	for(i = 0; i <= WIDTH - 1; i = i+ 1)
		begin: generate_address
			coefficient  <= lut_rom[i];
		end
					
signed_multiply inst(.dataa(delay[WIDTH-1]),
				         .datab(coefficient),
							.dataout(prod));
				
signed_adder adder_fir(.dataa($signed(prod[2 * WIDTH-2:WIDTH-1])),
							  .datab(q),
							  .cin(0),
							  .result(sum));

register reg_inst1(.dataa($signed(sum[WIDTH:1])),
						 .clk(clk),
						 .reset_n(reset_n),
						 .dataout(q));

endmodule