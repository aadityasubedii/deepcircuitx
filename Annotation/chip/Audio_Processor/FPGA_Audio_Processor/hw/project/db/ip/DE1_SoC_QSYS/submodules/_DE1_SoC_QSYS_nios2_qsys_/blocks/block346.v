  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          trc_ctrl_reg[0] <= 1'b0;
          trc_ctrl_reg[1] <= 1'b0;
          trc_ctrl_reg[3 : 2] <= 2'b00;
          trc_ctrl_reg[4] <= 1'b0;
          trc_ctrl_reg[7 : 5] <= 3'b000;
          trc_ctrl_reg[8] <= 0;
          trc_ctrl_reg[9] <= 1'b0;
          trc_ctrl_reg[10] <= 1'b0;
        end
      else if (take_action_tracectrl)
        begin
          trc_ctrl_reg[0] <= jdo[5];
          trc_ctrl_reg[1] <= jdo[6];
          trc_ctrl_reg[3 : 2] <= jdo[8 : 7];
          trc_ctrl_reg[4] <= jdo[9];
          trc_ctrl_reg[9] <= jdo[14];
          trc_ctrl_reg[10] <= jdo[2];
          if (0)
              trc_ctrl_reg[7 : 5] <= jdo[12 : 10];
          if (0 & 0)
              trc_ctrl_reg[8] <= jdo[13];
        end
      else if (xbrk_wrap_traceoff)
        begin
          trc_ctrl_reg[1] <= 0;
          trc_ctrl_reg[0] <= 0;
        end
      else if (dbrk_traceoff | xbrk_traceoff)
          trc_ctrl_reg[1] <= 0;
      else if (trc_ctrl_reg[0] & 
                                  (dbrk_traceon | xbrk_traceon))
          trc_ctrl_reg[1] <= 1;
    end