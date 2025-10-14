always @(posedge clk or posedge reset) begin
    if (reset) begin
      if (INITIALIZE_TO_ZERO) begin
        o_read_data <= {DATA_WIDTH{1'b0}};
        for (i = 0; i < (2**ADDRESS_WIDTH); i = i + 1) begin
            mem[i] <= (INITIALIZE_TO_ZERO == 2) ? {DATA_WIDTH{1'b1}} : {DATA_WIDTH{1'b0}};
        end
      end
    end
    else begin
        
        o_read_data <= i_write_enable ? {DATA_WIDTH{1'd0}} : mem[i_address];

        
        if (i_write_enable)
            mem[i_address] <= i_write_data;
    end
end