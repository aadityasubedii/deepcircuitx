    if (C_S0_AXI_ENABLE == 0) begin : P0_UI_MCB
      assign  p0_arb_en_i        =  p0_arb_en        ; 
      assign  p0_cmd_clk_i       =  p0_cmd_clk       ; 
      assign  p0_cmd_en_i        =  p0_cmd_en        ; 
      assign  p0_cmd_instr_i     =  p0_cmd_instr     ; 
      assign  p0_cmd_bl_i        =  p0_cmd_bl        ; 
      assign  p0_cmd_byte_addr_i =  p0_cmd_byte_addr ; 
      assign  p0_cmd_empty       =  p0_cmd_empty_i   ; 
      assign  p0_cmd_full        =  p0_cmd_full_i    ; 
      assign  p0_wr_clk_i        =  p0_wr_clk        ; 
      assign  p0_wr_en_i         =  p0_wr_en         ; 
      assign  p0_wr_mask_i       =  p0_wr_mask       ; 
      assign  p0_wr_data_i       =  p0_wr_data       ; 
      assign  p0_wr_full         =  p0_wr_full_i     ; 
      assign  p0_wr_empty        =  p0_wr_empty_i    ; 
      assign  p0_wr_count        =  p0_wr_count_i    ; 
      assign  p0_wr_underrun     =  p0_wr_underrun_i ; 
      assign  p0_wr_error        =  p0_wr_error_i    ; 
      assign  p0_rd_clk_i        =  p0_rd_clk        ; 
      assign  p0_rd_en_i         =  p0_rd_en         ; 
      assign  p0_rd_data         =  p0_rd_data_i     ; 
      assign  p0_rd_full         =  p0_rd_full_i     ; 
      assign  p0_rd_empty        =  p0_rd_empty_i    ; 
      assign  p0_rd_count        =  p0_rd_count_i    ; 
      assign  p0_rd_overflow     =  p0_rd_overflow_i ; 
      assign  p0_rd_error        =  p0_rd_error_i    ; 
    end