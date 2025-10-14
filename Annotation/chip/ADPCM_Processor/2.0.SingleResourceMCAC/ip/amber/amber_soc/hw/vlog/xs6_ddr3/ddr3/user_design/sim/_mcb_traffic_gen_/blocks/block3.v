generate
if (PORT_MODE == "WR_MODE" || PORT_MODE == "BI_MODE") begin : WR_PATH

   write_data_path
     #(
     
       .TCQ           (TCQ),
       .FAMILY  (FAMILY),
       .MEM_BURST_LEN     (MEM_BLEN),
       .ADDR_WIDTH        (ADDR_WIDTH),
       .DATA_PATTERN      (DATA_PATTERN),
       .DWIDTH            (DWIDTH),
       .NUM_DQ_PINS       (NUM_DQ_PINS),
       .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
       .MEM_COL_WIDTH     (MEM_COL_WIDTH),
       .EYE_TEST          (EYE_TEST)

       )
   write_data_path
     (
      .clk_i(clk_i),
      .rst_i            (rst_rb),
      .cmd_rdy_o            (wr_rdy),
      .cmd_valid_i          (wr_valid),
      .cmd_validB_i          (wr_validB),
      .cmd_validC_i          (wr_validC),
      .prbs_fseed_i         (data_seed_i),
      .data_mode_i          (data_mode_r_c),
      .last_word_wr_o       (last_word_wr),

      .fixed_data_i         (fixed_data_i),
      .addr_i               (wr_addr),
      .bl_i                 (wr_bl),
      .data_rdy_i           (!mcb_wr_full),
      .data_valid_o         (mcb_wr_en),
      .data_o               (mcb_wr_data_o),
      .data_mask_o          (mcb_wr_mask_o),
      .data_wr_end_o           (mcb_wr_data_end_o)
      );
   
end
endgenerate