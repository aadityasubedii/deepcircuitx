generate
   if (C_PORT_ENABLE[0] == 1'b1)
   begin : PORT0_TG    
   
   init_mem_pattern_ctr #
     (
      .DWIDTH                        (C_P0_DATA_PORT_SIZE), 
      .FAMILY                        (FAMILY),
      .BEGIN_ADDRESS                 (C_p0_BEGIN_ADDRESS),
      .END_ADDRESS                   (C_p0_END_ADDRESS),
      .CMD_SEED_VALUE                (32'h56456783),
      .DATA_SEED_VALUE               (32'h12345678),  
      .DATA_MODE                     (C_p0_DATA_MODE), 
      .PORT_MODE                     (C_P0_PORT_MODE) 
    )
   init_mem_pattern_ctr_p0
     (
      .clk_i                         (clk0),   
      .rst_i                         (rst0),     
   
      .mcb_cmd_en_i                  (p0_mcb_cmd_en),   
      .mcb_cmd_instr_i               (p0_mcb_cmd_instr),
      .mcb_cmd_addr_i                (p0_mcb_cmd_addr), 
      .mcb_cmd_bl_i                  (p0_mcb_cmd_bl),  
      .mcb_wr_en_i                   (p0_mcb_wr_en), 
   
      .vio_modify_enable	     (vio_modify_enable),   
      .vio_data_mode_value           (vio_data_mode_value),  
      .vio_addr_mode_value           (vio_addr_mode_value),
      .vio_bl_mode_value             (2'b10),  
      .vio_fixed_bl_value            (6'd64),  
      .mcb_init_done_i               (calib_done),
      .cmp_error                     (p0_error),
      .run_traffic_o                 (p0_tg_run_traffic),  
      .start_addr_o                  (p0_tg_start_addr),
      .end_addr_o                    (p0_tg_end_addr), 
      .cmd_seed_o                    (p0_tg_cmd_seed),  
      .data_seed_o                   (p0_tg_data_seed), 
      .load_seed_o                   (p0_tg_load_seed), 
      .addr_mode_o                   (p0_tg_addr_mode), 
      .instr_mode_o                  (p0_tg_instr_mode), 
      .bl_mode_o                     (p0_tg_bl_mode), 
      .data_mode_o                   (p0_tg_data_mode), 
      .mode_load_o                   (p0_tg_mode_load), 
      .fixed_bl_o                    (p0_tg_fixed_bl), 
      .fixed_instr_o                 (p0_tg_fixed_instr), 
      .fixed_addr_o                  (p0_tg_fixed_addr) 
     );
   
   
   mcb_traffic_gen #
     (  
      .MEM_BURST_LEN                 (C_MEM_BURST_LEN),  
      .MEM_COL_WIDTH                 (C_MEM_NUM_COL_BITS),  
      .NUM_DQ_PINS                   (C_NUM_DQ_PINS), 
      .DQ_ERROR_WIDTH                (DQ_ERROR_WIDTH),  
      .PORT_MODE                     (C_P0_PORT_MODE),     
      .DWIDTH                        (C_P0_DATA_PORT_SIZE),
      .CMP_DATA_PIPE_STAGES          (CMP_DATA_PIPE_STAGES),   
      .FAMILY                        (FAMILY),    
      .SIMULATION                    ("FALSE"),   
      .DATA_PATTERN                  (TG_DATA_PATTERN),  
      .CMD_PATTERN                   ("CGEN_ALL"),  
      .ADDR_WIDTH                    (30),  
      .PRBS_SADDR_MASK_POS           (C_p0_PRBS_SADDR_MASK_POS), 
      .PRBS_EADDR_MASK_POS           (C_p0_PRBS_EADDR_MASK_POS),
      .PRBS_SADDR                    (C_p0_BEGIN_ADDRESS), 
      .PRBS_EADDR                    (C_p0_END_ADDRESS)
     )  
   m_traffic_gen_p0 
     (  
      .clk_i                         (clk0),     
      .rst_i                         (rst0),     
      .run_traffic_i                 (p0_tg_run_traffic),                  
      .manual_clear_error            (rst0),     
      
      .start_addr_i                  (p0_tg_start_addr),                  
      .end_addr_i                    (p0_tg_end_addr),                  
      .cmd_seed_i                    (p0_tg_cmd_seed),                  
      .data_seed_i                   (p0_tg_data_seed),                  
      .load_seed_i                   (p0_tg_load_seed),                
      .addr_mode_i                   (p0_tg_addr_mode),                
      .instr_mode_i                  (p0_tg_instr_mode),                  
      .bl_mode_i                     (p0_tg_bl_mode),                  
      .data_mode_i                   (p0_tg_data_mode),                  
      .mode_load_i                   (p0_tg_mode_load),                  
      
      .fixed_bl_i                    (p0_tg_fixed_bl),                     
      .fixed_instr_i                 (p0_tg_fixed_instr),                     
      .fixed_addr_i                  (p0_tg_fixed_addr),                 
      .fixed_data_i                  (), 
      
      .bram_cmd_i                    (), 
      .bram_valid_i                  (), 
      .bram_rdy_o                    (),  
      
      
      .mcb_cmd_en_o		     (p0_mcb_cmd_en),                 
      .mcb_cmd_instr_o		     (p0_mcb_cmd_instr),                    
      .mcb_cmd_bl_o		     (p0_mcb_cmd_bl),                 
      .mcb_cmd_addr_o		     (p0_mcb_cmd_addr),                   
      .mcb_cmd_full_i		     (p0_mcb_cmd_full),                   
   
      .mcb_wr_en_o		     (p0_mcb_wr_en),                
      .mcb_wr_mask_o		     (p0_mcb_wr_mask),                  
      .mcb_wr_data_o		     (p0_mcb_wr_data),                 
      .mcb_wr_data_end_o             (), 
      .mcb_wr_full_i		     (p0_mcb_wr_full),                  
      .mcb_wr_fifo_counts	     (p0_mcb_wr_fifo_counts),                       
   
      .mcb_rd_en_o		     (p0_mcb_rd_en),                
      .mcb_rd_data_i		     (p0_mcb_rd_data),                  
      .mcb_rd_empty_i		     (p0_mcb_rd_empty),                   
      .mcb_rd_fifo_counts	     (p0_mcb_rd_fifo_counts),                       
   
      
      .counts_rst                    (rst0),     
      .wr_data_counts                (), 
      .rd_data_counts                (), 
      .error                         (p0_error),  
      .error_status                  (p0_error_status),  
      .cmp_data                      (p0_cmp_data),            
      .cmp_data_valid                (p0_cmp_data_valid),                  
      .cmp_error                     (p0_cmp_error),             
      .mem_rd_data                   (), 
      .dq_error_bytelane_cmp         (), 
      .cumlative_dq_lane_error       ()
     );
   end     
   else begin: PORT0_NO_TG
      assign p0_error          = 'b0;
      assign p0_error_status   = 'b0;
      assign p0_cmp_data       = 'b0;
      assign p0_cmp_data_valid = 'b0;
      assign p0_cmp_error      = 'b0;
   end   
endgenerate