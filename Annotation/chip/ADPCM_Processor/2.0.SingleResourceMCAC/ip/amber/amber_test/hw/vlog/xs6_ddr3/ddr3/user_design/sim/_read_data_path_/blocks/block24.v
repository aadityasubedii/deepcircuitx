   assign cmd_rdy_o = cmd_rdy;
   read_posted_fifo #(
           .TCQ               (TCQ),
           .FAMILY    (FAMILY),
           .MEM_BURST_LEN (MEM_BURST_LEN),
           .ADDR_WIDTH(32),
           .BL_WIDTH(6)
           )
   read_postedfifo(
                    .clk_i              (clk_i),
                    .rst_i                (rst_i[0]),
                    .cmd_rdy_o          (cmd_rdy      ),
                    .cmd_valid_i        (cmd_valid_i    ),
                    .data_valid_i         (data_rdy        ),  
                    .addr_i             (addr_i         ),
                    .bl_i               (bl_i           ),
                    
                    .cmd_sent           (cmd_sent),
                    .bl_sent            (bl_sent ),
                    .cmd_en_i           (cmd_en_i),
                    
                    .user_bl_cnt_is_1   (user_bl_cnt_is_1),
                    .gen_rdy_i          (gen_rdy        ),
                    .gen_valid_o        (gen_valid      ),
                    .gen_addr_o         (gen_addr       ),
                    .gen_bl_o           (gen_bl         ),
                    .rd_buff_avail_o      (rd_buff_avail_o),
                    .rd_mdata_fifo_empty    (rd_mdata_fifo_empty),
                    .rd_mdata_en            (rd_mdata_en)
                    );