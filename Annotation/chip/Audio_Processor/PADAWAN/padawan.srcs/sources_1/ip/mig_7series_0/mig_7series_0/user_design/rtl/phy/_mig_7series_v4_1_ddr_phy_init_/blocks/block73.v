   always @(posedge clk) begin
     complex_sample_cnt_inc_r1 <= #TCQ complex_sample_cnt_inc;
     complex_sample_cnt_inc_r2 <= #TCQ complex_sample_cnt_inc_r1;
   end