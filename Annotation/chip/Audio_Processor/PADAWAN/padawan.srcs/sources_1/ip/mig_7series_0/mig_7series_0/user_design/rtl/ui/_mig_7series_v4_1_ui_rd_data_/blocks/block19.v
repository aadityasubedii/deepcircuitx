      assign app_rd_data_valid_ns =
              ram_init_done_r_lcl && (bypass || rd_data_rdy);
      wire app_rd_data_end_ns = bypass ? rd_data_end : rd_status[1];