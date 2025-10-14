  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          trc_clear <= 0;
      else 
        trc_clear <= ~trc_enb & 
                take_action_tracectrl & jdo[4];

    end