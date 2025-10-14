     wire [CKE_WIDTH*nCK_PER_CLK -1:0] mux_cke_remap ;

     for(x = 0 ; x < nCK_PER_CLK ; x = x +1) begin
      assign  mux_cke_remap[(x*CKE_WIDTH)+:CKE_WIDTH] = {CKE_WIDTH{mux_cke[x]}} ;
     end