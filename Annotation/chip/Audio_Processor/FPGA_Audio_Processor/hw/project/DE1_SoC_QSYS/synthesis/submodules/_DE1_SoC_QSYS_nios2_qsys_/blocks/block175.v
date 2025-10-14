  assign E_st_data = (D_mem8)? {R_stb_data, R_stb_data, R_stb_data, R_stb_data} :
    (D_mem16)? {R_sth_data, R_sth_data} :
    R_rf_b;