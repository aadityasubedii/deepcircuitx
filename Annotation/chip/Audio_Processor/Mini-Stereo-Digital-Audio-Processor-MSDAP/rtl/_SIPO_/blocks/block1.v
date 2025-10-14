always @(negedge Dclk or posedge Clear)
   begin
     if (Clear == 1'b1)
       begin
	 count_bit = 4'd15;
	 dataL = 16'd0;
	 dataR = 16'd0;			
	 in_flag = 1'b0;
	 frame_stat = 1'b0;
       end
     else 
       begin
	 if (Frame == 1'b1)
	   begin
	     count_bit = 4'd15;
	     in_flag = 1'b0;
	     dataL [count_bit] = InputL;
	     dataR [count_bit] = InputR;
	     frame_stat = 1'b1;
	   end
         else if (frame_stat == 1'b1)
	   begin
	     count_bit = count_bit - 1'b1;
	     dataL [count_bit] = InputL;
	     dataR [count_bit] = InputR;
	   if (count_bit == 4'd0)
	     begin					
		in_flag = 1'b1;
		frame_stat = 1'b0;
	     end
	   else
	     begin
		in_flag = 1'b0;
		frame_stat = 1'b1;
	     end
	end
	  else
	  begin
	    count_bit = 4'd15;
	    dataL = 16'd0;
	    dataR = 16'd0;			
	    in_flag = 1'b0;
	    frame_stat = 1'b0;
	  end
	 end
      end
endmodule