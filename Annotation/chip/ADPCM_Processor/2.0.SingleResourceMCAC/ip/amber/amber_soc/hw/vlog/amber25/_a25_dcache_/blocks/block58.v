always @ ( posedge i_clk )
    if ( write_hit || consecutive_write )
        begin
        data_wdata_r   <= data_wdata;
        end