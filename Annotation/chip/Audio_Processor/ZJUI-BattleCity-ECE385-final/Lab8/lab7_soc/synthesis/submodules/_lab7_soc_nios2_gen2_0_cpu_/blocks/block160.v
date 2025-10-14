  assign av_ld_align_cycle_nxt = av_ld_getting_data ? 0 : (av_ld_align_cycle+1);
  assign av_ld_align_one_more_cycle = av_ld_align_cycle == (D_ctrl_mem16 ? 2 : 3);
  assign av_ld_aligning_data_nxt = av_ld_aligning_data ? 
    ~av_ld_align_one_more_cycle : 
    (~D_ctrl_mem32 & av_ld_getting_data);

  assign av_ld_waiting_for_data_nxt = av_ld_waiting_for_data ? 
    ~av_ld_getting_data : 
    (R_ctrl_ld & E_new_inst);

  assign av_ld_done = ~av_ld_waiting_for_data_nxt & (D_ctrl_mem32 | ~av_ld_aligning_data_nxt);
  assign av_ld_rshift8 = av_ld_aligning_data & 
    (av_ld_align_cycle < (W_mem_baddr[1 : 0]));

  assign av_ld_extend = av_ld_aligning_data;
  assign av_ld_byte0_data_nxt = av_ld_rshift8      ? av_ld_byte1_data :
    av_ld_extend       ? av_ld_byte0_data :d_readdata[7 : 0];

  assign av_ld_byte1_data_nxt = av_ld_rshift8      ? av_ld_byte2_data :
    av_ld_extend       ? {8 {av_fill_bit}} :d_readdata[15 : 8];

  assign av_ld_byte2_data_nxt = av_ld_rshift8      ? av_ld_byte3_data :
    av_ld_extend       ? {8 {av_fill_bit}} :d_readdata[23 : 16];

  assign av_ld_byte3_data_nxt = av_ld_rshift8      ? av_ld_byte3_data :
    av_ld_extend       ? {8 {av_fill_bit}} :d_readdata[31 : 24];

  assign av_ld_byte1_data_en = ~(av_ld_extend & D_ctrl_mem16 & ~av_ld_rshift8);
  assign av_ld_data_aligned_unfiltered = {av_ld_byte3_data, av_ld_byte2_data, 
    av_ld_byte1_data, av_ld_byte0_data};

  assign av_sign_bit = D_ctrl_mem16 ? av_ld_byte1_data[7] : av_ld_byte0_data[7];
  assign av_fill_bit = av_sign_bit & R_ctrl_ld_signed;