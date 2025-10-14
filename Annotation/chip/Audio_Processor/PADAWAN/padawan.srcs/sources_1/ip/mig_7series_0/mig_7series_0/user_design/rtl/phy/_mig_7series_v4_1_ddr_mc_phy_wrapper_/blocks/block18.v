   if(CKE_ODT_AUX == "FALSE") begin
     
     wire [ODT_WIDTH*nCK_PER_CLK -1 :0] mux_odt_remap  ;

     if(RANKS == 1) begin
        for(x =0 ; x < nCK_PER_CLK ; x = x+1) begin
          assign mux_odt_remap[(x*ODT_WIDTH)+:ODT_WIDTH] = {ODT_WIDTH{mux_odt[0]}} ;
        end
     end else begin
        for(x =0 ; x < 2*nCK_PER_CLK ; x = x+2) begin
          assign mux_odt_remap[(x*ODT_WIDTH/RANKS)+:ODT_WIDTH/RANKS] = {ODT_WIDTH/RANKS{mux_odt[0]}} ;
          assign mux_odt_remap[((x*ODT_WIDTH/RANKS)+(ODT_WIDTH/RANKS))+:ODT_WIDTH/RANKS] = {ODT_WIDTH/RANKS{mux_odt[1]}} ;
        end
     end

     if (USE_ODT_PORT == 1) begin: gen_odt_out
       for (m = 0; m < ODT_WIDTH; m = m + 1) begin: gen_odt_out_1
         assign out_odt[m]
                  = mem_dq_out[48*ODT_MAP[(12*m+8)+:3] +
                               12*ODT_MAP[(12*m+4)+:2] +
                               ODT_MAP[12*m+:4]];
         if (ODT_MAP[12*m+:4] < 4'hA) begin: gen_lt10
           for (n = 0; n < 4; n = n + 1) begin: loop_xpose
             assign phy_dout[320*ODT_MAP[(12*m+8)+:3] +
                             80*ODT_MAP[(12*m+4)+:2] +
                             8*ODT_MAP[12*m+:4] + n]
                      = mux_odt_remap[ODT_WIDTH*(n/PHASE_DIV) + m];
           end
         end else begin: gen_ge10
           for (n = 0; n < 4; n = n + 1) begin: loop_xpose
             assign phy_dout[320*ODT_MAP[(12*m+8)+:3] +
                             80*ODT_MAP[(12*m+4)+:2] +
                             8*(ODT_MAP[12*m+:4]-5) + 4 + n]
                      = mux_odt_remap[ODT_WIDTH*(n/PHASE_DIV) + m];
           end
         end
       end
     end


     wire [CKE_WIDTH*nCK_PER_CLK -1:0] mux_cke_remap ;

     for(x = 0 ; x < nCK_PER_CLK ; x = x +1) begin
      assign  mux_cke_remap[(x*CKE_WIDTH)+:CKE_WIDTH] = {CKE_WIDTH{mux_cke[x]}} ;
     end



     for (m = 0; m < CKE_WIDTH; m = m + 1) begin: gen_cke_out
       assign out_cke[m]
                = mem_dq_out[48*CKE_MAP[(12*m+8)+:3] +
                             12*CKE_MAP[(12*m+4)+:2] +
                             CKE_MAP[12*m+:4]];
       if (CKE_MAP[12*m+:4] < 4'hA) begin: gen_lt10
         for (n = 0; n < 4; n = n + 1) begin: loop_xpose
           assign phy_dout[320*CKE_MAP[(12*m+8)+:3] +
                           80*CKE_MAP[(12*m+4)+:2] +
                           8*CKE_MAP[12*m+:4] + n]
                    = mux_cke_remap[CKE_WIDTH*(n/PHASE_DIV) + m];
         end
       end else begin: gen_ge10
         for (n = 0; n < 4; n = n + 1) begin: loop_xpose
           assign phy_dout[320*CKE_MAP[(12*m+8)+:3] +
                           80*CKE_MAP[(12*m+4)+:2] +
                           8*(CKE_MAP[12*m+:4]-5) + 4 + n]
                    = mux_cke_remap[CKE_WIDTH*(n/PHASE_DIV) + m];
         end
       end
     end
   end