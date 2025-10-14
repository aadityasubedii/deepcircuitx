always @( posedge wr_clk )
    if ( i_push && !o_full )
        begin
        wr_pointer <= wr_pointer + 1'd1;
        data[wr_pointer[1:0]] <= i_data;
        end