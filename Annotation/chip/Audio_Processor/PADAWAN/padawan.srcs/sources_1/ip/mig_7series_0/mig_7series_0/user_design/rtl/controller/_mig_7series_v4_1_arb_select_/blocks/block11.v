  wire slot_0_odt = (DRAM_TYPE == "DDR3") ? ~slot_0_read : slot_0_write;
  assign mc_aux_out0[1] = slot_0_odt & sent_col;  