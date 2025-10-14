    corr_fetch #(.ADDR_W(ADDR_W), .COUNT_W(COUNT_W)) 
        fetch_x(.ck(ck), .en(1'b1), .start(start), .count(count),
            .start_addr(8'h0), .raddr(raddr_x), .ren(fetching), .done(fetch_done));
