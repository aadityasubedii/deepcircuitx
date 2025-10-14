always @ ( posedge i_clk )
    if ( write_hit )
        begin
        data_hit_way_r      <= data_hit_way;
        end