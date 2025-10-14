  always @(posedge clk)
    if (rst) begin
      complex_num_reads <= #TCQ 'd1;
    end else if ((((init_state_r == INIT_RDLVL_COMPLEX_READ_WAIT) && (complex_wait_cnt == 'd14)) || 
	              ((init_state_r == INIT_RDLVL_STG1_WRITE_READ) && ext_int_ref_req && (cnt_cmd_r == 'd127))) && 
				  ~complex_row0_rd_done) begin
      if (stg1_wr_rd_cnt > 'd85) begin
        if (complex_num_reads < 'd6)
          complex_num_reads <= #TCQ complex_num_reads + 1;
        else
          complex_num_reads <= #TCQ 'd1;
      
      end else if (stg1_wr_rd_cnt > 'd73) begin
        if (stg1_wr_rd_cnt == 'd85) 
          complex_num_reads <= #TCQ 'd3;
        else if (complex_num_reads < 'd5)
          complex_num_reads <= #TCQ complex_num_reads + 1;
      end else if (stg1_wr_rd_cnt > 'd39) begin
        if (stg1_wr_rd_cnt == 'd73) 
          complex_num_reads <= #TCQ 'd7;
        else if (complex_num_reads < 'd10)
          complex_num_reads <= #TCQ complex_num_reads + 1;
      end else begin
        if (stg1_wr_rd_cnt == 'd39) 
          complex_num_reads <= #TCQ 'd12;
        else if (complex_num_reads < 'd14)
          complex_num_reads <= #TCQ complex_num_reads + 1;
      end 
    
    end else if ((((init_state_r == INIT_RDLVL_STG1_WRITE_READ) || (init_state_r == INIT_RDLVL_COMPLEX_ACT_WAIT)) && ~ext_int_ref_req) ||
	             ((init_state_r == INIT_RDLVL_STG1_WRITE_READ) && (stg1_wr_rd_cnt == 'd22)))
      complex_num_reads <= #TCQ 'd1;
