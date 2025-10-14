generate
    for ( i=0; i<WAYS;i=i+1 ) begin : rams

        
        `ifdef XILINX_SPARTAN6_FPGA
        xs6_sram_256x21_line_en
        `endif

        `ifdef XILINX_VIRTEX6_FPGA
        xv6_sram_256x21_line_en
        `endif

        `ifndef XILINX_FPGA
        generic_sram_line_en 
        `endif

            #(
            .DATA_WIDTH                 ( TAG_WIDTH             ),
            .INITIALIZE_TO_ZERO         ( 1                     ),
            .ADDRESS_WIDTH              ( CACHE_ADDR_WIDTH      ))
        u_tag (
            .i_clk                      ( i_clk                 ),
            .i_write_data               ( tag_wdata             ),
            .i_write_enable             ( tag_wenable_way[i]    ),
            .i_address                  ( tag_address           ),

            .o_read_data                ( tag_rdata_way[i]      )
            );
            
        
        `ifdef XILINX_SPARTAN6_FPGA
        xs6_sram_256x128_byte_en
        `endif

        `ifdef XILINX_VIRTEX6_FPGA
        xv6_sram_256x128_byte_en
        `endif

        `ifndef XILINX_FPGA
        generic_sram_byte_en
        `endif

            #(
            .DATA_WIDTH    ( CACHE_LINE_WIDTH) ,
            .ADDRESS_WIDTH ( CACHE_ADDR_WIDTH) )
        u_data (
            .i_clk                      ( i_clk                         ),
            .i_write_data               ( i_wb_read_data                ),
            .i_write_enable             ( data_wenable_way[i]           ),
            .i_address                  ( data_address                  ),
            .i_byte_enable              ( {CACHE_LINE_WIDTH/8{1'd1}}    ),
            .o_read_data                ( data_rdata_way[i]             )
            );                                                     


        
        assign tag_wenable_way[i]  = tag_wenable && ( select_way[i] || source_sel[C_INIT] );

        
        assign data_wenable_way[i] = ( source_sel[C_FILL] || read_miss_fill ) && select_way[i];

        
        assign data_hit_way[i]     = tag_rdata_way[i][TAG_WIDTH-1] &&                                                  
                                     tag_rdata_way[i][TAG_ADDR_WIDTH-1:0] == i_address[31:TAG_ADDR32_LSB] &&  
                                     c_state == CS_IDLE;                                                               
    end                                                         
endgenerate