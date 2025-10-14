    always @( posedge i_clk )
        if ( !i_rd_empty && read_active_r )
            o_wb_dat  <= i_rd_data;

end