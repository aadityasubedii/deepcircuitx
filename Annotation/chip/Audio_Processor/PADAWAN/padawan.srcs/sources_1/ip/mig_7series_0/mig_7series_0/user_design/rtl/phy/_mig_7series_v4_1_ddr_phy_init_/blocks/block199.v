  always @(posedge clk)
    if (rst || rdlvl_stg1_rank_done) begin
      rdlvl_stg1_start   <= #TCQ 1'b0;
      rdlvl_stg1_start_int <= #TCQ 1'b0;
      rdlvl_start_pre <= #TCQ 1'b0;
      prbs_rdlvl_start     <= #TCQ 1'b0;
    end else begin      
      if (pi_dqs_found_done && cnt_cmd_done_r &&
         (init_state_r == INIT_RDLVL_ACT_WAIT))
        rdlvl_stg1_start_int <= #TCQ 1'b1;
      if (pi_dqs_found_done &&
         (init_state_r == INIT_RDLVL_STG1_READ))begin
        rdlvl_start_pre <= #TCQ 1'b1;
        rdlvl_stg1_start <= #TCQ  rdlvl_start_dly0_r[14];
      end 
      if (pi_dqs_found_done && rdlvl_stg1_done && ~prbs_rdlvl_done &&
         (init_state_r == INIT_RDLVL_COMPLEX_PI_WAIT) && (WRLVL == "ON")) begin
        prbs_rdlvl_start <= #TCQ 1'b1;
      end  
    end
end