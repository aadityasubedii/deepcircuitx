   always @ (posedge clk) begin
     if (rst)
       fine_inc_stage <= #TCQ 'b1;
     else
       fine_inc_stage <= #TCQ (stage_cnt!='d3);
   end