  generate
    if (UI_EXTRA_CLOCKS == "TRUE") begin: gen_ui_extra_clocks

      localparam MMCM_CLKOUT0_DIVIDE_CAL = (MMCM_CLKOUT0_EN == "TRUE") ? MMCM_CLKOUT0_DIVIDE : MMCM_MULT_F;
      localparam MMCM_CLKOUT1_DIVIDE_CAL = (MMCM_CLKOUT1_EN == "TRUE") ? MMCM_CLKOUT1_DIVIDE : MMCM_MULT_F;
      localparam MMCM_CLKOUT2_DIVIDE_CAL = (MMCM_CLKOUT2_EN == "TRUE") ? MMCM_CLKOUT2_DIVIDE : MMCM_MULT_F;
      localparam MMCM_CLKOUT3_DIVIDE_CAL = (MMCM_CLKOUT3_EN == "TRUE") ? MMCM_CLKOUT3_DIVIDE : MMCM_MULT_F;
      localparam MMCM_CLKOUT4_DIVIDE_CAL = (MMCM_CLKOUT4_EN == "TRUE") ? MMCM_CLKOUT4_DIVIDE : MMCM_MULT_F;

      MMCME2_ADV
      #(.BANDWIDTH            ("HIGH"),
        .CLKOUT4_CASCADE      ("FALSE"),
        .COMPENSATION         ("BUF_IN"),
        .STARTUP_WAIT         ("FALSE"),

        .DIVCLK_DIVIDE        (MMCM_DIVCLK_DIVIDE),
        .CLKFBOUT_MULT_F      (MMCM_MULT_F),
        .CLKFBOUT_PHASE       (0.000),
        .CLKFBOUT_USE_FINE_PS ("FALSE"),
        .CLKOUT0_DIVIDE_F     (MMCM_CLKOUT0_DIVIDE_CAL),
        .CLKOUT0_PHASE        (0.000),
        .CLKOUT0_DUTY_CYCLE   (0.500),
        .CLKOUT0_USE_FINE_PS  ("FALSE"),
        .CLKOUT1_DIVIDE       (MMCM_CLKOUT1_DIVIDE_CAL),
        .CLKOUT1_PHASE        (0.000),
        .CLKOUT1_DUTY_CYCLE   (0.500),
        .CLKOUT1_USE_FINE_PS  ("FALSE"),
        .CLKOUT2_DIVIDE       (MMCM_CLKOUT2_DIVIDE_CAL),
        .CLKOUT2_PHASE        (0.000),
        .CLKOUT2_DUTY_CYCLE   (0.500),
        .CLKOUT2_USE_FINE_PS  ("FALSE"),
        .CLKOUT3_DIVIDE       (MMCM_CLKOUT3_DIVIDE_CAL),
        .CLKOUT3_PHASE        (0.000),
        .CLKOUT3_DUTY_CYCLE   (0.500),
        .CLKOUT3_USE_FINE_PS  ("FALSE"),
        .CLKOUT4_DIVIDE       (MMCM_CLKOUT4_DIVIDE_CAL),
        .CLKOUT4_PHASE        (0.000),
        .CLKOUT4_DUTY_CYCLE   (0.500),
        .CLKOUT4_USE_FINE_PS  ("FALSE"),
        .CLKOUT5_DIVIDE       (((MMCM_MULT_F*2)/MMCM_DIVCLK_DIVIDE)),
        .CLKOUT5_PHASE        (0.000),
        .CLKOUT5_DUTY_CYCLE   (0.500),
        .CLKOUT5_USE_FINE_PS  ("TRUE"),
        .CLKOUT6_DIVIDE       (MMCM_MULT_F/2),
        .CLKOUT6_PHASE        (0.000),
        .CLKOUT6_DUTY_CYCLE   (0.500),
        .CLKOUT6_USE_FINE_PS  ("FALSE"),
        .CLKIN1_PERIOD        (CLKOUT3_PERIOD_NS),
        .REF_JITTER1          (0.000))
      mmcm_i
        
       (.CLKFBOUT            (clk_pll_i),
        .CLKFBOUTB           (),
        .CLKOUT0             (mmcm_clkout0),
        .CLKOUT0B            (),
        .CLKOUT1             (mmcm_clkout1),
        .CLKOUT1B            (),
        .CLKOUT2             (mmcm_clkout2),
        .CLKOUT2B            (),
        .CLKOUT3             (mmcm_clkout3),
        .CLKOUT3B            (),
        .CLKOUT4             (mmcm_clkout4),
        .CLKOUT5             (mmcm_ps_clk_bufg_in),
        .CLKOUT6             (clk_div2_bufg_in),
         
        .CLKFBIN             (clk_bufg),      
        .CLKIN1              (pll_clk3),      
        .CLKIN2              (1'b0),
         
        .CLKINSEL            (1'b1),
        
        .DADDR               (7'h0),
        .DCLK                (1'b0),
        .DEN                 (1'b0),
        .DI                  (16'h0),
        .DO                  (),
        .DRDY                (),
        .DWE                 (1'b0),
        
        .PSCLK               (clk),
        .PSEN                (psen),
        .PSINCDEC            (psincdec),
        .PSDONE              (psdone),
        
        .LOCKED              (MMCM_Locked_i),
        .CLKINSTOPPED        (),
        .CLKFBSTOPPED        (),
        .PWRDWN              (1'b0),
        .RST                 (~pll_locked_i));

      BUFG u_bufg_ui_addn_clk_0
        (
         .O (ui_addn_clk_0),
         .I (mmcm_clkout0)
         );

      BUFG u_bufg_ui_addn_clk_1
        (
         .O (ui_addn_clk_1),
         .I (mmcm_clkout1)
         );

      BUFG u_bufg_ui_addn_clk_2
        (
         .O (ui_addn_clk_2),
         .I (mmcm_clkout2)
         );

      BUFG u_bufg_ui_addn_clk_3
        (
         .O (ui_addn_clk_3),
         .I (mmcm_clkout3)
         );

      BUFG u_bufg_ui_addn_clk_4
        (
         .O (ui_addn_clk_4),
         .I (mmcm_clkout4)
         );

      BUFG u_bufg_mmcm_ps_clk
        (
         .O (mmcm_ps_clk),
         .I (mmcm_ps_clk_bufg_in)
         );
       
      BUFG u_bufg_clk_div2
        (
         .O (clk_div2),
         .I (clk_div2_bufg_in)
         );
    end else begin: gen_mmcm

      MMCME2_ADV
      #(.BANDWIDTH            ("HIGH"),
        .CLKOUT4_CASCADE      ("FALSE"),
        .COMPENSATION         ("BUF_IN"),
        .STARTUP_WAIT         ("FALSE"),

        .DIVCLK_DIVIDE        (MMCM_DIVCLK_DIVIDE),
        .CLKFBOUT_MULT_F      (MMCM_MULT_F),
        .CLKFBOUT_PHASE       (0.000),
        .CLKFBOUT_USE_FINE_PS ("FALSE"),
        .CLKOUT0_DIVIDE_F     (((MMCM_MULT_F*2)/MMCM_DIVCLK_DIVIDE)),
        .CLKOUT0_PHASE        (0.000),
        .CLKOUT0_DUTY_CYCLE   (0.500),
        .CLKOUT0_USE_FINE_PS  ("TRUE"),
        .CLKOUT1_DIVIDE       (MMCM_MULT_F/2),
        .CLKOUT1_PHASE        (0.000),
        .CLKOUT1_DUTY_CYCLE   (0.500),
        .CLKOUT1_USE_FINE_PS  ("FALSE"),
        .CLKIN1_PERIOD        (CLKOUT3_PERIOD_NS),
        .REF_JITTER1          (0.000))
      mmcm_i
        
       (.CLKFBOUT            (clk_pll_i),
        .CLKFBOUTB           (),
        .CLKOUT0             (mmcm_ps_clk_bufg_in),
        .CLKOUT0B            (),
        .CLKOUT1             (clk_div2_bufg_in),
        .CLKOUT1B            (),
        .CLKOUT2             (),
        .CLKOUT2B            (),
        .CLKOUT3             (),
        .CLKOUT3B            (),
        .CLKOUT4             (),
        .CLKOUT5             (),
        .CLKOUT6             (),
         
        .CLKFBIN             (clk_bufg),      
        .CLKIN1              (pll_clk3),      
        .CLKIN2              (1'b0),
         
        .CLKINSEL            (1'b1),
        
        .DADDR               (7'h0),
        .DCLK                (1'b0),
        .DEN                 (1'b0),
        .DI                  (16'h0),
        .DO                  (),
        .DRDY                (),
        .DWE                 (1'b0),
        
        .PSCLK               (clk),
        .PSEN                (psen),
        .PSINCDEC            (psincdec),
        .PSDONE              (psdone),
        
        .LOCKED              (MMCM_Locked_i),
        .CLKINSTOPPED        (),
        .CLKFBSTOPPED        (),
        .PWRDWN              (1'b0),
        .RST                 (~pll_locked_i));

    BUFG u_bufg_mmcm_ps_clk
    (
     .O (mmcm_ps_clk),
     .I (mmcm_ps_clk_bufg_in)
     );
	 
    BUFG u_bufg_clk_div2
    (
     .O (clk_div2),
     .I (clk_div2_bufg_in)
     );
	 
    end 
  endgenerate