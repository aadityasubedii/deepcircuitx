  always @(posedge clk)
    if (rst || ((init_state_r == INIT_RDLVL_STG1_WRITE_READ) && 
             ~rdlvl_stg1_done))
      stg1_wr_rd_cnt <= #TCQ NUM_STG1_WR_RD;
    else if (rdlvl_last_byte_done || (stg1_wr_rd_cnt == 9'd1) ||
             (prbs_rdlvl_prech_req && (init_state_r == INIT_RDLVL_ACT_WAIT)) ||
             (init_state_r == INIT_OCAL_COMPLEX_ACT_WAIT) ) begin
      if (~complex_row0_wr_done || wr_victim_inc ||
         (complex_row1_wr_done && (~complex_row0_rd_done || (complex_row0_rd_done && complex_row1_rd_done))))     
        stg1_wr_rd_cnt <= #TCQ 'd127;
      else
        stg1_wr_rd_cnt <= #TCQ prbs_rdlvl_done?'d30 :'d22;
    end else if (((init_state_r == INIT_RDLVL_STG1_WRITE) && new_burst_r && ~phy_data_full)
              ||((init_state_r == INIT_RDLVL_COMPLEX_READ) && rdlvl_stg1_done))
      stg1_wr_rd_cnt <= #TCQ stg1_wr_rd_cnt - 1;