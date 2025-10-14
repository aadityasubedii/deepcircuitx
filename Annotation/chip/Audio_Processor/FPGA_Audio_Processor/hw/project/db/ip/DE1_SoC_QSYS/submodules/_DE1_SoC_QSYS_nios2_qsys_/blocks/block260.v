  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (!0)
        begin
          trc_im_addr <= 0;
          trc_wrap <= 0;
        end
      else if (take_action_tracectrl && 
                      (jdo[4] | jdo[3]))
        begin
          if (jdo[4])
              trc_im_addr <= 0;
          if (jdo[3])
              trc_wrap <= 0;
        end
      else if (trc_enb & trc_on_chip & tw_valid)
        begin
          trc_im_addr <= trc_im_addr+1;
          if (&trc_im_addr)
              trc_wrap <= 1;
        end
    end