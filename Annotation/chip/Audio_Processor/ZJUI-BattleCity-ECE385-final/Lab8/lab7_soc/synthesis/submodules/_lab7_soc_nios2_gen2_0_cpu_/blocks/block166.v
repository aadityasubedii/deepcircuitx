  assign E_st_data = (D_ctrl_mem8)? {R_stb_data, R_stb_data, R_stb_data, R_stb_data} :
    (D_ctrl_mem16)? {R_sth_data, R_sth_data} :
    R_stw_data;