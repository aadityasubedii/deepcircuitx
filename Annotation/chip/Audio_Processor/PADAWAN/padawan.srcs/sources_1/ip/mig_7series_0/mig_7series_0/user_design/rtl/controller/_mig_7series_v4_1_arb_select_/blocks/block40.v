      always @(posedge clk) col_data_buf_addr_r <=
                              #TCQ col_data_buf_addr_ns;

      if (ECC != "OFF" || EVEN_CWL_2T_MODE == "ON") begin