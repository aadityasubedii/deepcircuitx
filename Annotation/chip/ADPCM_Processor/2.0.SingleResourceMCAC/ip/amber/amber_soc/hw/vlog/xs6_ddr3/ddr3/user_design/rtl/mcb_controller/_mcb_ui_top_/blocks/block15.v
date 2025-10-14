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