    always @( posedge i_clk )
        if ( !i_cmd_full )
            begin
            wr_en_r    <= write_request;
            o_wr_mask  <= ~wb_sel; 
            o_wr_data  <= wb_dat;
            end

end