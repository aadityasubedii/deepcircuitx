always@(posedge Sclk or clear)
 begin
  if (clear ==1'b1)
   begin 
    Output = 1'bx;
	output_ready =0;
   end
  else if (p2s_enable == 1'b1)
   begin
	temp = data_in;
	out_rdy = 1'b1;
	frame_start = 1'b0;
   end
  else if(out_rdy == 1'b1 && frame_start == 1'b0)
   begin 
	    bit_count = 4'd15;
		Output=temp[bit_count];
		frame_start=1'b1;
   end
  else if(frame_start==1'b1)
	begin 
	    out_rdy=1'b0;
	    bit_count=bit_count-1;
		Output=temp[bit_count];
		if(bit_count ==0)
		  begin
		    frame_start=0;
		    output_ready=1'b1;
		  end
	end
  else
	begin
		bit_count = 6'd40;
		Output = 1'b0;
		output_ready=1'b0;
	end
 end