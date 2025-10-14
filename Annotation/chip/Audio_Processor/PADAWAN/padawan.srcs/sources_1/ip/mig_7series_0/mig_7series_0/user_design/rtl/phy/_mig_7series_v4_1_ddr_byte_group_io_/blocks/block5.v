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