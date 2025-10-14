  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          edge_capture[3] <= 0;
      else if (clk_en)
          if (edge_capture_wr_strobe)
              edge_capture[3] <= 0;
          else if (edge_detect[3])
              edge_capture[3] <= -1;
    end