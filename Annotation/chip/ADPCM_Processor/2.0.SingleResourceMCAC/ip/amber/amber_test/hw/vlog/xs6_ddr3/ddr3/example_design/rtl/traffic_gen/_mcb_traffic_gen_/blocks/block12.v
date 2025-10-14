   mcb_flow_control #
     (
       .TCQ           (TCQ),
       .FAMILY  (FAMILY)
       
     )
   mcb_control
     (
      .clk_i            (clk_i),
      .rst_i            (rst_ra),

      .cmd_rdy_o        (flow2cmd_rdy),
      .cmd_valid_i      (cmd2flow_valid),
      .cmd_i            (cmd2flow_cmd),
      .addr_i           (cmd2flow_addr),
      .bl_i             (cmd2flow_bl),
      
      .mcb_cmd_full        (cmd_full),

      .cmd_o                 (mcb_cmd_instr_o),
      .addr_o                (addr_o),
      .bl_o                  (mcb_cmd_bl_o),
      .cmd_en_o              (mcb_cmd_en_o),
   

      .last_word_wr_i         (last_word_wr),
      .wdp_rdy_i            (wr_rdy),
      .wdp_valid_o          (wr_valid),
      .wdp_validB_o         (wr_validB),
      .wdp_validC_o         (wr_validC),

      .wr_addr_o            (wr_addr),
      .wr_bl_o              (wr_bl),
   

      .last_word_rd_i         (last_word_rd),
      .rdp_rdy_i            (rd_rdy),
      .rdp_valid_o           (rd_valid),
      .rd_addr_o            (rd_addr),
      .rd_bl_o              (rd_bl)

      );