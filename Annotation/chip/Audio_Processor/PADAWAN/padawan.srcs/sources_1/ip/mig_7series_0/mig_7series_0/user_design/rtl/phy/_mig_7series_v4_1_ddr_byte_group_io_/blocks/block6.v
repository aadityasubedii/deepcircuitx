generate 

localparam NUM_BITLANES = PO_DATA_CTL == "TRUE" ? 10 : BUS_WIDTH;

     if ( PO_DATA_CTL == "TRUE" ) begin  : slave_ts
           OSERDESE2 #(
               .DATA_RATE_OQ         (OSERDES_DQ_DATA_RATE_OQ),
               .DATA_RATE_TQ         (OSERDES_DQ_DATA_RATE_TQ),
               .DATA_WIDTH           (OSERDES_DQ_DATA_WIDTH),
               .INIT_OQ              (OSERDES_DQ_INIT_OQ),
               .INIT_TQ              (OSERDES_DQ_INIT_TQ),
               .SERDES_MODE          (OSERDES_DQ_SERDES_MODE),
               .SRVAL_OQ             (OSERDES_DQ_SRVAL_OQ),
               .SRVAL_TQ             (OSERDES_DQ_SRVAL_TQ),
               .TRISTATE_WIDTH       (OSERDES_DQ_TRISTATE_WIDTH),
               .TBYTE_CTL            ("TRUE"),
               .TBYTE_SRC            ("TRUE")
            )
            oserdes_slave_ts
            (
                .OFB                 (),
                .OQ                  (),
                .SHIFTOUT1           (),	
                .SHIFTOUT2           (),	
                .TFB                 (),
                .TQ                  (),
                .CLK                 (oserdes_clk),
                .CLKDIV              (oserdes_clkdiv),
                .D1                  (),
                .D2                  (),
                .D3                  (),
                .D4                  (),
                .D5                  (),
                .D6                  (),
                .D7                  (),
                .D8                  (),
               .OCE                  (1'b1),
               .RST                  (oserdes_rst),
               .SHIFTIN1             (),     
               .SHIFTIN2             (),     
               .T1                   (oserdes_dqts[0]),
               .T2                   (oserdes_dqts[0]),
               .T3                   (oserdes_dqts[1]),
               .T4                   (oserdes_dqts[1]),
               .TCE                  (1'b1),
               .TBYTEOUT             (tbyte_out),
               .TBYTEIN              (tbyte_out)
             );
     end 

  for (i = 0; i != NUM_BITLANES; i=i+1) begin : output_
     if ( BITLANES[i]) begin  : oserdes_dq_

        if ( PO_DATA_CTL == "TRUE" ) begin  : ddr

           OSERDESE2 #(
               .DATA_RATE_OQ         (OSERDES_DQ_DATA_RATE_OQ),
               .DATA_RATE_TQ         (OSERDES_DQ_DATA_RATE_TQ),
               .DATA_WIDTH           (OSERDES_DQ_DATA_WIDTH),
               .INIT_OQ              (OSERDES_DQ_INIT_OQ),
               .INIT_TQ              (OSERDES_DQ_INIT_TQ),
               .SERDES_MODE          (OSERDES_DQ_SERDES_MODE),
               .SRVAL_OQ             (OSERDES_DQ_SRVAL_OQ),
               .SRVAL_TQ             (OSERDES_DQ_SRVAL_TQ),
               .TRISTATE_WIDTH       (OSERDES_DQ_TRISTATE_WIDTH),
               .TBYTE_CTL            (OSERDES_TBYTE_CTL),
               .TBYTE_SRC            ("FALSE")
             )
              oserdes_dq_i 
              (
                .OFB               (),
                .OQ                (oserdes_dq_buf[i]),
                .SHIFTOUT1         (),	
                .SHIFTOUT2         (),	
                .TBYTEOUT          (),
                .TFB               (),
                .TQ                (oserdes_dqts_buf[i]),
                .CLK               (oserdes_clk),
                .CLKDIV            (oserdes_clkdiv),
                .D1                (oserdes_dq[4 * i + 0]),
                .D2                (oserdes_dq[4 * i + 1]),
                .D3                (oserdes_dq[4 * i + 2]),
                .D4                (oserdes_dq[4 * i + 3]),
                .D5                (),
                .D6                (),
                .D7                (),
                .D8                (),
               .OCE                (1'b1),
               .RST                (oserdes_rst),
               .SHIFTIN1           (),     
               .SHIFTIN2           (),     
               .T1                 (),
               .T2                 (),
               .T3                 (),
               .T4                 (),
               .TCE                (1'b1),
               .TBYTEIN            (tbyte_out)
              );
           end
           else begin :  sdr 
           OSERDESE2 #(
               .DATA_RATE_OQ         (OSERDES_DQ_DATA_RATE_OQ),
               .DATA_RATE_TQ         (OSERDES_DQ_DATA_RATE_TQ),
               .DATA_WIDTH           (OSERDES_DQ_DATA_WIDTH),
               .INIT_OQ              (1'b0 ),
               .INIT_TQ              (OSERDES_DQ_INIT_TQ),
               .SERDES_MODE          (OSERDES_DQ_SERDES_MODE),
               .SRVAL_OQ             (1'b0 ),
               .SRVAL_TQ             (OSERDES_DQ_SRVAL_TQ),
               .TRISTATE_WIDTH       (OSERDES_DQ_TRISTATE_WIDTH) 
              )
              oserdes_dq_i 
              (
                .OFB               (),
                .OQ                (oserdes_dq_buf[i]),
                .SHIFTOUT1         (),	
                .SHIFTOUT2         (),	
                .TBYTEOUT          (),
                .TFB               (),
                .TQ                (),
                .CLK               (oserdes_clk),
                .CLKDIV            (oserdes_clkdiv),
                .D1                (oserdes_dq[4 * i + 0]),
                .D2                (oserdes_dq[4 * i + 1]),
                .D3                (oserdes_dq[4 * i + 2]),
                .D4                (oserdes_dq[4 * i + 3]),
                .D5                (),
                .D6                (),
                .D7                (),
                .D8                (),
               .OCE                (1'b1),
               .RST                (oserdes_rst),
               .SHIFTIN1           (),     
               .SHIFTIN2           (),     
               .T1                 (),
               .T2                 (),
               .T3                 (),
               .T4                 (),
               .TCE                (1'b1),
               .TBYTEIN            ()
              );
           end 
     end 
  end 
  
endgenerate