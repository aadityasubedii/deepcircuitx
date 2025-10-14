    always @( posedge i_clk )
        begin
        wr_en          <= start_write;
        wr_mask        <= ~ i_wb_sel; 
        wr_data        <= i_wb_dat;

                          
        addr_d1        <= i_mem_ctrl ? {5'd0, i_wb_adr[24:2]} : i_wb_adr[29:2];
        
        if ( wr_en )
            ram [addr_d1[27:2]]  <= masked_wdata;
        end