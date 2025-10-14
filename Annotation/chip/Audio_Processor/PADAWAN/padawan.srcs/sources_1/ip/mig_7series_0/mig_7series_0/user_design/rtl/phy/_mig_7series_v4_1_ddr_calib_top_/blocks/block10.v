     assign prbs_rdlvl_done_complex = rdlvl_stg1_done ;
     
     assign prbs_last_byte_done     = rdlvl_stg1_done;
     assign reset_rd_addr           = 1'b0;
     assign prbs_rdlvl_prech_req    = 1'b0 ;
     assign prbs_pi_stg2_f_en       = 1'b0 ;
     assign prbs_pi_stg2_f_incdec   = 1'b0 ;
     assign pi_stg2_prbs_rdlvl_cnt  = 'b0 ;
     assign dbg_prbs_rdlvl          = 'h0 ;
     assign prbs_final_dqs_tap_cnt_r  = {(6*DQS_WIDTH*RANKS){1'b0}};
     assign dbg_prbs_first_edge_taps  = {(6*DQS_WIDTH*RANKS){1'b0}};
     assign dbg_prbs_second_edge_taps = {(6*DQS_WIDTH*RANKS){1'b0}};
     assign complex_pi_incdec_done  = 'b0;
     assign complex_init_pi_dec_done  = 'b1;
     assign num_samples_done_r      = 'b0;