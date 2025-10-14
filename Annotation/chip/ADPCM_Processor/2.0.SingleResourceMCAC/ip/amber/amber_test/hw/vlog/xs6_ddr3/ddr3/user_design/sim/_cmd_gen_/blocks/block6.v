always @(addr_out,bl_out,end_addr_i,rst_i,buf_avail_r) begin
    if (rst_i[5])
        force_bl1 =   1'b0;
    else if (((addr_out + bl_out* (DWIDTH/8)) >= end_addr_i) || (buf_avail_r  <= 50 && PORT_MODE == "RD_MODE"))
        force_bl1 =   1'b1;
    else
        force_bl1 =   1'b0;
end