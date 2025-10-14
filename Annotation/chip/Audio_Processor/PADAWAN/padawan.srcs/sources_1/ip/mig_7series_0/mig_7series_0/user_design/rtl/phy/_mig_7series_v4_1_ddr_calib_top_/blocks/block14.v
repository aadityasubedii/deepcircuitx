end else begin:ddr_phy_rdlvl_off

     assign mpr_rdlvl_done          = 1'b1;
     assign mpr_last_byte_done      = 1'b1;
     assign mpr_rnk_done            = 1'b1;
     assign rdlvl_stg1_done         = 1'b1;
     assign rdlvl_stg1_rank_done    = 1'b1;
     assign rdlvl_last_byte_done    = 1'b1;
     assign pi_fine_dly_dec_done    = 1'b1;
     assign rdlvl_prech_req         = 1'b0;
     assign rdlvl_stg1_err          = 1'b0;
     assign mpr_rdlvl_err           = 1'b0;
     assign rdlvl_err               = 1'b0;
     assign rdlvl_assrt_common      = 1'b0;
     assign rdlvl_pi_stg2_f_en      = 1'b0;
     assign rdlvl_pi_stg2_f_incdec  = 1'b0;
     assign pi_stg2_rdlvl_cnt       = 'h0;
     assign idelay_ce_int           = 1'b0;
     assign idelay_inc_int          = 1'b0;
     assign rdlvl_pi_incdec         = 1'b0;
     assign dbg_phy_rdlvl           = 'h0;
     assign dbg_cpt_first_edge_cnt  = 'h0;
     assign dbg_cpt_second_edge_cnt = 'h0;
     assign dbg_cpt_tap_cnt         = 'h0;
     assign dbg_dq_idelay_tap_cnt   = 'h0;

end