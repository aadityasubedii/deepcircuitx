  generate
    if (C_S4_AXI_ENABLE == 0) begin : P4_UI_MCB
      assign  p4_arb_en_i        =  p4_arb_en        ; 
      assign  p4_cmd_clk_i       =  p4_cmd_clk       ; 
      assign  p4_cmd_en_i        =  p4_cmd_en        ; 
      assign  p4_cmd_instr_i     =  p4_cmd_instr     ; 
      assign  p4_cmd_bl_i        =  p4_cmd_bl        ; 
      assign  p4_cmd_byte_addr_i =  p4_cmd_byte_addr ; 
      assign  p4_cmd_empty       =  p4_cmd_empty_i   ; 
      assign  p4_cmd_full        =  p4_cmd_full_i    ; 
      assign  p4_wr_clk_i        =  p4_wr_clk        ; 
      assign  p4_wr_en_i         =  p4_wr_en         ; 
      assign  p4_wr_mask_i       =  p4_wr_mask       ; 
      assign  p4_wr_data_i       =  p4_wr_data       ; 
      assign  p4_wr_full         =  p4_wr_full_i     ; 
      assign  p4_wr_empty        =  p4_wr_empty_i    ; 
      assign  p4_wr_count        =  p4_wr_count_i    ; 
      assign  p4_wr_underrun     =  p4_wr_underrun_i ; 
      assign  p4_wr_error        =  p4_wr_error_i    ; 
      assign  p4_rd_clk_i        =  p4_rd_clk        ; 
      assign  p4_rd_en_i         =  p4_rd_en         ; 
      assign  p4_rd_data         =  p4_rd_data_i     ; 
      assign  p4_rd_full         =  p4_rd_full_i     ; 
      assign  p4_rd_empty        =  p4_rd_empty_i    ; 
      assign  p4_rd_count        =  p4_rd_count_i    ; 
      assign  p4_rd_overflow     =  p4_rd_overflow_i ; 
      assign  p4_rd_error        =  p4_rd_error_i    ; 
    end
    else begin : P4_UI_AXI
      assign  p4_arb_en_i        =  p4_arb_en;
      assign  s4_axi_araddr_i    = s4_axi_araddr & P_S4_AXI_ADDRMASK;
      assign  s4_axi_awaddr_i    = s4_axi_awaddr & P_S4_AXI_ADDRMASK;
      wire                     calib_done_synch;

      mcb_ui_top_synch #(
        .C_SYNCH_WIDTH          ( 1 )
      )
      axi_mcb_synch
      (
        .clk                    ( s4_axi_aclk      ),
        .synch_in               ( uo_done_cal      ),
        .synch_out              ( calib_done_synch )
      );

      axi_mcb #
        (
        .C_FAMILY                ( "spartan6"               ) ,
        .C_S_AXI_ID_WIDTH        ( C_S4_AXI_ID_WIDTH        ) ,
        .C_S_AXI_ADDR_WIDTH      ( C_S4_AXI_ADDR_WIDTH      ) ,
        .C_S_AXI_DATA_WIDTH      ( 32                       ) ,
        .C_S_AXI_SUPPORTS_READ   ( C_S4_AXI_SUPPORTS_READ   ) ,
        .C_S_AXI_SUPPORTS_WRITE  ( C_S4_AXI_SUPPORTS_WRITE  ) ,
        .C_S_AXI_REG_EN0         ( C_S4_AXI_REG_EN0         ) ,
        .C_S_AXI_REG_EN1         ( C_S4_AXI_REG_EN1         ) ,
        .C_S_AXI_SUPPORTS_NARROW_BURST ( C_S4_AXI_SUPPORTS_NARROW_BURST ) ,
        .C_MCB_ADDR_WIDTH        ( 30                       ) ,
        .C_MCB_DATA_WIDTH        ( 32                       ) ,
        .C_STRICT_COHERENCY      ( C_S4_AXI_STRICT_COHERENCY    ) ,
        .C_ENABLE_AP             ( C_S4_AXI_ENABLE_AP           )
        )
        p4_axi_mcb
        (
        .aclk              ( s4_axi_aclk        ),
        .aresetn           ( s4_axi_aresetn     ),
        .s_axi_awid        ( s4_axi_awid        ),
        .s_axi_awaddr      ( s4_axi_awaddr_i    ),
        .s_axi_awlen       ( s4_axi_awlen       ),
        .s_axi_awsize      ( s4_axi_awsize      ),
        .s_axi_awburst     ( s4_axi_awburst     ),
        .s_axi_awlock      ( s4_axi_awlock      ),
        .s_axi_awcache     ( s4_axi_awcache     ),
        .s_axi_awprot      ( s4_axi_awprot      ),
        .s_axi_awqos       ( s4_axi_awqos       ),
        .s_axi_awvalid     ( s4_axi_awvalid     ),
        .s_axi_awready     ( s4_axi_awready     ),
        .s_axi_wdata       ( s4_axi_wdata       ),
        .s_axi_wstrb       ( s4_axi_wstrb       ),
        .s_axi_wlast       ( s4_axi_wlast       ),
        .s_axi_wvalid      ( s4_axi_wvalid      ),
        .s_axi_wready      ( s4_axi_wready      ),
        .s_axi_bid         ( s4_axi_bid         ),
        .s_axi_bresp       ( s4_axi_bresp       ),
        .s_axi_bvalid      ( s4_axi_bvalid      ),
        .s_axi_bready      ( s4_axi_bready      ),
        .s_axi_arid        ( s4_axi_arid        ),
        .s_axi_araddr      ( s4_axi_araddr_i    ),
        .s_axi_arlen       ( s4_axi_arlen       ),
        .s_axi_arsize      ( s4_axi_arsize      ),
        .s_axi_arburst     ( s4_axi_arburst     ),
        .s_axi_arlock      ( s4_axi_arlock      ),
        .s_axi_arcache     ( s4_axi_arcache     ),
        .s_axi_arprot      ( s4_axi_arprot      ),
        .s_axi_arqos       ( s4_axi_arqos       ),
        .s_axi_arvalid     ( s4_axi_arvalid     ),
        .s_axi_arready     ( s4_axi_arready     ),
        .s_axi_rid         ( s4_axi_rid         ),
        .s_axi_rdata       ( s4_axi_rdata       ),
        .s_axi_rresp       ( s4_axi_rresp       ),
        .s_axi_rlast       ( s4_axi_rlast       ),
        .s_axi_rvalid      ( s4_axi_rvalid      ),
        .s_axi_rready      ( s4_axi_rready      ),
        .mcb_cmd_clk       ( p4_cmd_clk_i       ),
        .mcb_cmd_en        ( p4_cmd_en_i        ),
        .mcb_cmd_instr     ( p4_cmd_instr_i     ),
        .mcb_cmd_bl        ( p4_cmd_bl_i        ),
        .mcb_cmd_byte_addr ( p4_cmd_byte_addr_i ),
        .mcb_cmd_empty     ( p4_cmd_empty_i     ),
        .mcb_cmd_full      ( p4_cmd_full_i      ),
        .mcb_wr_clk        ( p4_wr_clk_i        ),
        .mcb_wr_en         ( p4_wr_en_i         ),
        .mcb_wr_mask       ( p4_wr_mask_i       ),
        .mcb_wr_data       ( p4_wr_data_i       ),
        .mcb_wr_full       ( p4_wr_full_i       ),
        .mcb_wr_empty      ( p4_wr_empty_i      ),
        .mcb_wr_count      ( p4_wr_count_i      ),
        .mcb_wr_underrun   ( p4_wr_underrun_i   ),
        .mcb_wr_error      ( p4_wr_error_i      ),
        .mcb_rd_clk        ( p4_rd_clk_i        ),
        .mcb_rd_en         ( p4_rd_en_i         ),
        .mcb_rd_data       ( p4_rd_data_i       ),
        .mcb_rd_full       ( p4_rd_full_i       ),
        .mcb_rd_empty      ( p4_rd_empty_i      ),
        .mcb_rd_count      ( p4_rd_count_i      ),
        .mcb_rd_overflow   ( p4_rd_overflow_i   ),
        .mcb_rd_error      ( p4_rd_error_i      ),
        .mcb_calib_done    ( calib_done_synch   )
        );
    end
  endgenerate