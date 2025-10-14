generate
if (FAMILY ==  "VIRTEX6")  begin : V6_WDGEN

v6_data_gen #                                 
 
(  
   .TCQ               (TCQ),
   .ADDR_WIDTH      (32 ),
   .BL_WIDTH        (BL_WIDTH       ),
   .DWIDTH          (DWIDTH       ),
   .MEM_BURST_LEN     (MEM_BURST_LEN),
   
   .DATA_PATTERN    (DATA_PATTERN  ),
   .NUM_DQ_PINS      (NUM_DQ_PINS  ),
   .SEL_VICTIM_LINE   (SEL_VICTIM_LINE),
   
   .COLUMN_WIDTH     (COLUMN_WIDTH),
    .EYE_TEST   (EYE_TEST)
   
 )                 
 v6_data_gen
 (
   .clk_i              (clk_i         ),        
   .rst_i              (rst_i[1]      ),
   .data_rdy_i         (data_rdy_i    ),
   .prbs_fseed_i       (prbs_fseed_i),
   
   .data_mode_i        (data_mode_i   ),  
   .cmd_startA         (cmd_start    ),  
   .cmd_startB         (cmd_startB    ),   
   .cmd_startC         (cmd_startC    ),   
   .cmd_startD         (cmd_startD    ),   
   .cmd_startE         (cmd_startE    ),   
   .m_addr_i           (addr_i),          
   .fixed_data_i         (fixed_data_i),

   .addr_i             (addr_i        ),       
   .user_burst_cnt     (user_burst_cnt),
   .fifo_rdy_i         (fifo_not_full    ),   
   .data_o             (data_o        )
  );
end