  assign rdlvl_stg1_rnk_done = rdlvl_rank_done_r;
  assign mpr_rnk_done        = mpr_rank_done_r;
  assign mpr_rdlvl_done      = ((DRAM_TYPE == "DDR3") && (OCAL_EN == "ON")) ? 
                                mpr_rdlvl_done_r : 1'b1;

   
   
   
   
   assign pi_stg2_rdlvl_cnt = (((PI_DIV2_INCDEC == "TRUE") && (cal1_state_r3 == CAL1_REGL_LOAD)) || ((PI_DIV2_INCDEC == "FALSE") && (cal1_state_r == CAL1_REGL_LOAD))) ? regl_dqs_cnt_r : cal1_cnt_cpt_r;
   assign rdlvl_stg1_done   = (PI_DIV2_INCDEC == "TRUE") ? rdlvl_stg1_done_int_r3 : rdlvl_stg1_done_int;
   assign rdlvl_last_byte_done = (PI_DIV2_INCDEC == "TRUE") ? rdlvl_last_byte_done_int_r3 : rdlvl_last_byte_done_int;
