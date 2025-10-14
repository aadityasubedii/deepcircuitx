  generate
    if (REF_CLK_MMCM_IODELAY_CTRL == "TRUE") begin: clk_ref_mmcm_gen

      MMCME2_ADV
      #(.BANDWIDTH            ("HIGH"),
        .CLKOUT4_CASCADE      ("FALSE"),
        .COMPENSATION         ("INTERNAL"),
        .STARTUP_WAIT         ("FALSE"),
        .DIVCLK_DIVIDE        (1),
        .CLKFBOUT_MULT_F      (6),
        .CLKFBOUT_PHASE       (0.000),
        .CLKFBOUT_USE_FINE_PS ("FALSE"),
        .CLKOUT0_DIVIDE_F     (4),
        .CLKOUT0_PHASE        (0.000),
        .CLKOUT0_DUTY_CYCLE   (0.500),
        .CLKOUT0_USE_FINE_PS  ("FALSE"),
        .CLKOUT1_DIVIDE       (3),
        .CLKOUT1_PHASE        (0.000),
        .CLKOUT1_DUTY_CYCLE   (0.500),
        .CLKOUT1_USE_FINE_PS  ("FALSE"),
        .CLKIN1_PERIOD        (5),
        .REF_JITTER1          (0.000))
      mmcm_i
        
       (.CLKFBOUT            (mmcm_clkfbout),
        .CLKFBOUTB           (),
        .CLKOUT0             (clk_ref_mmcm_300),
        .CLKOUT0B            (),
        .CLKOUT1             (clk_ref_mmcm_400),
        .CLKOUT1B            (),
        .CLKOUT2             (),
        .CLKOUT2B            (),
        .CLKOUT3             (),
        .CLKOUT3B            (),
        .CLKOUT4             (),
        .CLKOUT5             (),
        .CLKOUT6             (),
         
        .CLKFBIN             (mmcm_clkfbout),
        .CLKIN1              (clk_ref_ibufg),
        .CLKIN2              (1'b0),
         
        .CLKINSEL            (1'b1),
        
        .DADDR               (7'h0),
        .DCLK                (1'b0),
        .DEN                 (1'b0),
        .DI                  (16'h0),
        .DO                  (),
        .DRDY                (),
        .DWE                 (1'b0),
        
        .PSCLK               (1'b0),
        .PSEN                (1'b0),
        .PSINCDEC            (1'b0),
        .PSDONE              (),
        
        .LOCKED              (mmcm_Locked),
        .CLKINSTOPPED        (),
        .CLKFBSTOPPED        (),
        .PWRDWN              (1'b0),
        .RST                 (sys_rst_act_hi));
    end
  endgenerate