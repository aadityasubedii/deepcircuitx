  generate begin : rd_buf_indx
      wire upd_rd_buf_indx = ~ram_init_done_r_lcl || app_rd_data_valid_ns;


      wire ram_init_done_ns =
            ~rst && (ram_init_done_r_lcl || (rd_buf_indx_r[4:0] == 5'h1f));
      always @(posedge clk) ram_init_done_r_lcl <= #TCQ ram_init_done_ns;