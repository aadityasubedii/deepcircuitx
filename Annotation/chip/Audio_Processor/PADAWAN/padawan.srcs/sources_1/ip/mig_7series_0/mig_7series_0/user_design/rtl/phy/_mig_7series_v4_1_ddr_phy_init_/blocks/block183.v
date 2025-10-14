    always @(posedge clk) begin
      wrlvl_active_r1      <= #TCQ wrlvl_active;
      wr_level_dqs_asrt_r1 <= #TCQ wr_level_dqs_asrt;
      wrlvl_done_r         <= #TCQ wrlvl_done;
      wrlvl_done_r1        <= #TCQ wrlvl_done_r;
      wrlvl_rank_done_r1   <= #TCQ wrlvl_rank_done;
      wrlvl_rank_done_r2   <= #TCQ wrlvl_rank_done_r1;
      wrlvl_rank_done_r3   <= #TCQ wrlvl_rank_done_r2;
      wrlvl_rank_done_r4   <= #TCQ wrlvl_rank_done_r3;
      wrlvl_rank_done_r5   <= #TCQ wrlvl_rank_done_r4;
      wrlvl_rank_done_r6   <= #TCQ wrlvl_rank_done_r5;
      wrlvl_rank_done_r7   <= #TCQ wrlvl_rank_done_r6;
    end