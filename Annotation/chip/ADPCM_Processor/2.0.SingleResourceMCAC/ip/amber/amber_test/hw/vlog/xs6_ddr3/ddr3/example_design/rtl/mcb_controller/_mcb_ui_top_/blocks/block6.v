    if (C_S5_AXI_ENABLE == 0) begin : P5_UI_MCB
      assign  p5_arb_en_i        =  p5_arb_en        ; 
      assign  p5_cmd_clk_i       =  p5_cmd_clk       ; 
      assign  p5_cmd_en_i        =  p5_cmd_en        ; 
      assign  p5_cmd_instr_i     =  p5_cmd_instr     ; 
      assign  p5_cmd_bl_i        =  p5_cmd_bl        ; 
      assign  p5_cmd_byte_addr_i =  p5_cmd_byte_addr ; 
      assign  p5_cmd_empty       =  p5_cmd_empty_i   ; 
      assign  p5_cmd_full        =  p5_cmd_full_i    ; 
      assign  p5_wr_clk_i        =  p5_wr_clk        ; 
      assign  p5_wr_en_i         =  p5_wr_en         ; 
      assign  p5_wr_mask_i       =  p5_wr_mask       ; 
      assign  p5_wr_data_i       =  p5_wr_data       ; 
      assign  p5_wr_full         =  p5_wr_full_i     ; 
      assign  p5_wr_empty        =  p5_wr_empty_i    ; 
      assign  p5_wr_count        =  p5_wr_count_i    ; 
      assign  p5_wr_underrun     =  p5_wr_underrun_i ; 
      assign  p5_wr_error        =  p5_wr_error_i    ; 
      assign  p5_rd_clk_i        =  p5_rd_clk        ; 
      assign  p5_rd_en_i         =  p5_rd_en         ; 
      assign  p5_rd_data         =  p5_rd_data_i     ; 
      assign  p5_rd_full         =  p5_rd_full_i     ; 
      assign  p5_rd_empty        =  p5_rd_empty_i    ; 
      assign  p5_rd_count        =  p5_rd_count_i    ; 
      assign  p5_rd_overflow     =  p5_rd_overflow_i ; 
      assign  p5_rd_error        =  p5_rd_error_i    ; 
    end