  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[1] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe)
              edge_capture[1] <= 0;
          else if (edge_detect[1])
              edge_capture[1] <= -1;
    end