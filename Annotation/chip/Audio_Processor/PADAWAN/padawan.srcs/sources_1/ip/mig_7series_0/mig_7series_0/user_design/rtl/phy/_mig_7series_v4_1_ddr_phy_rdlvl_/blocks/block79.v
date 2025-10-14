  always @(posedge clk)
    
    if (rst | (SIM_CAL_OPTION == "SKIP_CAL")) begin
      for (aa = 0; aa < RANKS; aa = aa + 1) begin: rst_dlyval_dq_reg_r
        for (bb = 0; bb < DQ_WIDTH; bb = bb + 1)
          dlyval_dq_reg_r[aa][bb] <= #TCQ 'b0;
      end
    end else if (SIM_CAL_OPTION == "FAST_CAL") begin
      for (n = 0; n < RANKS; n = n + 1) begin: gen_dlyval_dq_reg_rnk
        for (r = 0; r < DQ_WIDTH; r = r + 1) begin: gen_dlyval_dq_reg
          if (dlyce_dq_r[r]) begin
            if (dlyinc_dq_r)
              dlyval_dq_reg_r[n][r] <= #TCQ dlyval_dq_reg_r[n][r] + 5'h01;
            else
              dlyval_dq_reg_r[n][r] <= #TCQ dlyval_dq_reg_r[n][r] - 5'h01;
          end
        end
      end
    end else begin
      if (dlyce_dq_r[cal1_cnt_cpt_r]) begin
        if (dlyinc_dq_r)
          dlyval_dq_reg_r[rnk_cnt_r][cal1_cnt_cpt_r] <= #TCQ
            dlyval_dq_reg_r[rnk_cnt_r][cal1_cnt_cpt_r] + 5'h01;
        else
          dlyval_dq_reg_r[rnk_cnt_r][cal1_cnt_cpt_r] <= #TCQ
            dlyval_dq_reg_r[rnk_cnt_r][cal1_cnt_cpt_r] - 5'h01;
      end
    end