        RD_DONE_WAIT_FOR_PI_INC_DEC: begin
          if (complex_act_start & ~complex_rdlvl_err) 
            prbs_state_r <= #TCQ fine_calib? FINE_PI_DEC: PRBS_DEC_DQS;
        end

        
        PRBS_DONE: begin
          prbs_prech_req_r    <= #TCQ 1'b0;
          prbs_last_byte_done <= #TCQ 1'b0;
          prbs_rdlvl_done     <= #TCQ ~complex_rdlvl_err;
          reset_rd_addr       <= #TCQ 1'b0;
        end