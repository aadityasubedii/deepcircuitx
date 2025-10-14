  generate
    if (MEM_TYPE == "DDR3" && tCK <= 1500) begin: rst_tmp_phaser_ref_300_400
      assign rst_tmp_phaser_ref = sys_rst_act_hi | ~MMCM_Locked_i | ~iodelay_ctrl_rdy[1];
    end else begin: rst_tmp_phaser_ref_200
      assign rst_tmp_phaser_ref = sys_rst_act_hi | ~MMCM_Locked_i | ~iodelay_ctrl_rdy[0];
    end
  endgenerate