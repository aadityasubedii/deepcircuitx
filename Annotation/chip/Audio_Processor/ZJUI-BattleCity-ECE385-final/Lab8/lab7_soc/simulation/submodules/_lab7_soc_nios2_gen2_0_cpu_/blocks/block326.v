  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else 
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
    end