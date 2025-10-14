    always @( posedge i_clk )
        begin
        if (start_write)
            $display("DDR3 Write Addr 0x%08x Data 0x%08h %08h %08h %08h, BE %d%d%d%d %d%d%d%d %d%d%d%d %d%d%d%d", 
                     i_i_wb_adr, i_mwdata[127:96], i_mwdata[95:64], i_mwdata[63:32], i_mwdata[31:0],
                     i_mwben[15], i_mwben[14], i_mwben[13], i_mwben[12], 
                     i_mwben[11], i_mwben[10], i_mwben[9],  i_mwben[8], 
                     i_mwben[7],  i_mwben[6],  i_mwben[5],  i_mwben[4], 
                     i_mwben[3],  i_mwben[2],  i_mwben[1],  i_mwben[0] 
                     );
                     
        if (i_rd_empty == 1'd0)
            $display("DDR3 Read  Addr 0x%08x Data 0x%08h %08h %08h %08h", 
                     i_i_wb_adr, i_rd_data[127:96], i_rd_data [95:64], i_rd_data [63:32], i_rd_data [31:0]);
        end