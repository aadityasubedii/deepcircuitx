generate
if((DRAM_TYPE == "DDR3") && (nCK_PER_CLK == 4) && (BYPASS_COMPLEX_RDLVL=="FALSE")) begin:ddr_phy_prbs_rdlvl_gen
  mig_7series_v4_1_ddr_phy_prbs_rdlvl #
    (
     .TCQ            (TCQ),
     .nCK_PER_CLK    (nCK_PER_CLK),
     .DQ_WIDTH       (DQ_WIDTH),
     .DQS_CNT_WIDTH  (DQS_CNT_WIDTH),
     .DQS_WIDTH      (DQS_WIDTH),
     .DRAM_WIDTH     (DRAM_WIDTH),
     .RANKS          (1),
     .SIM_CAL_OPTION (SIM_CAL_OPTION),
     .PRBS_WIDTH     (PRBS_WIDTH),
     .FIXED_VICTIM   (FIXED_VICTIM),
     .FINE_PER_BIT   (FINE_PER_BIT),
     .CENTER_COMP_MODE (CENTER_COMP_MODE),
     .PI_VAL_ADJ       (PI_VAL_ADJ)
     )
    u_ddr_phy_prbs_rdlvl
      (
       .clk                    (clk),
       .rst                    (rst),
       .prbs_rdlvl_start       (prbs_rdlvl_start),
       .prbs_rdlvl_done        (prbs_rdlvl_done_complex),
       .prbs_last_byte_done    (prbs_last_byte_done),
       .prbs_rdlvl_prech_req   (prbs_rdlvl_prech_req),
       .complex_sample_cnt_inc (complex_sample_cnt_inc),
       .prech_done             (prech_done),
       .phy_if_empty           (phy_if_empty),
       .rd_data                (phy_rddata),
       .compare_data           (prbs_o),
       .pi_counter_read_val    (pi_counter_read_val),
       .pi_en_stg2_f           (prbs_pi_stg2_f_en),
       .pi_stg2_f_incdec       (prbs_pi_stg2_f_incdec),
       .dbg_prbs_rdlvl         (dbg_prbs_rdlvl),
       .pi_stg2_prbs_rdlvl_cnt (pi_stg2_prbs_rdlvl_cnt),
       .prbs_final_dqs_tap_cnt_r (prbs_final_dqs_tap_cnt_r),
       .dbg_prbs_first_edge_taps (dbg_prbs_first_edge_taps),
       .dbg_prbs_second_edge_taps (dbg_prbs_second_edge_taps),
       .rd_victim_sel          (rd_victim_sel),
       .complex_victim_inc     (complex_victim_inc),
       .reset_rd_addr          (reset_rd_addr),
       .fine_delay_incdec_pb   (fine_delay_incdec_pb),
       .fine_delay_sel         (fine_delay_sel),
       .complex_act_start      (complex_act_start),
       .num_samples_done_r     (num_samples_done_r),
       .complex_pi_incdec_done (complex_pi_incdec_done),
       .complex_init_pi_dec_done     (complex_init_pi_dec_done)
       );
end else begin:ddr_phy_prbs_rdlvl_off

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
end
endgenerate