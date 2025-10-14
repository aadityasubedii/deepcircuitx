   rd_data_gen #(
              .TCQ               (TCQ),
              .FAMILY  (FAMILY),
              .MEM_BURST_LEN    (MEM_BURST_LEN),
              .NUM_DQ_PINS (NUM_DQ_PINS), 
              .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
   
              .DATA_PATTERN  (DATA_PATTERN),
              .DWIDTH(DWIDTH),
              .COLUMN_WIDTH     (MEM_COL_WIDTH)
              
              )
   rd_datagen(
            .clk_i              (clk_i          ),
            .rst_i              (rst_i[4:0]),            
            .prbs_fseed_i       (prbs_fseed_i),
            .data_mode_i        (data_mode_i    ),            
            .cmd_rdy_o          (gen_rdy        ),
            .cmd_valid_i        (gen_valid      ),  
            .last_word_o        (last_word_rd_o ),  
            

            .fixed_data_i         (fixed_data_i),
            
            .addr_i             (gen_addr       ),
            .bl_i               (gen_bl         ),
            .user_bl_cnt_is_1_o   (user_bl_cnt_is_1),
            .data_rdy_i         (data_valid_i        ),  
            .data_valid_o       (cmp_valid      ),
            .data_o             (cmp_data       ),
            .rd_mdata_en          (rd_mdata_en)