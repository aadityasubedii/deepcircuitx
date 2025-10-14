generate
    for (i=0;i<4;i=i+1) begin : u_gen
        RAMB8BWER #(
            .DATA_WIDTH_A        ( 36                        ),
            .DATA_WIDTH_B        ( 36                        ),
            .RAM_MODE            ( "SDP"                     ),
            .SIM_COLLISION_CHECK ( "GENERATE_X_ONLY"         ),
            .WRITE_MODE_A        ( "READ_FIRST"              ),
            .WRITE_MODE_B        ( "READ_FIRST"              )
         ) 
        u_ramb8bwer (
            .CLKAWRCLK      ( i_clk                          ),     
            .CLKBRDCLK      ( i_clk                          ),
            .ADDRAWRADDR    ( {i_address, 5'd0}              ),
            .ADDRBRDADDR    ( {i_address, 5'd0}              ),
            .ENAWREN        ( i_write_enable                 ),       
            .ENBRDEN        ( ~i_write_enable                ),
            
            
            .WEAWEL         ( byte_write_enable[4*i+1:4*i+0] ),  
            .DIADI          ( i_write_data[32*i+15:32*i+ 0]  ), 
            .DOADO          ( o_read_data [32*i+15:32*i+ 0]  ),
            
            
            .WEBWEU         ( byte_write_enable[4*i+3:4*i+2] ),
            .DIBDI          ( i_write_data[32*i+31:32*i+16]  ),
            .DOBDO          ( o_read_data [32*i+31:32*i+16]  ),

            
            
            .DIPBDIP        ( 2'd0                           ),
            .DIPADIP        ( 2'd0                           ),      
            .DOPADOP        (                                ),
            .DOPBDOP        (                                ),
          
            .REGCEA         ( 1'd0                           ),
            .REGCEBREGCE    ( 1'd0                           ),
            .RSTA           ( 1'd0                           ),
            .RSTBRST        ( 1'd0                           )
        );

    end
endgenerate