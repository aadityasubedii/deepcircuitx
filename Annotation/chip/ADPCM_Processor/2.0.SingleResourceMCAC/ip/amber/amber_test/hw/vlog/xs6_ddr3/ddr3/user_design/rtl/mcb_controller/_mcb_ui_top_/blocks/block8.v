      assign  p3_rd_data         =  p3_rd_data_i     ; 
      assign  p3_rd_full         =  p3_rd_full_i     ; 
      assign  p3_rd_empty        =  p3_rd_empty_i    ; 
      assign  p3_rd_count        =  p3_rd_count_i    ; 
      assign  p3_rd_overflow     =  p3_rd_overflow_i ; 
      assign  p3_rd_error        =  p3_rd_error_i    ; 
    end
    else begin : P3_UI_AXI
      assign  p3_arb_en_i        =  p3_arb_en;
      assign  s3_axi_araddr_i    = s3_axi_araddr & P_S3_AXI_ADDRMASK;
      assign  s3_axi_awaddr_i    = s3_axi_awaddr & P_S3_AXI_ADDRMASK;
      wire                     calib_done_synch;

      mcb_ui_top_synch #(
        .C_SYNCH_WIDTH          ( 1 )
      )
      axi_mcb_synch
      (
        .clk                    ( s3_axi_aclk      ),
        .synch_in               ( uo_done_cal      ),
        .synch_out              ( calib_done_synch )
      );

      axi_mcb #
        (
        .C_FAMILY                ( "spartan6"               ) ,
        .C_S_AXI_ID_WIDTH        ( C_S3_AXI_ID_WIDTH        ) ,
        .C_S_AXI_ADDR_WIDTH      ( C_S3_AXI_ADDR_WIDTH      ) ,
        .C_S_AXI_DATA_WIDTH      ( 32                       ) ,
        .C_S_AXI_SUPPORTS_READ   ( C_S3_AXI_SUPPORTS_READ   ) ,
        .C_S_AXI_SUPPORTS_WRITE  ( C_S3_AXI_SUPPORTS_WRITE  ) ,
        .C_S_AXI_REG_EN0         ( C_S3_AXI_REG_EN0         ) ,
        .C_S_AXI_REG_EN1         ( C_S3_AXI_REG_EN1         ) ,
        .C_S_AXI_SUPPORTS_NARROW_BURST ( C_S3_AXI_SUPPORTS_NARROW_BURST ) ,
        .C_MCB_ADDR_WIDTH        ( 30                       ) ,
        .C_MCB_DATA_WIDTH        ( 32                       ) ,
        .C_STRICT_COHERENCY      ( C_S3_AXI_STRICT_COHERENCY    ) ,
        .C_ENABLE_AP             ( C_S3_AXI_ENABLE_AP           )
        )
        p3_axi_mcb
        (
        .aclk              ( s3_axi_aclk        ),
        .aresetn           ( s3_axi_aresetn     ),
        .s_axi_awid        ( s3_axi_awid        ),
        .s_axi_awaddr      ( s3_axi_awaddr_i    ),
        .s_axi_awlen       ( s3_axi_awlen       ),
        .s_axi_awsize      ( s3_axi_awsize      ),
        .s_axi_awburst     ( s3_axi_awburst     ),
        .s_axi_awlock      ( s3_axi_awlock      ),
        .s_axi_awcache     ( s3_axi_awcache     ),
        .s_axi_awprot      ( s3_axi_awprot      ),
        .s_axi_awqos       ( s3_axi_awqos       ),
        .s_axi_awvalid     ( s3_axi_awvalid     ),
        .s_axi_awready     ( s3_axi_awready     ),
        .s_axi_wdata       ( s3_axi_wdata       ),
        .s_axi_wstrb       ( s3_axi_wstrb       ),
        .s_axi_wlast       ( s3_axi_wlast       ),
        .s_axi_wvalid      ( s3_axi_wvalid      ),
        .s_axi_wready      ( s3_axi_wready      ),
        .s_axi_bid         ( s3_axi_bid         ),
        .s_axi_bresp       ( s3_axi_bresp       ),
        .s_axi_bvalid      ( s3_axi_bvalid      ),
        .s_axi_bready      ( s3_axi_bready      ),
        .s_axi_arid        ( s3_axi_arid        ),
        .s_axi_araddr      ( s3_axi_araddr_i    ),
        .s_axi_arlen       ( s3_axi_arlen       ),
        .s_axi_arsize      ( s3_axi_arsize      ),
        .s_axi_arburst     ( s3_axi_arburst     ),
        .s_axi_arlock      ( s3_axi_arlock      ),
        .s_axi_arcache     ( s3_axi_arcache     ),
        .s_axi_arprot      ( s3_axi_arprot      ),
        .s_axi_arqos       ( s3_axi_arqos       ),
        .s_axi_arvalid     ( s3_axi_arvalid     ),
        .s_axi_arready     ( s3_axi_arready     ),
        .s_axi_rid         ( s3_axi_rid         ),
        .s_axi_rdata       ( s3_axi_rdata       ),
        .s_axi_rresp       ( s3_axi_rresp       ),
        .s_axi_rlast       ( s3_axi_rlast       ),
        .s_axi_rvalid      ( s3_axi_rvalid      ),
        .s_axi_rready      ( s3_axi_rready      ),
        .mcb_cmd_clk       ( p3_cmd_clk_i       ),
        .mcb_cmd_en        ( p3_cmd_en_i        ),
        .mcb_cmd_instr     ( p3_cmd_instr_i     ),
        .mcb_cmd_bl        ( p3_cmd_bl_i        ),
        .mcb_cmd_byte_addr ( p3_cmd_byte_addr_i ),
        .mcb_cmd_empty     ( p3_cmd_empty_i     ),
        .mcb_cmd_full      ( p3_cmd_full_i      ),
        .mcb_wr_clk        ( p3_wr_clk_i        ),
        .mcb_wr_en         ( p3_wr_en_i         ),
        .mcb_wr_mask       ( p3_wr_mask_i       ),
        .mcb_wr_data       ( p3_wr_data_i       ),
        .mcb_wr_full       ( p3_wr_full_i       ),
        .mcb_wr_empty      ( p3_wr_empty_i      ),
        .mcb_wr_count      ( p3_wr_count_i      ),
        .mcb_wr_underrun   ( p3_wr_underrun_i   ),
        .mcb_wr_error      ( p3_wr_error_i      ),
        .mcb_rd_clk        ( p3_rd_clk_i        ),
        .mcb_rd_en         ( p3_rd_en_i         ),
        .mcb_rd_data       ( p3_rd_data_i       ),
        .mcb_rd_full       ( p3_rd_full_i       ),
        .mcb_rd_empty      ( p3_rd_empty_i      ),
        .mcb_rd_count      ( p3_rd_count_i      ),
        .mcb_rd_overflow   ( p3_rd_overflow_i   ),
        .mcb_rd_error      ( p3_rd_error_i      ),
        .mcb_calib_done    ( calib_done_synch   )