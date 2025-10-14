always@( posedge i_clk )
    if ( i_wb_read_data_valid )
        begin
        read_data_filtered_r <= read_data_filtered;
        load_rd_r            <= {i_wb_load_rd[6:5], i_wb_load_rd[3:0]};
        end