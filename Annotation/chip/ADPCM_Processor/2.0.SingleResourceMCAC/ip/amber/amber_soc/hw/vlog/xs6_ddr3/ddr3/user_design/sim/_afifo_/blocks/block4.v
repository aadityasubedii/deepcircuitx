always @ (wr_ptr)
begin
    wr_gray_nxt[ASIZE] = wr_ptr[ASIZE];
    for (n=0; n < ASIZE; n=n+1)
       wr_gray_nxt[n] = wr_ptr[n] ^ wr_ptr[n+1];
end       