  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_shift_rot_cnt <= 0;
      else 
        E_shift_rot_cnt <= E_shift_rot_cnt_nxt;
    end