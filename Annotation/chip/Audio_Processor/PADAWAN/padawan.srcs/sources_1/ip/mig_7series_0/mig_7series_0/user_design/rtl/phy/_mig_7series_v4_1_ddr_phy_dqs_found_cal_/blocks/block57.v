  generate
  if (HIGHEST_BANK == 3) begin 
    assign rd_data_offset_0 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][0+:6] :
                               final_data_offset[rnk_cnt_r][0+:6];
    assign rd_data_offset_1 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][6+:6] :
                               final_data_offset[rnk_cnt_r][6+:6];
    assign rd_data_offset_2 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][12+:6] :
                               final_data_offset[rnk_cnt_r][12+:6];
  end else if (HIGHEST_BANK == 2) begin 
    assign rd_data_offset_0 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][0+:6] :
                               final_data_offset[rnk_cnt_r][0+:6];
    assign rd_data_offset_1 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][6+:6] :
                               final_data_offset[rnk_cnt_r][6+:6];
    assign rd_data_offset_2 = 'd0;
  end else begin
    assign rd_data_offset_0 = (~init_dqsfound_done_r2) ? rd_byte_data_offset[rnk_cnt_r][0+:6] :
                               final_data_offset[rnk_cnt_r][0+:6];
    assign rd_data_offset_1 = 'd0;
    assign rd_data_offset_2 = 'd0;
  end
  endgenerate