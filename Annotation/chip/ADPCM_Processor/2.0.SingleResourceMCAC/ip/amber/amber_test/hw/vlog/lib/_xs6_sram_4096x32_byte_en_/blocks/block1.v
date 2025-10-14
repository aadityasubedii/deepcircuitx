  u_sram7  (
    .REGCEA ( 1'd0                              ),
    .CLKA   ( i_clk                             ),
    .ENB    ( 1'd0                              ),
    .RSTB   ( 1'd0                              ),
    .CLKB   ( 1'd0                              ),
    .REGCEB ( 1'd0                              ),
    .RSTA   ( 1'd0                              ),
    .ENA    ( 1'd1                              ),
    .WEA    ({wea_b1[0], wea_b1[0], 
              wea_b1[0], wea_b1[0]}             ),
    .DOA    ( data_out_b1[0]                    ),
    .ADDRA  ({i_address[10:0], 3'd0}            ),
    .ADDRB  ( 14'd0                             ),
    .DIA    ( {24'd0, i_write_data[7:0]}        ),
    .DIB    ( 32'd0                             ),
    .DIPA   ( 4'd0                              ),
    .DIPB   ( 4'd0                              ),
    .DOPA   (                                   ),
    .DOPB   (                                   ),
    .DOB    (                                   ),
    .WEB    ( 4'd0                              )
  );

endmodule