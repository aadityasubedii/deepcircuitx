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