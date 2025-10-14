   always @(posedge clk) begin
     if(rst) begin
       wrlvl_tap_done_r <= #TCQ 1'b0 ;
     end else begin
       if(wrlvl_tap_done_r == 1'b0) begin
         if(oclkdelay_calib_done) begin
	   wrlvl_tap_done_r <= #TCQ 1'b1 ;
	 end
       end
     end
   end