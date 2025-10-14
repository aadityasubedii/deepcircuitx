  generate
    if(EVEN_CWL_2T_MODE == "ON") begin : gen_mc_data_offset_even_cwl_2t
      assign mc_data_offset =   ~sent_col ?
                                  6'b0 :
                                col_rd_wr_r ?
                                    rank_rddata_offset_0 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
      assign mc_data_offset_1 = ~sent_col ?
                                  6'b0 :
                                col_rd_wr_r ?
                                    rank_rddata_offset_1 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
      assign mc_data_offset_2 = ~sent_col ?
                                  6'b0 :
                                col_rd_wr_r ?
                                    rank_rddata_offset_2 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
    end
    else begin : gen_mc_data_offset_not_even_cwl_2t
      assign mc_data_offset   = ~sent_col ?
                                  6'b0 :
                                col_rd_wr_ns ?
                                    rank_rddata_offset_0 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
      assign mc_data_offset_1 = ~sent_col ?
                                  6'b0 :
                                col_rd_wr_ns ?
                                    rank_rddata_offset_1 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
      assign mc_data_offset_2 = ~sent_col ?
                                  6'b0 :
                                col_rd_wr_ns ?
                                    rank_rddata_offset_2 + col_channel_offset :
                                nCK_PER_CLK == 2 ? 
                                  CWL - 2 + col_channel_offset :
                            
                                  CWL + 2 + col_channel_offset;
    end
  endgenerate