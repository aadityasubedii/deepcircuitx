   always @(posedge clk) begin
     po_stg2_wrcal_cnt  <= #TCQ wrcal_dqs_cnt_r;
     wrlvl_byte_done_r  <= #TCQ wrlvl_byte_done;
     wrcal_sanity_chk_r <= #TCQ wrcal_sanity_chk;
   end