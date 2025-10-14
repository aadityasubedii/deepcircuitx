  generate
  genvar rnk_cnt;
    if (HIGHEST_BANK == 3) begin 
      for (rnk_cnt = 0; rnk_cnt < RANKS; rnk_cnt = rnk_cnt + 1) begin: rnk_loop
        assign rd_data_offset_ranks_0[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][5:0];
        assign rd_data_offset_ranks_1[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][11:6];
        assign rd_data_offset_ranks_2[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][17:12];
        assign rd_data_offset_ranks_mc_0[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][5:0];
        assign rd_data_offset_ranks_mc_1[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][11:6];
        assign rd_data_offset_ranks_mc_2[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][17:12];
      end
    end else if (HIGHEST_BANK == 2) begin 
      for (rnk_cnt = 0; rnk_cnt < RANKS; rnk_cnt = rnk_cnt + 1) begin: rnk_loop
        assign rd_data_offset_ranks_0[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][5:0];
        assign rd_data_offset_ranks_1[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][11:6];
        assign rd_data_offset_ranks_2[6*rnk_cnt+:6] = 'd0;
        assign rd_data_offset_ranks_mc_0[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][5:0];
        assign rd_data_offset_ranks_mc_1[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][11:6];
        assign rd_data_offset_ranks_mc_2[6*rnk_cnt+:6] = 'd0;
      end
    end else begin 
      for (rnk_cnt = 0; rnk_cnt < RANKS; rnk_cnt = rnk_cnt + 1) begin: rnk_loop
        assign rd_data_offset_ranks_0[6*rnk_cnt+:6] = final_data_offset[rnk_cnt][5:0];
        assign rd_data_offset_ranks_1[6*rnk_cnt+:6] = 'd0;
        assign rd_data_offset_ranks_2[6*rnk_cnt+:6] = 'd0;
        assign rd_data_offset_ranks_mc_0[6*rnk_cnt+:6] = final_data_offset_mc[rnk_cnt][5:0];
        assign rd_data_offset_ranks_mc_1[6*rnk_cnt+:6] = 'd0;
        assign rd_data_offset_ranks_mc_2[6*rnk_cnt+:6] = 'd0;
      end
    end
  endgenerate