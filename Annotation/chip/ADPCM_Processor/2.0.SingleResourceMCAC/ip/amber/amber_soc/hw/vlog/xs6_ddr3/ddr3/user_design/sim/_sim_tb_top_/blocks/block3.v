);      







      memc_tb_top #
      (
         .C_SIMULATION                   (C3_SIMULATION),
         .C_NUM_DQ_PINS                  (C3_NUM_DQ_PINS),
         .C_MEM_BURST_LEN                (C3_MEM_BURST_LEN),
         .C_MEM_NUM_COL_BITS             (C3_MEM_NUM_COL_BITS),
         .C_SMALL_DEVICE                 (C3_SMALL_DEVICE),

         
	 
	 
         .C_PORT_ENABLE                  (C3_PORT_ENABLE),
   	     .C_P0_MASK_SIZE                 (C3_P0_MASK_SIZE),
         .C_P0_DATA_PORT_SIZE            (C3_P0_DATA_PORT_SIZE),
         .C_P1_MASK_SIZE                 (C3_P1_MASK_SIZE),
         .C_P1_DATA_PORT_SIZE            (C3_P1_DATA_PORT_SIZE),
         .C_P0_PORT_MODE                 (C3_P0_PORT_MODE),  
         .C_P1_PORT_MODE                 (C3_P1_PORT_MODE),  
         .C_P2_PORT_MODE                 (C3_P2_PORT_MODE),  
         .C_P3_PORT_MODE                 (C3_P3_PORT_MODE),
         .C_P4_PORT_MODE                 (C3_P4_PORT_MODE),
         .C_P5_PORT_MODE                 (C3_P5_PORT_MODE),

         .C_p0_BEGIN_ADDRESS             (C3_p0_BEGIN_ADDRESS),
         .C_p0_DATA_MODE                 (C3_p0_DATA_MODE),
         .C_p0_END_ADDRESS               (C3_p0_END_ADDRESS),
         .C_p0_PRBS_EADDR_MASK_POS       (C3_p0_PRBS_EADDR_MASK_POS),
         .C_p0_PRBS_SADDR_MASK_POS       (C3_p0_PRBS_SADDR_MASK_POS),
         .C_p1_BEGIN_ADDRESS             (C3_p1_BEGIN_ADDRESS),
         .C_p1_DATA_MODE                 (C3_p1_DATA_MODE),
         .C_p1_END_ADDRESS               (C3_p1_END_ADDRESS),
         .C_p1_PRBS_EADDR_MASK_POS       (C3_p1_PRBS_EADDR_MASK_POS),
         .C_p1_PRBS_SADDR_MASK_POS       (C3_p1_PRBS_SADDR_MASK_POS),
         .C_p2_BEGIN_ADDRESS             (C3_p2_BEGIN_ADDRESS),
         .C_p2_DATA_MODE                 (C3_p2_DATA_MODE),
         .C_p2_END_ADDRESS               (C3_p2_END_ADDRESS),
         .C_p2_PRBS_EADDR_MASK_POS       (C3_p2_PRBS_EADDR_MASK_POS),
         .C_p2_PRBS_SADDR_MASK_POS       (C3_p2_PRBS_SADDR_MASK_POS),
         .C_p3_BEGIN_ADDRESS             (C3_p3_BEGIN_ADDRESS),
         .C_p3_DATA_MODE                 (C3_p3_DATA_MODE),
         .C_p3_END_ADDRESS               (C3_p3_END_ADDRESS),
         .C_p3_PRBS_EADDR_MASK_POS       (C3_p3_PRBS_EADDR_MASK_POS),
         .C_p3_PRBS_SADDR_MASK_POS       (C3_p3_PRBS_SADDR_MASK_POS),
         .C_p4_BEGIN_ADDRESS             (C3_p4_BEGIN_ADDRESS),
         .C_p4_DATA_MODE                 (C3_p4_DATA_MODE),
         .C_p4_END_ADDRESS               (C3_p4_END_ADDRESS),
         .C_p4_PRBS_EADDR_MASK_POS       (C3_p4_PRBS_EADDR_MASK_POS),
         .C_p4_PRBS_SADDR_MASK_POS       (C3_p4_PRBS_SADDR_MASK_POS),
         .C_p5_BEGIN_ADDRESS             (C3_p5_BEGIN_ADDRESS),
         .C_p5_DATA_MODE                 (C3_p5_DATA_MODE),
         .C_p5_END_ADDRESS               (C3_p5_END_ADDRESS),
         .C_p5_PRBS_EADDR_MASK_POS       (C3_p5_PRBS_EADDR_MASK_POS),
         .C_p5_PRBS_SADDR_MASK_POS       (C3_p5_PRBS_SADDR_MASK_POS)
         )
      memc3_tb_top_inst
      (
         .error			                 (c3_error),
         .calib_done			         (c3_calib_done), 
         .clk0			                 (c3_clk0),
         .rst0			                 (c3_rst0),
         .cmp_error			             (c3_cmp_error),
         .cmp_data_valid  	             (c3_cmp_data_valid),
         .cmp_data			             (c3_cmp_data),
         .vio_modify_enable              (c3_vio_modify_enable),
         .vio_data_mode_value            (c3_vio_data_mode_value),
         .vio_addr_mode_value            (c3_vio_addr_mode_value),
         .p0_error_status	             (c3_p0_error_status),
         .p1_error_status	             (c3_p1_error_status),
         .p2_error_status	             (c3_p2_error_status),
         .p3_error_status	             (c3_p3_error_status),
         .p4_error_status	             (c3_p4_error_status),
         .p5_error_status	             (c3_p5_error_status),

	 
	 
	 
	 

         
         
         .p0_mcb_cmd_en                  (c3_p0_cmd_en),
         .p0_mcb_cmd_instr               (c3_p0_cmd_instr),
         .p0_mcb_cmd_bl                  (c3_p0_cmd_bl),
         .p0_mcb_cmd_addr                (c3_p0_cmd_byte_addr),
         .p0_mcb_cmd_full                (c3_p0_cmd_full),
         
         
         .p0_mcb_wr_en                   (c3_p0_wr_en),
         .p0_mcb_wr_mask                 (c3_p0_wr_mask),
         .p0_mcb_wr_data                 (c3_p0_wr_data),
         .p0_mcb_wr_full                 (c3_p0_wr_full),
         .p0_mcb_wr_fifo_counts          (c3_p0_wr_count),
         
         
         .p0_mcb_rd_en                   (c3_p0_rd_en),
         .p0_mcb_rd_data                 (c3_p0_rd_data),
         .p0_mcb_rd_empty                (c3_p0_rd_empty),
         .p0_mcb_rd_fifo_counts          (c3_p0_rd_count),

         
         
         .p1_mcb_cmd_en                  (c3_p1_cmd_en),
         .p1_mcb_cmd_instr               (c3_p1_cmd_instr),
         .p1_mcb_cmd_bl                  (c3_p1_cmd_bl),
         .p1_mcb_cmd_addr                (c3_p1_cmd_byte_addr),
         .p1_mcb_cmd_full                (c3_p1_cmd_full),
         
         
         .p1_mcb_wr_en                   (c3_p1_wr_en),
         .p1_mcb_wr_mask                 (c3_p1_wr_mask),
         .p1_mcb_wr_data                 (c3_p1_wr_data),
         .p1_mcb_wr_full                 (c3_p1_wr_full),
         .p1_mcb_wr_fifo_counts          (c3_p1_wr_count),
         
         
         .p1_mcb_rd_en                   (c3_p1_rd_en),
         .p1_mcb_rd_data                 (c3_p1_rd_data),
         .p1_mcb_rd_empty                (c3_p1_rd_empty),
         .p1_mcb_rd_fifo_counts          (c3_p1_rd_count),

         
         
         .p2_mcb_cmd_en                  (c3_p2_cmd_en),
         .p2_mcb_cmd_instr               (c3_p2_cmd_instr),
         .p2_mcb_cmd_bl                  (c3_p2_cmd_bl),
         .p2_mcb_cmd_addr                (c3_p2_cmd_byte_addr),
         .p2_mcb_cmd_full                (c3_p2_cmd_full),
         
         
         .p2_mcb_wr_en                   (c3_p2_wr_en),
         .p2_mcb_wr_mask                 (c3_p2_wr_mask),
         .p2_mcb_wr_data                 (c3_p2_wr_data),
         .p2_mcb_wr_full                 (c3_p2_wr_full),
         .p2_mcb_wr_fifo_counts          (c3_p2_wr_count),
         
         
         .p2_mcb_rd_en                   (c3_p2_rd_en),
         .p2_mcb_rd_data                 (c3_p2_rd_data),
         .p2_mcb_rd_empty                (c3_p2_rd_empty),
         .p2_mcb_rd_fifo_counts          (c3_p2_rd_count),

         
         
         .p3_mcb_cmd_en                  (c3_p3_cmd_en),
         .p3_mcb_cmd_instr               (c3_p3_cmd_instr),
         .p3_mcb_cmd_bl                  (c3_p3_cmd_bl),
         .p3_mcb_cmd_addr                (c3_p3_cmd_byte_addr),
         .p3_mcb_cmd_full                (c3_p3_cmd_full),
         
         
         .p3_mcb_wr_en                   (c3_p3_wr_en),
         .p3_mcb_wr_mask                 (c3_p3_wr_mask),
         .p3_mcb_wr_data                 (c3_p3_wr_data),
         .p3_mcb_wr_full                 (c3_p3_wr_full),
         .p3_mcb_wr_fifo_counts          (c3_p3_wr_count),
         
         
         .p3_mcb_rd_en                   (c3_p3_rd_en),
         .p3_mcb_rd_data                 (c3_p3_rd_data),
         .p3_mcb_rd_empty                (c3_p3_rd_empty),
         .p3_mcb_rd_fifo_counts          (c3_p3_rd_count),

         
         
         .p4_mcb_cmd_en                  (c3_p4_cmd_en),
         .p4_mcb_cmd_instr               (c3_p4_cmd_instr),
         .p4_mcb_cmd_bl                  (c3_p4_cmd_bl),
         .p4_mcb_cmd_addr                (c3_p4_cmd_byte_addr),
         .p4_mcb_cmd_full                (c3_p4_cmd_full),
         
         
         .p4_mcb_wr_en                   (c3_p4_wr_en),
         .p4_mcb_wr_mask                 (c3_p4_wr_mask),
         .p4_mcb_wr_data                 (c3_p4_wr_data),
         .p4_mcb_wr_full                 (c3_p4_wr_full),
         .p4_mcb_wr_fifo_counts          (c3_p4_wr_count),
         
         
         .p4_mcb_rd_en                   (c3_p4_rd_en),
         .p4_mcb_rd_data                 (c3_p4_rd_data),
         .p4_mcb_rd_empty                (c3_p4_rd_empty),
         .p4_mcb_rd_fifo_counts          (c3_p4_rd_count),

         
         
         .p5_mcb_cmd_en                  (c3_p5_cmd_en),
         .p5_mcb_cmd_instr               (c3_p5_cmd_instr),
         .p5_mcb_cmd_bl                  (c3_p5_cmd_bl),
         .p5_mcb_cmd_addr                (c3_p5_cmd_byte_addr),
         .p5_mcb_cmd_full                (c3_p5_cmd_full),
         
         
         .p5_mcb_wr_en                   (c3_p5_wr_en),
         .p5_mcb_wr_mask                 (c3_p5_wr_mask),
         .p5_mcb_wr_data                 (c3_p5_wr_data),
         .p5_mcb_wr_full                 (c3_p5_wr_full),
         .p5_mcb_wr_fifo_counts          (c3_p5_wr_count),
         
         
         .p5_mcb_rd_en                   (c3_p5_rd_en),
         .p5_mcb_rd_data                 (c3_p5_rd_data),
         .p5_mcb_rd_empty                (c3_p5_rd_empty),
         .p5_mcb_rd_fifo_counts          (c3_p5_rd_count)
        );