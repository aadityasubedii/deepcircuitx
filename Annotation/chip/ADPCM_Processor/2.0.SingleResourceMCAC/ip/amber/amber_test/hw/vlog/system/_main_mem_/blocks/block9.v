    always @( posedge i_clk )
        begin
        start_read_d1   <= start_read;
        start_read_d2   <= start_read_d1;
        if ( start_read_d1 )
            begin
            wb_rdata128 <= rd_data;
            end
        end