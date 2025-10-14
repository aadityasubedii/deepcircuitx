  generate
    if (C_S3_AXI_ENABLE == 0) begin : P3_UI_MCB
      assign  p3_arb_en_i        =  p3_arb_en        ; 
      assign  p3_cmd_clk_i       =  p3_cmd_clk       ; 
      assign  p3_cmd_en_i        =  p3_cmd_en        ; 
      assign  p3_cmd_instr_i     =  p3_cmd_instr     ; 
      assign  p3_cmd_bl_i        =  p3_cmd_bl        ; 
      assign  p3_cmd_byte_addr_i =  p3_cmd_byte_addr ; 
      assign  p3_cmd_empty       =  p3_cmd_empty_i   ; 
      assign  p3_cmd_full        =  p3_cmd_full_i    ; 
      assign  p3_wr_clk_i        =  p3_wr_clk        ; 
      assign  p3_wr_en_i         =  p3_wr_en         ; 
      assign  p3_wr_mask_i       =  p3_wr_mask       ; 
      assign  p3_wr_data_i       =  p3_wr_data       ; 
      assign  p3_wr_full         =  p3_wr_full_i     ; 
      assign  p3_wr_empty        =  p3_wr_empty_i    ; 
      assign  p3_wr_count        =  p3_wr_count_i    ; 
      assign  p3_wr_underrun     =  p3_wr_underrun_i ; 
      assign  p3_wr_error        =  p3_wr_error_i    ; 
      assign  p3_rd_clk_i        =  p3_rd_clk        ; 
      assign  p3_rd_en_i         =  p3_rd_en         ; 
      assign  p3_rd_data         =  p3_rd_data_i     ; 
      assign  p3_rd_full         =  p3_rd_full_i     ; 
      assign  p3_rd_empty        =  p3_rd_empty_i    ; 
      assign  p3_rd_count        =  p3_rd_count_i    ; 
      assign  p3_rd_overflow     =  p3_rd_overflow_i ; 
      assign  p3_rd_error        =  p3_rd_error_i    ; 
    end