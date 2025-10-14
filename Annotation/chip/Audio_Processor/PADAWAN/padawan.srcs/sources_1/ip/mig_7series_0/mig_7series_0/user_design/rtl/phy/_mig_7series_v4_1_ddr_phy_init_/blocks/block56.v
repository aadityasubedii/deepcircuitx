      always @(posedge clk) begin
        if (!phy_wrdata_en & first_rdlvl_pat_r)
          wrdata_pat_cnt <= #TCQ 2'b00;
        else if (wrdata_pat_cnt == 2'b11)
          wrdata_pat_cnt <= #TCQ 2'b10;
        else
          wrdata_pat_cnt <= #TCQ wrdata_pat_cnt + 1;
      end