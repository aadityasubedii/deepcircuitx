always @ (rd_ptr)
begin




  rd_gray_nxt[ASIZE] = rd_ptr[ASIZE];
  for (n=0; n < ASIZE; n=n+1) 
       rd_gray_nxt[n] = rd_ptr[n] ^ rd_ptr[n+1];

    
    
end       