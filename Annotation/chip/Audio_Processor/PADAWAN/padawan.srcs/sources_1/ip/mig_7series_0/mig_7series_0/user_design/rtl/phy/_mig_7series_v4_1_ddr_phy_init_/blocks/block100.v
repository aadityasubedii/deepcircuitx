  always @(posedge clk)
    if (rst) begin
      victim_sel      <= #TCQ 'd0;
      victim_byte_cnt <= #TCQ 'd0;
    end else if ((~stg1_wr_done && ~prbs_rdlvl_done) || (prbs_rdlvl_done && ~complex_wr_done)) begin
      victim_sel      <= #TCQ prbs_rdlvl_done? wr_victim_sel_ocal: wr_victim_sel;
      victim_byte_cnt <= #TCQ 'd0; 
    end else begin
      if( (init_state_r == INIT_RDLVL_COMPLEX_ACT) || reset_rd_addr)
        victim_sel      <= #TCQ prbs_rdlvl_done? complex_ocal_rd_victim_sel:rd_victim_sel;  
        victim_byte_cnt <= #TCQ 'd0; 
    end