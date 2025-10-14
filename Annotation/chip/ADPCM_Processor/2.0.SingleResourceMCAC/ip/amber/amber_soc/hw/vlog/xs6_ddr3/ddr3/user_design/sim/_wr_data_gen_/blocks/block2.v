generate
if (FAMILY == "SPARTAN6")  begin : SP6_WDGEN

sp6_data_gen #
 
( 
   .TCQ             (TCQ),
   .ADDR_WIDTH      (32 ),
   
   .BL_WIDTH        (BL_WIDTH       ),
   .DWIDTH          (DWIDTH       ),
   .DATA_PATTERN    (DATA_PATTERN  ),
   .NUM_DQ_PINS      (NUM_DQ_PINS  ),
   .COLUMN_WIDTH     (COLUMN_WIDTH)
   
 )
 sp6_data_gen
 (
   .clk_i              (clk_i         ),        
   .rst_i              (rst_i[1]         ), 
   .data_rdy_i         (data_rdy_i    ),
   .prbs_fseed_i       (prbs_fseed_i),
   
   .data_mode_i        (data_mode_i   ),  
   .cmd_startA         (cmd_start    ),  
   .cmd_startB         (cmd_startB    ),   
   .cmd_startC         (cmd_startC    ),   
   .cmd_startD         (cmd_startD    ),   
   .cmd_startE         (cmd_startE    ),   
   .fixed_data_i         (fixed_data_i),
   
   .addr_i             (addr_i        ),       
   .user_burst_cnt     (user_burst_cnt),
   .fifo_rdy_i         (fifo_not_full    ),   
   .data_o             (data_o        )  
  );
end


endgenerate