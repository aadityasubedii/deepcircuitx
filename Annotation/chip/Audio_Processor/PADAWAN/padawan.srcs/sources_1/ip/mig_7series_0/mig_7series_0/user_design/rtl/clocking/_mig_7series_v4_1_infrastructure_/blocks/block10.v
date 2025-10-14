  generate
    if (MEM_TYPE == "DDR3" && tCK <= 1500) begin: rst_tmp_300_400
      assign rst_tmp = sys_rst_act_hi | ~iodelay_ctrl_rdy[1] |
                       ~ref_dll_lock | ~MMCM_Locked_i;
    end else begin: rst_tmp_200
      assign rst_tmp = sys_rst_act_hi | ~iodelay_ctrl_rdy[0] |
                       ~ref_dll_lock | ~MMCM_Locked_i;
    end
  endgenerate