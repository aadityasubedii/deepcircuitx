   tg_status
     #(
     
       .TCQ           (TCQ),
       .DWIDTH            (DWIDTH)
       )
   tg_status
     (
      .clk_i              (clk_i),
      .rst_i              (rst_ra[2]),
      .manual_clear_error (manual_clear_error),
      .data_error_i       (cmp_error),
      .cmp_data_i         (cmp_data),
      .rd_data_i          (mem_rd_data ),
      .cmp_addr_i         (cmp_addr),
      .cmp_bl_i           (cmp_bl),
      .mcb_cmd_full_i     (mcb_cmd_full_i),
      .mcb_wr_full_i      (mcb_wr_full),           
      .mcb_rd_empty_i     (mcb_rd_empty),
      .error_status       (error_status),
      .error              (error)
      );