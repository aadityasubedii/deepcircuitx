  generate
    if (REF_CLK_MMCM_IODELAY_CTRL == "TRUE") begin : clk_ref_300_400_en
      if(FPGA_SPEED_GRADE == 1) begin: clk_ref_300
        BUFG u_bufg_clk_ref_300
          (
           .O (clk_ref[1]),
           .I (clk_ref_mmcm_300)
           );
      end else if (FPGA_SPEED_GRADE == 2 || FPGA_SPEED_GRADE == 3) begin: clk_ref_400
        BUFG u_bufg_clk_ref_400
          (
           .O (clk_ref[1]),
           .I (clk_ref_mmcm_400)
           );
      end
    end
  endgenerate