generate

for ( i = 0; i != 10 && PO_DATA_CTL == "TRUE" ; i=i+1) begin : input_
  if ( BITLANES[i] && !BITLANES_OUTONLY[i]) begin  : iserdes_dq_

     ISERDESE2 #(
         .DATA_RATE                  ( ISERDES_DQ_DATA_RATE),
         .DATA_WIDTH                 ( ISERDES_DQ_DATA_WIDTH),
         .DYN_CLKDIV_INV_EN          ( ISERDES_DQ_DYN_CLKDIV_INV_EN),
         .DYN_CLK_INV_EN             ( ISERDES_DQ_DYN_CLK_INV_EN),
         .INIT_Q1                    ( ISERDES_DQ_INIT_Q1),
         .INIT_Q2                    ( ISERDES_DQ_INIT_Q2),
         .INIT_Q3                    ( ISERDES_DQ_INIT_Q3),
         .INIT_Q4                    ( ISERDES_DQ_INIT_Q4),
         .INTERFACE_TYPE             ( ISERDES_DQ_INTERFACE_TYPE),
         .NUM_CE                     ( ISERDES_NUM_CE),
         .IOBDELAY                   ( ISERDES_DQ_IOBDELAY),
         .OFB_USED                   ( ISERDES_DQ_OFB_USED),
         .SERDES_MODE                ( ISERDES_DQ_SERDES_MODE),
         .SRVAL_Q1                   ( ISERDES_DQ_SRVAL_Q1),
         .SRVAL_Q2                   ( ISERDES_DQ_SRVAL_Q2),
         .SRVAL_Q3                   ( ISERDES_DQ_SRVAL_Q3),
         .SRVAL_Q4                   ( ISERDES_DQ_SRVAL_Q4)
         )
         iserdesdq
         (
         .O                          (),
         .Q1                         (iserdes_dout[4*i + 3]),
         .Q2                         (iserdes_dout[4*i + 2]),
         .Q3                         (iserdes_dout[4*i + 1]),
         .Q4                         (iserdes_dout[4*i + 0]),
         .Q5                         (),
         .Q6                         (),
         .Q7                         (),
         .Q8                         (),
         .SHIFTOUT1                  (),
         .SHIFTOUT2                  (),
     
         .BITSLIP                    (1'b0),
         .CE1                        (1'b1),
         .CE2                        (1'b1),
         .CLK                        (iserdes_clk_d),
         .CLKB                       (!iserdes_clk_d),
         .CLKDIVP                    (iserdes_clkdiv),
         .CLKDIV                     (),
         .DDLY                       (data_in_dly[i]),
         .D                          (data_in[i]), 
	                                           
         .DYNCLKDIVSEL               (1'b0),
         .DYNCLKSEL                  (1'b0),


         .OCLK                       (oserdes_clk),
         .OCLKB                      (),
         .OFB                        (),
         .RST                        (1'b0),

         .SHIFTIN1                   (1'b0),
         .SHIFTIN2                   (1'b0)
         );

localparam IDELAYE2_CINVCTRL_SEL          = "FALSE";
localparam IDELAYE2_DELAY_SRC             = "IDATAIN";
localparam IDELAYE2_HIGH_PERFORMANCE_MODE = "TRUE";
localparam IDELAYE2_PIPE_SEL              = "FALSE";
localparam IDELAYE2_ODELAY_TYPE           = "FIXED";
localparam IDELAYE2_REFCLK_FREQUENCY      = ((FPGA_SPEED_GRADE == 2 || FPGA_SPEED_GRADE == 3) && TCK <= 1500) ? 400.0 : 
                                             (FPGA_SPEED_GRADE == 1 && TCK <= 1500) ?  300.0 : 200.0;
localparam IDELAYE2_SIGNAL_PATTERN        = "DATA";
localparam IDELAYE2_FINEDELAY_IN          = "ADD_DLY";

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
    end 
    else begin 
        assign iserdes_dout[4*i + 3] = 0;
        assign iserdes_dout[4*i + 2] = 0;
        assign iserdes_dout[4*i + 1] = 0;
        assign iserdes_dout[4*i + 0] = 0;
    end
end 
endgenerate			