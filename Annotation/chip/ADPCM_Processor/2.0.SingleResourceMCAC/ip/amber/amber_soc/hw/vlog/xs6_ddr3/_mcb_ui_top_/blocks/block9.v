  generate
    if (C_S4_AXI_ENABLE == 0) begin : P4_UI_MCB
      assign  p4_arb_en_i        =  p4_arb_en        ; 
      assign  p4_cmd_clk_i       =  p4_cmd_clk       ; 
      assign  p4_cmd_en_i        =  p4_cmd_en        ; 
      assign  p4_cmd_instr_i     =  p4_cmd_instr     ; 
      assign  p4_cmd_bl_i        =  p4_cmd_bl        ; 
      assign  p4_cmd_byte_addr_i =  p4_cmd_byte_addr ; 
      assign  p4_cmd_empty       =  p4_cmd_empty_i   ; 
      assign  p4_cmd_full        =  p4_cmd_full_i    ; 
      assign  p4_wr_clk_i        =  p4_wr_clk        ; 
      assign  p4_wr_en_i         =  p4_wr_en         ; 
      assign  p4_wr_mask_i       =  p4_wr_mask       ; 
      assign  p4_wr_data_i       =  p4_wr_data       ; 
      assign  p4_wr_full         =  p4_wr_full_i     ; 
      assign  p4_wr_empty        =  p4_wr_empty_i    ; 
      assign  p4_wr_count        =  p4_wr_count_i    ; 
      assign  p4_wr_underrun     =  p4_wr_underrun_i ; 
      assign  p4_wr_error        =  p4_wr_error_i    ; 
      assign  p4_rd_clk_i        =  p4_rd_clk        ; 
      assign  p4_rd_en_i         =  p4_rd_en         ; 
      assign  p4_rd_data         =  p4_rd_data_i     ; 
      assign  p4_rd_full         =  p4_rd_full_i     ; 
      assign  p4_rd_empty        =  p4_rd_empty_i    ; 
      assign  p4_rd_count        =  p4_rd_count_i    ; 
      assign  p4_rd_overflow     =  p4_rd_overflow_i ; 
      assign  p4_rd_error        =  p4_rd_error_i    ; 
    end