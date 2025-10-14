    always @(posedge clk) begin
      if (rst || dqsfound_retry || wrlvl_byte_redo) begin
        pi_dqs_found_start <= #TCQ 1'b0;
        wrcal_start        <= #TCQ 1'b0;
      end else begin
        if (!pi_dqs_found_done && init_state_r == INIT_RDLVL_STG2_READ)
          pi_dqs_found_start <= #TCQ 1'b1;
        if (wrcal_start_dly_r[5])
          wrcal_start <= #TCQ 1'b1;
      end  
    end 