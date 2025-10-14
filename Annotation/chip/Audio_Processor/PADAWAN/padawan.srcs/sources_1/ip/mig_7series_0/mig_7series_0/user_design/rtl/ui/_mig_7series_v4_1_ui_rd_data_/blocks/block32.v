        always @(posedge clk) status_ram_wr_addr_r <=
                             #TCQ status_ram_wr_addr_ns;
        wire [1:0] wr_status;