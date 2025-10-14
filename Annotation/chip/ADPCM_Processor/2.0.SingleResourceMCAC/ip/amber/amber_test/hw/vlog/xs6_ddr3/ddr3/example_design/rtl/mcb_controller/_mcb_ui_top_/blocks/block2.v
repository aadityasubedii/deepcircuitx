      assign  p5_arb_en_i        =  p5_arb_en;
      assign  s5_axi_araddr_i    = s5_axi_araddr & P_S5_AXI_ADDRMASK;
      assign  s5_axi_awaddr_i    = s5_axi_awaddr & P_S5_AXI_ADDRMASK;
      wire                     calib_done_synch;

      mcb_ui_top_synch #(
        .C_SYNCH_WIDTH          ( 1 )
      )
      axi_mcb_synch
      (
        .clk                    ( s5_axi_aclk      ),
        .synch_in               ( uo_done_cal      ),
        .synch_out              ( calib_done_synch )
      );

      axi_mcb #
        (
        .C_FAMILY                ( "spartan6"               ) ,
        .C_S_AXI_ID_WIDTH        ( C_S5_AXI_ID_WIDTH        ) ,
        .C_S_AXI_ADDR_WIDTH      ( C_S5_AXI_ADDR_WIDTH      ) ,
        .C_S_AXI_DATA_WIDTH      ( 32                       ) ,
        .C_S_AXI_SUPPORTS_READ   ( C_S5_AXI_SUPPORTS_READ   ) ,
        .C_S_AXI_SUPPORTS_WRITE  ( C_S5_AXI_SUPPORTS_WRITE  ) ,
        .C_S_AXI_REG_EN0         ( C_S5_AXI_REG_EN0         ) ,
        .C_S_AXI_REG_EN1         ( C_S5_AXI_REG_EN1         ) ,
        .C_S_AXI_SUPPORTS_NARROW_BURST ( C_S5_AXI_SUPPORTS_NARROW_BURST ) ,
        .C_MCB_ADDR_WIDTH        ( 30                       ) ,
        .C_MCB_DATA_WIDTH        ( 32                       ) ,
        .C_STRICT_COHERENCY      ( C_S5_AXI_STRICT_COHERENCY    ) ,
        .C_ENABLE_AP             ( C_S5_AXI_ENABLE_AP           )
        )
        p5_axi_mcb
        (
        .aclk              ( s5_axi_aclk        ),
        .aresetn           ( s5_axi_aresetn     ),
        .s_axi_awid        ( s5_axi_awid        ),
        .s_axi_awaddr      ( s5_axi_awaddr_i    ),
        .s_axi_awlen       ( s5_axi_awlen       ),
        .s_axi_awsize      ( s5_axi_awsize      ),
        .s_axi_awburst     ( s5_axi_awburst     ),
        .s_axi_awlock      ( s5_axi_awlock      ),
        .s_axi_awcache     ( s5_axi_awcache     ),
        .s_axi_awprot      ( s5_axi_awprot      ),
        .s_axi_awqos       ( s5_axi_awqos       ),
        .s_axi_awvalid     ( s5_axi_awvalid     ),
        .s_axi_awready     ( s5_axi_awready     ),
        .s_axi_wdata       ( s5_axi_wdata       ),
        .s_axi_wstrb       ( s5_axi_wstrb       ),
        .s_axi_wlast       ( s5_axi_wlast       ),
        .s_axi_wvalid      ( s5_axi_wvalid      ),
        .s_axi_wready      ( s5_axi_wready      ),
        .s_axi_bid         ( s5_axi_bid         ),
        .s_axi_bresp       ( s5_axi_bresp       ),
        .s_axi_bvalid      ( s5_axi_bvalid      ),
        .s_axi_bready      ( s5_axi_bready      ),
        .s_axi_arid        ( s5_axi_arid        ),
        .s_axi_araddr      ( s5_axi_araddr_i    ),
        .s_axi_arlen       ( s5_axi_arlen       ),
        .s_axi_arsize      ( s5_axi_arsize      ),
        .s_axi_arburst     ( s5_axi_arburst     ),
        .s_axi_arlock      ( s5_axi_arlock      ),
        .s_axi_arcache     ( s5_axi_arcache     ),
        .s_axi_arprot      ( s5_axi_arprot      ),
        .s_axi_arqos       ( s5_axi_arqos       ),
        .s_axi_arvalid     ( s5_axi_arvalid     ),
        .s_axi_arready     ( s5_axi_arready     ),
        .s_axi_rid         ( s5_axi_rid         ),
        .s_axi_rdata       ( s5_axi_rdata       ),
        .s_axi_rresp       ( s5_axi_rresp       ),
        .s_axi_rlast       ( s5_axi_rlast       ),
        .s_axi_rvalid      ( s5_axi_rvalid      ),
        .s_axi_rready      ( s5_axi_rready      ),
        .mcb_cmd_clk       ( p5_cmd_clk_i       ),
        .mcb_cmd_en        ( p5_cmd_en_i        ),
        .mcb_cmd_instr     ( p5_cmd_instr_i     ),
        .mcb_cmd_bl        ( p5_cmd_bl_i        ),
        .mcb_cmd_byte_addr ( p5_cmd_byte_addr_i ),
        .mcb_cmd_empty     ( p5_cmd_empty_i     ),
        .mcb_cmd_full      ( p5_cmd_full_i      ),
        .mcb_wr_clk        ( p5_wr_clk_i        ),
        .mcb_wr_en         ( p5_wr_en_i         ),
        .mcb_wr_mask       ( p5_wr_mask_i       ),
        .mcb_wr_data       ( p5_wr_data_i       ),
        .mcb_wr_full       ( p5_wr_full_i       ),
        .mcb_wr_empty      ( p5_wr_empty_i      ),
        .mcb_wr_count      ( p5_wr_count_i      ),
        .mcb_wr_underrun   ( p5_wr_underrun_i   ),
        .mcb_wr_error      ( p5_wr_error_i      ),
        .mcb_rd_clk        ( p5_rd_clk_i        ),
        .mcb_rd_en         ( p5_rd_en_i         ),
        .mcb_rd_data       ( p5_rd_data_i       ),
        .mcb_rd_full       ( p5_rd_full_i       ),
        .mcb_rd_empty      ( p5_rd_empty_i      ),
        .mcb_rd_count      ( p5_rd_count_i      ),
        .mcb_rd_overflow   ( p5_rd_overflow_i   ),
        .mcb_rd_error      ( p5_rd_error_i      ),