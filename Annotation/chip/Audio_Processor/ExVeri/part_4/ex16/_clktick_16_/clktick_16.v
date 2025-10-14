// Design Name : clktick_16
// File Name : clktick.v
// Function : divide an input clock signal by n+1
//-----------------------------------------------------

module clktick_16 (
  clkin, 	// Clock input to the design
  enable,	// enable clk divider
  N,			// Clock division factor is N+1
  tick		// pulse_out goes high for one cycle (n+1) clock cycles
); 			// 	End of port list

parameter	N_BIT = 16;
//-------------Input Ports-----------------------------
input clkin;
input enable;
input [N_BIT-1:0] N;

//-------------Output Ports----------------------------
output 	tick;

//-------------Output Ports Data Type------------------
// Output port can be a storage element (reg) or a wire
reg [N_BIT-1:0] count;
reg			tick;

initial		tick = 1'b0;

//------------ Main Body of the module ------------------------

	always @ (posedge clkin)  
		if (enable == 1'b1)
			if (count == 0)	begin
				tick <= 1'b1;
				count <= N;
				end
			else	begin
				tick <= 1'b0;
				count <= count - 1'b1;
				end
		
endmodule // End of Module clktick