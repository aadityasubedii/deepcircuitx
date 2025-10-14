module SIPO (input Frame,
             input Dclk,
			 input clear,
			 input InputL,
			 input InputR,
			 output reg [15:0] data_L,
			 output reg [15:0] data_R,
			 output reg input_ready);

reg [3:0] bit_count;
reg frame_start;

always@(posedge Dclk or posedge clear)
begin
  if (clear ==1'b1)
   begin 
    data_L = 16'b0;
	data_R = 16'b0;
	input_ready =1'b0;
	frame_start=1'b0;
   end
  else
   begin 
     if(Frame ==1'b1)
	  begin 
	    bit_count = 4'd15;
		input_ready = 1'b0;
		data_L[bit_count]=InputL;
		data_R[bit_count]=InputR;
		frame_start=1'b1;
	  end
	 else if(frame_start==1'b1)
	  begin 
	    bit_count=bit_count-1;
		data_L[bit_count]=InputL;
		data_R[bit_count]=InputR;
		if(bit_count ==0)
		 begin
		 frame_start=0;
		 input_ready=1'b1;
		 end
	  end
     else
		begin
			bit_count = 4'd15;
			data_L = 16'd0;
			data_R = 16'd0;			
			input_ready = 1'b0;
			frame_start = 1'b0;
		end
	end
 end
endmodule
