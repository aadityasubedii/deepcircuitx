always @(posedge i_clk)
    begin
    
    o_read_data <= i_write_enable ? {DATA_WIDTH{1'd0}} : mem[i_address];

    
    if (i_write_enable)
        for (i=0;i<DATA_WIDTH/8;i=i+1)
            begin
            mem[i_address][i*8+0] <= i_byte_enable[i] ? i_write_data[i*8+0] : mem[i_address][i*8+0] ;
            mem[i_address][i*8+1] <= i_byte_enable[i] ? i_write_data[i*8+1] : mem[i_address][i*8+1] ;
            mem[i_address][i*8+2] <= i_byte_enable[i] ? i_write_data[i*8+2] : mem[i_address][i*8+2] ;
            mem[i_address][i*8+3] <= i_byte_enable[i] ? i_write_data[i*8+3] : mem[i_address][i*8+3] ;
            mem[i_address][i*8+4] <= i_byte_enable[i] ? i_write_data[i*8+4] : mem[i_address][i*8+4] ;
            mem[i_address][i*8+5] <= i_byte_enable[i] ? i_write_data[i*8+5] : mem[i_address][i*8+5] ;
            mem[i_address][i*8+6] <= i_byte_enable[i] ? i_write_data[i*8+6] : mem[i_address][i*8+6] ;
            mem[i_address][i*8+7] <= i_byte_enable[i] ? i_write_data[i*8+7] : mem[i_address][i*8+7] ;
            end                                                 
    end