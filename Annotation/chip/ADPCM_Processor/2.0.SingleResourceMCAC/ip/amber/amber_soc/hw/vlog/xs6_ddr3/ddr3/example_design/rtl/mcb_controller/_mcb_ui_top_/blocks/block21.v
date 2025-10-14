    if (C_S2_AXI_ENABLE == 0) begin : P2_UI_MCB
      assign  p2_arb_en_i        =  p2_arb_en        ; 
      assign  p2_cmd_clk_i       =  p2_cmd_clk       ; 
      assign  p2_cmd_en_i        =  p2_cmd_en        ; 
      assign  p2_cmd_instr_i     =  p2_cmd_instr     ; 
      assign  p2_cmd_bl_i        =  p2_cmd_bl        ; 
      assign  p2_cmd_byte_addr_i =  p2_cmd_byte_addr ; 
      assign  p2_cmd_empty       =  p2_cmd_empty_i   ; 
      assign  p2_cmd_full        =  p2_cmd_full_i    ; 
      assign  p2_wr_clk_i        =  p2_wr_clk        ; 
      assign  p2_wr_en_i         =  p2_wr_en         ; 
      assign  p2_wr_mask_i       =  p2_wr_mask       ; 
      assign  p2_wr_data_i       =  p2_wr_data       ; 
      assign  p2_wr_full         =  p2_wr_full_i     ; 
      assign  p2_wr_empty        =  p2_wr_empty_i    ; 
      assign  p2_wr_count        =  p2_wr_count_i    ; 
      assign  p2_wr_underrun     =  p2_wr_underrun_i ; 
      assign  p2_wr_error        =  p2_wr_error_i    ; 
      assign  p2_rd_clk_i        =  p2_rd_clk        ; 
      assign  p2_rd_en_i         =  p2_rd_en         ; 
      assign  p2_rd_data         =  p2_rd_data_i     ; 
      assign  p2_rd_full         =  p2_rd_full_i     ; 
      assign  p2_rd_empty        =  p2_rd_empty_i    ; 
      assign  p2_rd_count        =  p2_rd_count_i    ; 
      assign  p2_rd_overflow     =  p2_rd_overflow_i ; 
      assign  p2_rd_error        =  p2_rd_error_i    ; 
    end