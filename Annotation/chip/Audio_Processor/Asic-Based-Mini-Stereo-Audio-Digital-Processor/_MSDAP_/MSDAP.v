`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The University of Texas at Dallas
// Engineer: RXN220024
// 
// Create Date: 04/15/2023 06:04:14 PM
// Design Name: Mini Stereo - Digital Audio Processor
// Module Name: MSDAP
// Project Name: EEDG 6306 ASIC - MSDAP
// Target Devices: -
// Tool Versions: -
// Description: A top-level module is one which instantiates all other modules. 

// 
// Dependencies: NONE
// 
// Revision:NONE
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////
`include serial_Input.sv
`include rj_Memory.sv
`include coefficient_Memory.sv
`include input_Memory.sv
`include ALU.sv
`include serial_Output.sv

module MSDAP(
    input reset,
    input frame,
    input dClk,
    input sClk,
    input start,
    input inputL,
    input inputR,
    output inReady,
    output outReady,
    output outputL,
    output outputR
    );
    
    

wire 	 	    m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13;

wire 		    n1L, n1R, n2L, n2R, n3L, n3R, n4L, n4R, n5L, n5R, n6L, n6R, n7L, n7R, n8L, n8R, n9L, n9R, n10L, n10R, n11L, n11R, n12L, n12R, 
		        n13L, n13R,  n14L, n14R, n15L, n15R, n16L, n16R, n17L, n17R, n18L, n18R, n19L, n19R, n20L, n20R, n21L, n21R, n22L, n22R;

wire    [15:0]	o1L , o1R, o2L, o2R, o3L, o3R, o4L, o4R;

wire    [3:0]	o5L, o5R, o6L, o6R;

wire    [8:0]	o7L, o7R, o8L, o8R;

wire    [7:0]	o9L, o9R, o10L, o10R, p_Slp;

wire    [39:0] 	o11L, o11R;


assign n2L  = (n13L | n14L);			// n2L is Rj Enable for Left Channel  
assign n2R  = (n13R | n14R);			// n2R is Rj Enable for Right Channel
assign n5L  = (n15L | n16L);			// n5L is Coeff Enable for Left Channel
assign n5R  = (n15R | n16R);			// n5R is Coeff Enable for Right Channel

assign n8L  = (n4L | n7L | n11L);		// n8L  is Memory write done for Left Channel
assign n8R  = (n4R | n7R | n11R);		// n8R  is Memory write done for Right Channel
assign n20L = (n17L | n18L | n19L);		// n20L is data_Valid in Left Channel for rj, coeff and input
assign n20R = (n17R | n18R | n19R);		// n20R is data_Valid in Right Channel for rj, coeff and input

assign m3   = (n1L & n1R);			    // m3  is word Ready when both Left and Right Channels have word ready as high
assign m7   = (n12L & n12R);			// m7  is sleep when both Left and Right Channels have 800 consecutive zero inputs
assign m12  = (n21L & n21R);			// m12 is previous output ready when Left and Right Channels have prev_OutReady 
assign m10  = (n22L & n22R);			// m10 is word_Sent done for both Left and RIght Channels


serial_Input	serial_Input_L (.frame_Edg(m2), .reset(reset), .cntrl_rst(m1), .dClk(dClk), .data_In(inputL), .w_Ready (n1L), .data_Out(o1L ), .ack(n8L) );

serial_Input	serial_Input_R (.frame_Edg(m2), .reset(reset), .cntrl_rst(m1), .dClk(dClk), .data_In(inputR), .w_Ready(n1R), .data_Out(o1R), .ack(n8R) );


rj_Memory  	rj_Mem_L  (.start(start), .en(n2L), .rd_Addr(o5L), .wr_Addr(o6L), .wr(n3L), .cntrl_rst(m4), .data_In(o1L ), .data_Out(o2L), .w_Done(n4L), .data_Valid(n19L) );

rj_Memory  	rj_Mem_R  (.start(start), .en(n2R), .rd_Addr(o5R), .wr_Addr(o6R), .wr(n3R), .cntrl_rst(m4), .data_In(o1R), .data_Out(o2R), .w_Done(n4R), .data_Valid(n19R) );


coeffecient_Memory  	coeffL_Mem  (.start(start), .en(n5L), .rd_Addr(o7L), .wr_Addr(o8L), .wr(n6L), .cntrl_rst(m11), .data_In(o1L ), .data_Out(o3L), .w_Done(n7L), .data_Valid(n18L) );

coeffecient_Memory  	coeffR_Mem  (.start(start), .en(n5R), .rd_Addr(o7R), .wr_Addr(o8R), .wr(n6R), .cntrl_rst(m11), .data_In(o1R), .data_Out(o3R), .w_Done(n7R), .data_Valid(n18R) );


input_Memory	inputL_mem  (.sClk(sClk), .start(start), .reset(reset), .cntrl_rst(m6), .rd_En(n10L), .wr_En(n9L), .rd_Addr(o10L), .wr_Addr(o9L), .data_In(o1L ), .data_Out(o4L), .sleep(n12L),
			     .w_Done(n11L), .data_Valid(n17L) );

input_Memory	inputR_mem  (.sClk(sClk), .start(start), .reset(reset), .cntrl_rst(m6), .rd_En(n10R), .wr_En(n9R), .rd_Addr(o10R), .wr_Addr(o9R), .data_In(o1R), .data_Out(o4R), .sleep(n12R),
			     .w_Done(n11R), .data_Valid(n17R) );


ALU		 ALU_L  (.sClk(sClk), .reset(reset), .en(m5), .start(start), .sleep(m7), .rj_En(n14L), .rr_Ptr(o5L), .r_Valid(n19L), .rj_Data_In(o2L), .h_En(n16L), .hr_Ptr(o7L),
			 .h_Valid(n18L),	.h_Data_In(o3L), .x_Rd_En(n10L), .xr_Ptr(o10L), .x_Data_In(o4L), .x_FlagBit(m8), .n(p_Slp), .valid(n20L), .prev_OutReady(n21L), .y(o11L) 
			);


ALU		ALU_R  (.sClk(sClk), .reset(reset), .en(m5), .start(start), .sleep(m7),.rj_En(n14R), .rr_Ptr(o5R), .r_Valid(n19R), .rj_Data_In(o2R),.h_En(n16R), .hr_Ptr(o7R),
			.h_Valid(n18R), .h_Data_In(o3R), .x_Rd_En(n10R), .xr_Ptr(o10R), .x_Data_In(o4R), .x_FlagBit(m8), .n(p_Slp), .valid(n20R), .prev_OutReady(n21R), .y(o11R) 
		       );


serial_Output		serial_Output_L (.en(m9), .sClk(sClk), .start(start), .data_In(o11L), .word_Sent(n22L), .data_Out(outputL) );

serial_Output		serial_Output_R (.en(m9), .sClk(sClk), .start(start), .data_In(o11R), .word_Sent(n22R), .data_Out(outputR) );


controller 	Control (.reset(reset), .frame(frame), .frame_Edg(m2), .start(start), .inReady(inReady), .outReady(outReady), .sClk(sClk), .w_Ready(m3), .rj_EnL(n13L),
			 .rj_EnR(n13R), .rj_Rst(m4), .rj_WrL(n3L), .rj_WrR(n3R), .rw_Ptr_L(o6L), .rw_Ptr_R(o6R), .h_EnL(n15L), .h_EnR(n15R), .h_Rst(m11), .h_WrL(n6L),
			 .h_WrR(n6R), .hw_Ptr_L(o8L), .hw_Ptr_R(o8R), .x_Rst(m6), .x_Wr_EnL(n9L), .x_Wr_EnR(n9R), .xw_Ptr_L(o9L), .xw_Ptr_R(o9R), .x_FlagBit(m8),
			 .ALU_En(m5), .n(p_Slp), .prev_OutReady(m12), .serial_Output_En(m9), .word_Sent(m10), .parallel_Input_Rst(m1), .sleep(m7), .done_L(n8L), .done_R(n8R) 
			);

    
endmodule


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The University of Texas at Dallas
// Engineer: RXN220024
// 
// Create Date: 04/15/2023 06:04:14 PM
// Design Name: Mini Stereo - Digital Audio Processor
// Module Name: MSDAP
// Project Name: EEDG 6306 ASIC - MSDAP
// Target Devices: -
// Tool Versions: -
// Description: A top-level module is one which instantiates all other modules. 

// 
// Dependencies: NONE
// 
// Revision:NONE
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module controller(
    input reset,
    input start,
    input sClk,
    input w_Ready,
    input word_Sent,
    input frame,
    input done_L,
    input done_R,
    input sleep,
    input prev_OutReady,
    output reg frame_Edg,
    output reg inReady,
    output reg outReady,
    output reg parallel_Input_Rst,
    output reg ALU_En,
    output reg serial_Output_En,
    output reg rj_EnL,
    output reg rj_EnR,
    output reg rj_Rst,
    output reg rj_WrL,
    output reg rj_WrR,
    output reg [3:0] rw_Ptr_L,
    output reg [3:0] rw_Ptr_R ,
    output reg h_EnL,
    output reg h_EnR,
    output reg h_Rst,
    output reg h_WrL,
    output reg h_WrR,
    output reg [8:0] hw_Ptr_L, 
    output reg [8:0] hw_Ptr_R,
    output reg x_Rst,
    output reg x_Wr_EnL,
    output reg x_Wr_EnR,
    output reg [7:0] xw_Ptr_L,
    output reg [7:0] xw_Ptr_R,
    output reg [7:0] n,
    output reg x_FlagBit
    );

reg [3:0]  rw_Ptr_Buff_L, rw_Ptr_Buff_R;

reg r_Clr_Stop_L, r_Clr_Stop_R;

reg [8:0] hw_Ptr_Buff_L, hw_Ptr_Buff_R;

reg [8:0] xw_Ptr_Buff_L, xw_Ptr_Buff_R;

reg x_Clr_Stop_L, x_Clr_Stop_R;

reg [3:0] state;

reg [3:0] next_State;

parameter state0 = 4'h0;

parameter state1 = 4'h1;

parameter state2 = 4'h2;

parameter state3 = 4'h3;

parameter state4 = 4'h4;

parameter state5 = 4'h5;

parameter state6 = 4'h6;

parameter state7 = 4'h7;

parameter state8 = 4'h8;


always @ (posedge start or posedge done_L or negedge reset )

begin

	if(reset == 1'b0)

	begin

		xw_Ptr_Buff_L = 9'h000;

		x_FlagBit = 1'b0;

	end

	

	else if(start== 1'b1)

	begin

		{r_Clr_Stop_L,rw_Ptr_Buff_L} = 5'h00;

		hw_Ptr_Buff_L = 9'h000;

		{x_Clr_Stop_L,xw_Ptr_Buff_L} = 9'h000;

		x_FlagBit = 1'b0;

	end

	else

	begin

		case (next_State)

		state0:

			begin

				if(r_Clr_Stop_L == 1'b0)

				begin

					{r_Clr_Stop_L,rw_Ptr_Buff_L} =  rw_Ptr_L + 1'b1;

				end		

				if(x_Clr_Stop_L == 1'b0)

				begin

					{x_Clr_Stop_L,xw_Ptr_Buff_L[7:0]} =  xw_Ptr_L + 1'b1;

				end

				

				hw_Ptr_Buff_L  =  hw_Ptr_L + 1'b1;

			end

			

		state1:

			begin

				rw_Ptr_Buff_L = 4'h0;

				xw_Ptr_Buff_L = 9'h000;

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state2:

			begin

				rw_Ptr_Buff_L = rw_Ptr_L + 1'b1;

			end

			

		state3:

			begin

				rw_Ptr_Buff_L = 4'h0;

			end

			

		state4:

			begin

				hw_Ptr_Buff_L = hw_Ptr_L + 1'b1;

			end

			

		state5:

			begin

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state6:

			begin

				if(sleep== 1'b1)

				begin

					xw_Ptr_Buff_L = 9'h0;

					x_FlagBit = 1'b0;

				end

				else

				begin

					xw_Ptr_Buff_L = xw_Ptr_L + 1'b1;

					if(xw_Ptr_Buff_L == 9'h100)

					begin

						x_FlagBit = 1'b1;

					end

				end

			end

			

		state7:

			begin

				rw_Ptr_Buff_L = 4'h0;

				xw_Ptr_Buff_L = 9'h000;

				hw_Ptr_Buff_L = 9'h000;

			end

			

		state8:

			begin

				if(sleep == 1'b1)

				begin

					xw_Ptr_Buff_L = 9'h0;

				end

				else

				begin

					xw_Ptr_Buff_L = 9'h001;

				end

			end

			

		default:

		begin

			rw_Ptr_Buff_L = 4'h0;

			xw_Ptr_Buff_L = 9'h000;

			hw_Ptr_Buff_L = 9'h000;

			 r_Clr_Stop_L = 1'b0;

			 x_Clr_Stop_L = 1'b0;

		end

		endcase

	end

end


always @ (state or frame or w_Ready or reset or start or prev_OutReady or word_Sent or sleep)

begin

	if(reset == 1'b0)

	begin

		next_State <= state7;

		frame_Edg <= 1'b0;

		outReady = 1'b0;

		ALU_En = 1'b0;

		serial_Output_En = 1'b0;

	end

	else if (start== 1'b1)

	begin

		ALU_En = 1'b0;

		serial_Output_En = 1'b0;

		outReady = 1'b0;

	end

	else

	begin

		case ( state )

			state0:

			begin

				if (r_Clr_Stop_L && r_Clr_Stop_R)

				begin

					next_State <= state1;

				end

				else

				begin

					next_State <= state0;

				end

			end

				

			state1:

			begin

				if (frame)

				begin

					next_State <= state2;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state1;

				end

			end

			

			state2:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

				end

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else

				begin

					next_State <= state2;

				end

			end

			

			state3:

			begin

				if (frame)

				begin

					next_State <= state4;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state3;

				end

			end

			

			state4:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

				end

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else

				begin

					next_State <= state4;

				end


			end

			

			state5:

			begin

				if (frame)

				begin

					next_State <= state6;

					frame_Edg  <= 1'b1;

				end

				else

				begin

					next_State <= state5;

				end

			end

			

			state6:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

					if (prev_OutReady)

					begin

						serial_Output_En = 1'b1;

						outReady = 1'b1;

					end

					if( (|{x_FlagBit,xw_Ptr_Buff_L}) )

					begin

						ALU_En = 1'b1;

					end

				end

				

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				else if (prev_OutReady)

				begin

					ALU_En = 1'b0;

				end

				

				else if (word_Sent)

				begin

					serial_Output_En = 1'b0;

					outReady = 1'b0;

				end

				else

				begin

					next_State <= state6;

				end

				

			end

			

			state7:

			begin

				if(reset)

				begin

					next_State <= state5;

				end

			end

			

			state8:

			begin

				if (frame)

				begin

					frame_Edg  <= 1'b1;

					if (prev_OutReady)

					begin

						serial_Output_En = 1'b1;

						outReady = 1'b1;

					end

					ALU_En = 1'b1;

				end

				

				else if (!sleep)

				begin

					ALU_En = 1'b0;

				end

				

				else if (w_Ready)

				begin

					frame_Edg  <= 1'b0;

				end

				

				else if (word_Sent)

				begin

					serial_Output_En = 1'b0;

					outReady = 1'b0;

				end

				

				else

				begin

					next_State <= state8;

				end

			end

			

			default:

			begin

				frame_Edg <= 1'b0;

				outReady = 1'b0;

				ALU_En = 1'b0;

				serial_Output_En = 1'b0;

			end

		endcase

	end

end


always @ (posedge sClk or negedge reset or posedge start or posedge done_L )

begin

	if(reset == 1'b0)

	begin

		state <= state7;

		inReady = 1'b0;

		n = 8'h00;

	end

	else if(start== 1'b1)

	begin

		rj_EnL = 1'b0;

		h_EnL = 1'b0;

		x_Wr_EnL = 1'b0;

		rj_Rst = 1'b1;

		h_Rst = 1'b1;

		x_Rst = 1'b1;

		rw_Ptr_L = 4'h0;

		hw_Ptr_L = 9'h000;

		xw_Ptr_L = 8'h00;

		parallel_Input_Rst = 1'b1;

		n = 8'h00; 

		state <= state0;

	end

	

	else if (done_L== 1'b1)

	begin

		rj_EnL = 1'b0;

		 h_EnL = 1'b0;

		 x_Wr_EnL = 1'b0;

	end



	else

	begin

		state <= next_State;

		case (next_State)

			state0:

			begin   

				parallel_Input_Rst = 1'b0;

				if(r_Clr_Stop_L == 1'b0)

				begin

					rw_Ptr_L = rw_Ptr_Buff_L;

					rj_EnL = 1'b1;

				end

				if(x_Clr_Stop_L == 1'b0)

				begin

					xw_Ptr_L = xw_Ptr_Buff_L[7:0];

					x_Wr_EnL = 1'b1;

				end

				hw_Ptr_L = hw_Ptr_Buff_L;

				h_EnL = 1'b1;			

				if(hw_Ptr_L == 9'h1FF)

				begin

					state <= state1;

				end

			end

			

			state1:

			begin	

				rw_Ptr_L      = 4'h0;

				inReady     = 1'b1;

				rj_Rst      = 1'b0;

			end

			

			state2:

			begin

				if(w_Ready)

				begin

					rw_Ptr_L = rw_Ptr_Buff_L;

					if(rw_Ptr_L == 4'hF)

					begin

						state <= state3;

					end

					rj_WrL = 1'b1;

					rj_EnL = 1'b1;

				end

			end

			

			state3:

			begin	

				rj_WrL 		= 1'b0;

				hw_Ptr_L    = 9'h000;

				inReady     = 1'b1;

				 h_Rst      = 1'b0;

			end

			

			state4:

			begin

				if(w_Ready)

				begin

					hw_Ptr_L = hw_Ptr_Buff_L;

					if(hw_Ptr_L == 9'h1FF)

					begin

						state <= state5;

					end

					h_WrL = 1'b1;

					h_EnL = 1'b1;

				end

			end

			

			state5:

			begin

				h_WrL 		= 1'b0;

				xw_Ptr_L	= 8'h00;

				inReady		= 1'b1;

				x_Rst		= 1'b0;

			end

			

			state6:

			begin

				if(w_Ready)

				begin

					 xw_Ptr_L = xw_Ptr_Buff_L[7:0];

						  n = xw_Ptr_L;

					x_Wr_EnL = 1'b1;

				end

				

				if(sleep)

				begin

					state <= state8;

				end

			end

			

			state7:

			begin

				inReady = 1'b0;

					 n = 8'h00;

			end

			

			state8:

			begin

				if(w_Ready)

				begin

					xw_Ptr_L = 8'h0;

					x_Wr_EnL = 1'b1;

					n = xw_Ptr_L; 

				end

				if(sleep == 1'b0)

				begin

					state <= state6;

				end

			end

			

			default:

			begin

				if (start == 1'b1)

				begin

					rw_Ptr_L = 4'h0;

					hw_Ptr_L = 9'h000;

					xw_Ptr_L = 8'h00;

					state <= state0;

				end

			end

		endcase

	end

end


always @ (posedge start or posedge done_R or negedge reset )
begin

	if(reset == 1'b0)

	begin

		xw_Ptr_Buff_R = 9'h000;

	end

	

	else if(start)

	begin

		{r_Clr_Stop_R,rw_Ptr_Buff_R} = 5'h0;

		hw_Ptr_Buff_R = 9'h000;

		{x_Clr_Stop_R,xw_Ptr_Buff_R} = 9'h000;

	end

	else

	begin

		case (next_State)

		state0:

			begin

				if(r_Clr_Stop_R == 1'b0)

				begin

					{r_Clr_Stop_R,rw_Ptr_Buff_R} =  rw_Ptr_R + 1'b1;

				end		

				if(x_Clr_Stop_R == 1'b0)

				begin

					{x_Clr_Stop_R,xw_Ptr_Buff_R[7:0]} =  xw_Ptr_R + 1'b1;

				end

				

				hw_Ptr_Buff_R  =  hw_Ptr_R + 1'b1;

			end

			

		state1:

			begin

				rw_Ptr_Buff_R = 4'h0;

				xw_Ptr_Buff_R = 9'h000;

				hw_Ptr_Buff_R = 9'h000;

			end

			

		state2:

			begin

				rw_Ptr_Buff_R = rw_Ptr_R + 1'b1;

			end

			

		state3:

			begin

				rw_Ptr_Buff_R = 4'h0;

			end

			

		state4:

			begin

				hw_Ptr_Buff_R = hw_Ptr_R + 1'b1;

			end

			

		state5:

			begin

				hw_Ptr_Buff_R = 9'h000;

			end

			

		state6:

			begin

				if(sleep== 1'b1)

				begin

					xw_Ptr_Buff_R = 9'h000;

				end

				else

				begin

					xw_Ptr_Buff_R = xw_Ptr_R + 1'b1;

				end

			end

			

		state7:

			begin

				rw_Ptr_Buff_R = 4'h0;

				xw_Ptr_Buff_R = 9'h000;

				hw_Ptr_Buff_R = 9'h000;

			end

			

		state8:

			begin

				if(sleep == 1'b1)

				begin

					xw_Ptr_Buff_R = 9'h000;

				end

				else

				begin

					xw_Ptr_Buff_R = 9'h001;

				end

			end

			

		default:

		begin

			rw_Ptr_Buff_R = 4'h0;

			xw_Ptr_Buff_R = 9'h000;

			hw_Ptr_Buff_R = 9'h000;

			r_Clr_Stop_R = 1'b0;

			x_Clr_Stop_R = 1'b0;

		end

		endcase

	end

end

always @ (posedge sClk or posedge start or posedge done_R )

begin

	if(start)

	begin

		 rj_EnR = 1'b0;

		  h_EnR = 1'b0;

	   x_Wr_EnR = 1'b0;

		rw_Ptr_R = 4'h0;

		hw_Ptr_R = 9'h000;

		xw_Ptr_R = 8'h00;

	end

	
	else if (done_R)

	begin

		rj_EnR = 1'b0;

		 h_EnR = 1'b0;

		 x_Wr_EnR = 1'b0;

	end



	else

	begin

		case (next_State)

			state0:

			begin   

				if(r_Clr_Stop_R == 1'b0)

				begin

					rw_Ptr_R = rw_Ptr_Buff_R;

					rj_EnR = 1'b1;

				end

				if(x_Clr_Stop_R == 1'b0)

				begin

					xw_Ptr_R = xw_Ptr_Buff_R[7:0];

					x_Wr_EnR = 1'b1;

				end

				hw_Ptr_R = hw_Ptr_Buff_R;

				h_EnR = 1'b1;	

			end

			

			state1:

			begin	

				rw_Ptr_R      = 4'h0;

			end

			

			state2:

			begin

				if(w_Ready)

				begin

					rw_Ptr_R = rw_Ptr_Buff_R;

					

					rj_WrR = 1'b1;

					rj_EnR = 1'b1;

				end

			end

			

			state3:

			begin	
				rj_WrR 		= 1'b0;

				hw_Ptr_R      = 9'h000;

			end

			

			state4:

			begin

				if(w_Ready)

				begin

					hw_Ptr_R = hw_Ptr_Buff_R;

					h_WrR = 1'b1;

					h_EnR = 1'b1;

				end

			end

			

			state5:

			begin

				h_WrR 		= 1'b0;

				xw_Ptr_R		= 8'h00;

			end

			

			state6:

			begin

				if(w_Ready)

				begin

					 xw_Ptr_R = xw_Ptr_Buff_L[7:0];

					x_Wr_EnR = 1'b1;

				end

			end

			

			state7:

			begin

				rw_Ptr_R = 4'h0;

				hw_Ptr_R = 9'h000;

				xw_Ptr_R = 8'h00;

			end

			

			state8:

			begin

				if(w_Ready)

				begin

					xw_Ptr_R = 8'h00;

					x_Wr_EnR = 1'b1;

				end

			end

			

			default:

			begin

				if (start == 1'b1)

				begin

					rw_Ptr_R = 4'h0;

					hw_Ptr_R = 9'h000;

					xw_Ptr_R = 8'h00;

				end

			end

		endcase

	end

end
  
endmodule
