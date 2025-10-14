  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          xbrk_ctrl0 <= 0;
          xbrk_ctrl1 <= 0;
          xbrk_ctrl2 <= 0;
          xbrk_ctrl3 <= 0;
          trigbrktype <= 0;
        end
      else 
        begin
          if (take_action_any_break)
              trigbrktype <= 0;
          else if (dbrk_break)
              trigbrktype <= 1;
          if (take_action_break_b)
            begin
              if ((break_b_rr == 2'b00) && (0 >= 1))
                begin
                  xbrk_ctrl0[0] <= jdo[27];
                  xbrk_ctrl0[1] <= jdo[28];
                  xbrk_ctrl0[2] <= jdo[29];
                  xbrk_ctrl0[3] <= jdo[30];
                  xbrk_ctrl0[4] <= jdo[21];
                  xbrk_ctrl0[5] <= jdo[20];
                  xbrk_ctrl0[6] <= jdo[19];
                  xbrk_ctrl0[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b01) && (0 >= 2))
                begin
                  xbrk_ctrl1[0] <= jdo[27];
                  xbrk_ctrl1[1] <= jdo[28];
                  xbrk_ctrl1[2] <= jdo[29];
                  xbrk_ctrl1[3] <= jdo[30];
                  xbrk_ctrl1[4] <= jdo[21];
                  xbrk_ctrl1[5] <= jdo[20];
                  xbrk_ctrl1[6] <= jdo[19];
                  xbrk_ctrl1[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b10) && (0 >= 3))
                begin
                  xbrk_ctrl2[0] <= jdo[27];
                  xbrk_ctrl2[1] <= jdo[28];
                  xbrk_ctrl2[2] <= jdo[29];
                  xbrk_ctrl2[3] <= jdo[30];
                  xbrk_ctrl2[4] <= jdo[21];
                  xbrk_ctrl2[5] <= jdo[20];
                  xbrk_ctrl2[6] <= jdo[19];
                  xbrk_ctrl2[7] <= jdo[18];
                end
              if ((break_b_rr == 2'b11) && (0 >= 4))
                begin
                  xbrk_ctrl3[0] <= jdo[27];
                  xbrk_ctrl3[1] <= jdo[28];
                  xbrk_ctrl3[2] <= jdo[29];
                  xbrk_ctrl3[3] <= jdo[30];
                  xbrk_ctrl3[4] <= jdo[21];
                  xbrk_ctrl3[5] <= jdo[20];
                  xbrk_ctrl3[6] <= jdo[19];
                  xbrk_ctrl3[7] <= jdo[18];
                end
            end
        end
    end