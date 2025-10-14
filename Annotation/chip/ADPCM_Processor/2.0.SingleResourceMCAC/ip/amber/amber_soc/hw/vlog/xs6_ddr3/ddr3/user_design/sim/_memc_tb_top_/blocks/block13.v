generate
   if (C_PORT_ENABLE[3] == 1'b1) 
   begin : PORT3_TG    
   
   init_mem_pattern_ctr #
     (
      .DWIDTH                        (P3_DWIDTH), 
      .FAMILY                        (FAMILY),
      .BEGIN_ADDRESS                 (P3_BEGIN_ADDRESS),
      .END_ADDRESS                   (P3_END_ADDRESS),
      .CMD_SEED_VALUE                (32'h56456783),
      .DATA_SEED_VALUE               (32'h12345678),  
      .DATA_MODE                     (P3_DATA_MODE), 
      .PORT_MODE                     (C_P3_PORT_MODE) 
     )
   init_mem_pattern_ctr_p3
     (
      .clk_i                         (clk0),   
      .rst_i                         (rst0),     
   
      .mcb_cmd_en_i                  (p3_mcb_cmd_en_sig),   
      .mcb_cmd_instr_i               (p3_mcb_cmd_instr_sig),
      .mcb_cmd_addr_i                (p3_mcb_cmd_addr_sig), 
      .mcb_cmd_bl_i                  (p3_mcb_cmd_bl_sig),  
      .mcb_wr_en_i                   (p3_mcb_wr_en_sig), 
   
      .vio_modify_enable	     (vio_modify_enable),   
      .vio_data_mode_value           (vio_data_mode_value),  
      .vio_addr_mode_value           (vio_addr_mode_value),
      .vio_bl_mode_value             (2'b10),
      .vio_fixed_bl_value            (6'd64),
      .mcb_init_done_i               (calib_done),
      .cmp_error                     (p3_error),
      .run_traffic_o                 (p3_tg_run_traffic),  
      .start_addr_o                  (p3_tg_start_addr),
      .end_addr_o                    (p3_tg_end_addr), 
      .cmd_seed_o                    (p3_tg_cmd_seed),  
      .data_seed_o                   (p3_tg_data_seed), 
      .load_seed_o                   (p3_tg_load_seed), 
      .addr_mode_o                   (p3_tg_addr_mode), 
      .instr_mode_o                  (p3_tg_instr_mode), 
      .bl_mode_o                     (p3_tg_bl_mode), 
      .data_mode_o                   (p3_tg_data_mode), 
      .mode_load_o                   (p3_tg_mode_load), 
      .fixed_bl_o                    (p3_tg_fixed_bl), 
      .fixed_instr_o                 (p3_tg_fixed_instr), 
      .fixed_addr_o                  (p3_tg_fixed_addr) 
     );
   
   
   mcb_traffic_gen #
     (  
      .MEM_BURST_LEN                 (C_MEM_BURST_LEN),  
      .MEM_COL_WIDTH                 (C_MEM_NUM_COL_BITS),  
      .NUM_DQ_PINS                   (C_NUM_DQ_PINS), 
      .DQ_ERROR_WIDTH                (DQ_ERROR_WIDTH),  
      .PORT_MODE                     (C_P3_PORT_MODE),     
      .DWIDTH                        (P3_DWIDTH),   
      .CMP_DATA_PIPE_STAGES          (CMP_DATA_PIPE_STAGES),   
      .FAMILY                        (FAMILY),    
      .SIMULATION                    ("FALSE"),   
      .DATA_PATTERN                  (TG_DATA_PATTERN),  
      .CMD_PATTERN                   ("CGEN_ALL"),  
      .ADDR_WIDTH                    (30),  
      .PRBS_SADDR_MASK_POS           (P3_PRBS_SADDR_MASK_POS), 
      .PRBS_EADDR_MASK_POS           (P3_PRBS_EADDR_MASK_POS),
      .PRBS_SADDR                    (P3_BEGIN_ADDRESS), 
      .PRBS_EADDR                    (P3_END_ADDRESS)
     )  
   m_traffic_gen_p3 
     (  
      .clk_i                         (clk0),     
      .rst_i                         (rst0),     
      .run_traffic_i                 (p3_tg_run_traffic),                  
      .manual_clear_error            (rst0),     
      
      .start_addr_i                  (p3_tg_start_addr),                  
      .end_addr_i                    (p3_tg_end_addr),                  
      .cmd_seed_i                    (p3_tg_cmd_seed),                  
      .data_seed_i                   (p3_tg_data_seed),                  
      .load_seed_i                   (p3_tg_load_seed),                
      .addr_mode_i                   (p3_tg_addr_mode),                
      .instr_mode_i                  (p3_tg_instr_mode),                  
      .bl_mode_i                     (p3_tg_bl_mode),                  
      .data_mode_i                   (p3_tg_data_mode),                  
      .mode_load_i                   (p3_tg_mode_load),                  
      
      .fixed_bl_i                    (p3_tg_fixed_bl),                     
      .fixed_instr_i                 (p3_tg_fixed_instr),                     
      .fixed_addr_i                  (p3_tg_fixed_addr),                 
      .fixed_data_i                  (), 
      
      .bram_cmd_i                    (), 
      .bram_valid_i                  (), 
      .bram_rdy_o                    (),  
      
      
      .mcb_cmd_en_o		     (p3_mcb_cmd_en),                 
      .mcb_cmd_instr_o		     (p3_mcb_cmd_instr),                    
      .mcb_cmd_bl_o		     (p3_mcb_cmd_bl),                 
      .mcb_cmd_addr_o		     (p3_mcb_cmd_addr),                   
      .mcb_cmd_full_i		     (p3_mcb_cmd_full),                   
   
      .mcb_wr_en_o		     (p3_mcb_wr_en),                
      .mcb_wr_mask_o		     (p3_mcb_wr_mask),                  
      .mcb_wr_data_o		     (p3_mcb_wr_data),                 
      .mcb_wr_data_end_o             (), 
      .mcb_wr_full_i		     (p3_mcb_wr_full),                  
      .mcb_wr_fifo_counts	     (p3_mcb_wr_fifo_counts),                       
   
      .mcb_rd_en_o		     (p3_mcb_rd_en),                
      .mcb_rd_data_i		     (p3_mcb_rd_data),                  
      .mcb_rd_empty_i		     (p3_mcb_rd_empty),                   
      .mcb_rd_fifo_counts	     (p3_mcb_rd_fifo_counts),                       
   
      
      .counts_rst                    (rst0),     
      .wr_data_counts                (), 
      .rd_data_counts                (), 
      .error                         (p3_error),
      .error_status                  (p3_error_status),
      .cmp_data                      (p3_cmp_data),            
      .cmp_data_valid                (p3_cmp_data_valid),                  
      .cmp_error                     (p3_cmp_error),             
      .mem_rd_data                   (), 
      .dq_error_bytelane_cmp         (), 
      .cumlative_dq_lane_error       ()
     );     
   end  
   else begin: PORT3_NO_TG
      assign p3_error          = 'b0;
      assign p3_error_status   = 'b0;
      assign p3_cmp_data       = 'b0;
      assign p3_cmp_data_valid = 'b0;
      assign p3_cmp_error      = 'b0;
   end   
endgenerate