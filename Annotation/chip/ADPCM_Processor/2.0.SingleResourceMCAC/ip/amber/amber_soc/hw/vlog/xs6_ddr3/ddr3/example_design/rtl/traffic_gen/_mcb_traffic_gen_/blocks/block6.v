generate
if (PORT_MODE == "RD_MODE" || PORT_MODE == "BI_MODE")  begin : RD_PATH
   read_data_path
     #(
       .TCQ           (TCQ),
       .FAMILY            (FAMILY)  ,
       .MEM_BURST_LEN     (MEM_BLEN),

       .CMP_DATA_PIPE_STAGES (CMP_DATA_PIPE_STAGES),
       .ADDR_WIDTH        (ADDR_WIDTH),
       .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
       .DATA_PATTERN      (DATA_PATTERN),
       .DWIDTH            (DWIDTH),
       .NUM_DQ_PINS       (NUM_DQ_PINS),
       .DQ_ERROR_WIDTH    (DQ_ERROR_WIDTH),
       .MEM_COL_WIDTH     (MEM_COL_WIDTH)

       )
   read_data_path
     (
      .clk_i              (clk_i),
      .rst_i              (rst_rb),
      .manual_clear_error (manual_clear_error),
      .cmd_rdy_o          (rd_rdy),
      .cmd_valid_i        (rd_valid),
      .prbs_fseed_i         (data_seed_i),
      .cmd_sent                 (mcb_cmd_instr_o),
      .bl_sent                  (mcb_cmd_bl_o),
      .cmd_en_i              (cmd_rd_en),

      .data_mode_i        (data_mode_r_b),
      .last_word_rd_o         (last_word_rd),

      .fixed_data_i         (fixed_data_i),

      .addr_i                 (rd_addr),
      .bl_i                   (rd_bl),
      .data_rdy_o             (mcb_rd_en_o),
      
      .data_valid_i           (rdpath_data_valid_i),
      .data_i                 (rdpath_rd_data_i), 
      
      
      .data_error_o           (cmp_error),
      .cmp_data_valid         (cmp_data_valid),
      .cmp_data_o             (cmp_data),
      .rd_mdata_o             (mem_rd_data ),
      .cmp_addr_o             (cmp_addr),
      .cmp_bl_o               (cmp_bl),
      .force_wrcmd_gen_o      (force_wrcmd_gen),
      .rd_buff_avail_o        (rd_buff_avail),
      .dq_error_bytelane_cmp     (dq_error_bytelane_cmp),
      .cumlative_dq_lane_error_r   (cumlative_dq_lane_error)

      );

end
else begin: WR_ONLY_PATH

   assign cmp_error = 1'b0;
end   
endgenerate