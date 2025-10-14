    if(IDELAY_FINEDELAY_USE == "TRUE") begin: idelay_finedelay_dq
      (* IODELAY_GROUP = IODELAY_GRP *)
        IDELAYE2_FINEDELAY #(   
         .CINVCTRL_SEL             ( IDELAYE2_CINVCTRL_SEL),
         .DELAY_SRC                ( IDELAYE2_DELAY_SRC),
         .HIGH_PERFORMANCE_MODE    ( IDELAYE2_HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE              ( IDELAYE2_IDELAY_TYPE),
         .IDELAY_VALUE             ( IDELAYE2_IDELAY_VALUE),
         .PIPE_SEL                 ( IDELAYE2_PIPE_SEL),
         .FINEDELAY                ( IDELAYE2_FINEDELAY_IN),
         .REFCLK_FREQUENCY         ( IDELAYE2_REFCLK_FREQUENCY ),
         .SIGNAL_PATTERN           ( IDELAYE2_SIGNAL_PATTERN)
         )
         idelaye2
         (
         .CNTVALUEOUT              (),
         .DATAOUT                  (data_in_dly[i]),
         .C                        (phy_clk), 
         .CE                       (idelay_ce),
         .CINVCTRL                 (),
         .CNTVALUEIN               (5'b00000), 
         .DATAIN                   (1'b0),
         .IDATAIN                  (data_in[i]),
         .IFDLY                    (fine_delay_r[i*3+:3]),
         .INC                      (idelay_inc),
         .LD                       (idelay_ld | idelay_ld_rst),
         .LDPIPEEN                 (1'b0),
         .REGRST                   (rst) 
     );
    end else begin : idelay_dq
      (* IODELAY_GROUP = IODELAY_GRP *)
        IDELAYE2 #(
         .CINVCTRL_SEL             ( IDELAYE2_CINVCTRL_SEL),
         .DELAY_SRC                ( IDELAYE2_DELAY_SRC),
         .HIGH_PERFORMANCE_MODE    ( IDELAYE2_HIGH_PERFORMANCE_MODE),
         .IDELAY_TYPE              ( IDELAYE2_IDELAY_TYPE),
         .IDELAY_VALUE             ( IDELAYE2_IDELAY_VALUE),
         .PIPE_SEL                 ( IDELAYE2_PIPE_SEL),
         .REFCLK_FREQUENCY         ( IDELAYE2_REFCLK_FREQUENCY ),
         .SIGNAL_PATTERN           ( IDELAYE2_SIGNAL_PATTERN)
         )
         idelaye2
         (
         .CNTVALUEOUT              (),
         .DATAOUT                  (data_in_dly[i]),
         .C                        (phy_clk), 
         .CE                       (idelay_ce),
         .CINVCTRL                 (),
         .CNTVALUEIN               (5'b00000), 
         .DATAIN                   (1'b0),
         .IDATAIN                  (data_in[i]),
         .INC                      (idelay_inc),
         .LD                       (idelay_ld | idelay_ld_rst),
         .LDPIPEEN                 (1'b0),
         .REGRST                   (rst) 
     );

     end