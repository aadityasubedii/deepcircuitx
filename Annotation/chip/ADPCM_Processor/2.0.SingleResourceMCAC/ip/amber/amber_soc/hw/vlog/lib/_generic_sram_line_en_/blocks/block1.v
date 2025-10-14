always @(posedge i_clk)
    begin
    
    o_read_data <= i_write_enable ? {DATA_WIDTH{1'd0}} : mem[i_address];

    
    if (i_write_enable)
        mem[i_address] <= i_write_data;
    end