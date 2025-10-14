////////////////////////////////////////////////
///load data values into audio 
/// I2C registers load for audio 
////////////////////////////////////////////////



module i2c_av_cfg (
			clk, // 50k clock
			reset, // switch 0 on DE1-SoC board
			mend,  // end of load
			mstep,
			SCLK,
			mack,  // acknowledge reference bit
			mgo,   // go transfer for each value
			i2c_data // 23 bit register (8 command, 8 address, 8 data)
			
			);
			
input		clk;
input		reset;
input		SCLK;

input 	mend;
input 	mack;

output[3:0] mstep;
output	mgo;
output[23:0] i2c_data;

// internal register

reg		mgo;
reg[23:0] i2c_data;
reg[15:0] LUT_data;
reg[5:0]  LUT_index;
reg[3:0]  mstep;


// LUT data size value for both audio and video register

parameter 	LUT_size		= 10; // number of values loaded both audio and serial

//Audio register values  ( 9 in total)

parameter	set_lin_l	= 0;
parameter 	set_lin_r	= 1;
parameter 	set_head_l	= 2;
parameter	set_head_r	= 3;
parameter	a_path_cntrl = 4;
parameter 	d_path_cntrl = 5;
parameter	power_on		= 6;
parameter	set_format	= 7;
parameter	sample_cntrl = 8;
parameter 	set_active	= 9;


// config controllers [Audio]

always @ (posedge clk or negedge reset)

begin

	if (!reset)
	
		begin
		
		LUT_index	<= 0;
		mstep			<= 0;
		mgo			<= 0;
		
		end
		else
		
		begin
		
		if (LUT_index < LUT_size)
		begin
		
		case(mstep)
			0: begin
					if (SCLK)
					
					i2c_data <= {8'h34,LUT_data};

					mgo <= 1;
					mstep <= 1;
				end
				
			1: begin
			
					if (mend)
					begin
					
						if (mack)
						mstep <= 2;
						else
						mstep <= 0;
						mgo <= 0;
						end
					end
					
			2: begin
			
					LUT_index <= LUT_index + 1;
					mstep <= 0;
					
					end
					
				endcase
			end
		end
	end

	
always 

begin

case ( LUT_index)				

// audio config values

set_lin_l		: LUT_data <= 16'h001a;
set_lin_r		: LUT_data <= 16'h021a;
set_head_l		: LUT_data <= 16'h047b;
set_head_r		: LUT_data <= 16'h067b;
a_path_cntrl	: LUT_data <= 16'h08fc;
d_path_cntrl	: LUT_data <= 16'h0a06;
power_on			: LUT_data <= 16'h0c00;
set_format		: LUT_data <= 16'h0e4a;
sample_cntrl 	: LUT_data <= 16'h1000;
set_active		: LUT_data <= 16'h1201;


endcase

end

endmodule