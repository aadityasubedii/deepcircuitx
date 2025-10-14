  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          E_shift_rot_result <= 0;
      else 
        E_shift_rot_result <= E_shift_rot_result_nxt;
    end