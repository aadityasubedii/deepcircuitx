    wire fetch_done;
    dpram #(.BITS(16), .SIZE(256), .FILE("x.dat")) ram_x(.ck(ck),
        .we(we_x), .waddr(waddr_x), .wdata(wdata_x),
        .re(re_x), .raddr(raddr_x), .rdata(data_x));
