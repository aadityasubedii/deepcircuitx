    else begin : P1_UI_AXI
      assign  p1_arb_en_i        =  p1_arb_en;
      assign  s1_axi_araddr_i    = s1_axi_araddr & P_S1_AXI_ADDRMASK;
      assign  s1_axi_awaddr_i    = s1_axi_awaddr & P_S1_AXI_ADDRMASK;
      wire                     calib_done_synch;

      mcb_ui_top_synch #(
        .C_SYNCH_WIDTH          ( 1 )
      )
      axi_mcb_synch
      (
        .clk                    ( s1_axi_aclk      ),
        .synch_in               ( uo_done_cal      ),
        .synch_out              ( calib_done_synch )
      );
      axi_mcb #
        (
        .C_FAMILY                ( "spartan6"               ) ,
        .C_S_AXI_ID_WIDTH        ( C_S1_AXI_ID_WIDTH        ) ,
        .C_S_AXI_ADDR_WIDTH      ( C_S1_AXI_ADDR_WIDTH      ) ,
        .C_S_AXI_DATA_WIDTH      ( C_S1_AXI_DATA_WIDTH      ) ,
        .C_S_AXI_SUPPORTS_READ   ( C_S1_AXI_SUPPORTS_READ   ) ,
        .C_S_AXI_SUPPORTS_WRITE  ( C_S1_AXI_SUPPORTS_WRITE  ) ,
        .C_S_AXI_REG_EN0         ( C_S1_AXI_REG_EN0         ) ,
        .C_S_AXI_REG_EN1         ( C_S1_AXI_REG_EN1         ) ,
        .C_S_AXI_SUPPORTS_NARROW_BURST ( C_S1_AXI_SUPPORTS_NARROW_BURST ) ,
        .C_MCB_ADDR_WIDTH        ( 30                       ) ,
        .C_MCB_DATA_WIDTH        ( C_P1_DATA_PORT_SIZE      ) ,
        .C_STRICT_COHERENCY      ( C_S1_AXI_STRICT_COHERENCY    ) ,
        .C_ENABLE_AP             ( C_S1_AXI_ENABLE_AP           )
        )
        p1_axi_mcb
        (
        .aclk              ( s1_axi_aclk        ),
        .aresetn           ( s1_axi_aresetn     ),
        .s_axi_awid        ( s1_axi_awid        ),
        .s_axi_awaddr      ( s1_axi_awaddr_i    ),
        .s_axi_awlen       ( s1_axi_awlen       ),
        .s_axi_awsize      ( s1_axi_awsize      ),
        .s_axi_awburst     ( s1_axi_awburst     ),
        .s_axi_awlock      ( s1_axi_awlock      ),
        .s_axi_awcache     ( s1_axi_awcache     ),
        .s_axi_awprot      ( s1_axi_awprot      ),
        .s_axi_awqos       ( s1_axi_awqos       ),
        .s_axi_awvalid     ( s1_axi_awvalid     ),
        .s_axi_awready     ( s1_axi_awready     ),
        .s_axi_wdata       ( s1_axi_wdata       ),
        .s_axi_wstrb       ( s1_axi_wstrb       ),
        .s_axi_wlast       ( s1_axi_wlast       ),
        .s_axi_wvalid      ( s1_axi_wvalid      ),
        .s_axi_wready      ( s1_axi_wready      ),
        .s_axi_bid         ( s1_axi_bid         ),
        .s_axi_bresp       ( s1_axi_bresp       ),
        .s_axi_bvalid      ( s1_axi_bvalid      ),
        .s_axi_bready      ( s1_axi_bready      ),
        .s_axi_arid        ( s1_axi_arid        ),
        .s_axi_araddr      ( s1_axi_araddr_i    ),
        .s_axi_arlen       ( s1_axi_arlen       ),
        .s_axi_arsize      ( s1_axi_arsize      ),
        .s_axi_arburst     ( s1_axi_arburst     ),
        .s_axi_arlock      ( s1_axi_arlock      ),
        .s_axi_arcache     ( s1_axi_arcache     ),
        .s_axi_arprot      ( s1_axi_arprot      ),
        .s_axi_arqos       ( s1_axi_arqos       ),
        .s_axi_arvalid     ( s1_axi_arvalid     ),
        .s_axi_arready     ( s1_axi_arready     ),
        .s_axi_rid         ( s1_axi_rid         ),
        .s_axi_rdata       ( s1_axi_rdata       ),
        .s_axi_rresp       ( s1_axi_rresp       ),
        .s_axi_rlast       ( s1_axi_rlast       ),
        .s_axi_rvalid      ( s1_axi_rvalid      ),
        .s_axi_rready      ( s1_axi_rready      ),
        .mcb_cmd_clk       ( p1_cmd_clk_i       ),
        .mcb_cmd_en        ( p1_cmd_en_i        ),
        .mcb_cmd_instr     ( p1_cmd_instr_i     ),
        .mcb_cmd_bl        ( p1_cmd_bl_i        ),
        .mcb_cmd_byte_addr ( p1_cmd_byte_addr_i ),
        .mcb_cmd_empty     ( p1_cmd_empty_i     ),
        .mcb_cmd_full      ( p1_cmd_full_i      ),
        .mcb_wr_clk        ( p1_wr_clk_i        ),
        .mcb_wr_en         ( p1_wr_en_i         ),
        .mcb_wr_mask       ( p1_wr_mask_i       ),
        .mcb_wr_data       ( p1_wr_data_i       ),
        .mcb_wr_full       ( p1_wr_full_i       ),
        .mcb_wr_empty      ( p1_wr_empty_i      ),
        .mcb_wr_count      ( p1_wr_count_i      ),
        .mcb_wr_underrun   ( p1_wr_underrun_i   ),
        .mcb_wr_error      ( p1_wr_error_i      ),
        .mcb_rd_clk        ( p1_rd_clk_i        ),
        .mcb_rd_en         ( p1_rd_en_i         ),
        .mcb_rd_data       ( p1_rd_data_i       ),
        .mcb_rd_full       ( p1_rd_full_i       ),
        .mcb_rd_empty      ( p1_rd_empty_i      ),
        .mcb_rd_count      ( p1_rd_count_i      ),
        .mcb_rd_overflow   ( p1_rd_overflow_i   ),
        .mcb_rd_error      ( p1_rd_error_i      ),
        .mcb_calib_done    ( calib_done_synch   )
        );
    end