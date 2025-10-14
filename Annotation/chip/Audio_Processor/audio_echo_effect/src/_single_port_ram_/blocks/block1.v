    always @(posedge clk) begin
        if (write_en)
            mem[addr] <= write_data;
        else
            read_data <= mem[addr];
    end