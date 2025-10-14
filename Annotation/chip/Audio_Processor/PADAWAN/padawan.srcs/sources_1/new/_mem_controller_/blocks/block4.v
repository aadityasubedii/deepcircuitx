always @ (posedge(clk_100MHz)) begin
    if (rst==1)addrblock44khz<=0;
    else if (address_enable==0)addrblock44khz<=0;
    else if(increment==1)begin
        if(max_block==0 || addrblock44khz < max_block)
            addrblock44khz <= addrblock44khz + 1;
        else
            addrblock44khz <= 0;
    end
end