      always @(posedge clk) begin
        if (!phy_wrdata_en & first_wrcal_pat_r)
          wrcal_pat_cnt <= #TCQ 2'b00;
        else if (extend_cal_pat && (wrcal_pat_cnt == 2'b01))
          wrcal_pat_cnt <= #TCQ 2'b00;
        else if (wrcal_pat_cnt == 2'b11)
          wrcal_pat_cnt <= #TCQ 2'b10;
        else
          wrcal_pat_cnt <= #TCQ wrcal_pat_cnt + 1;
      end