  generate
    genvar m, n,x;

    
    
    

    
    for (m = 0; m < ROW_WIDTH; m = m + 1) begin: gen_addr_out
      assign out_addr[m]
               = mem_dq_out[48*ADDR_MAP[(12*m+8)+:3] +
                            12*ADDR_MAP[(12*m+4)+:2] +
                            ADDR_MAP[12*m+:4]];

      if (ADDR_MAP[12*m+:4] < 4'hA) begin: gen_lt10
        
        
        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*ADDR_MAP[(12*m+8)+:3] +
                          80*ADDR_MAP[(12*m+4)+:2] +
                          8*ADDR_MAP[12*m+:4] + n]
                   = mux_address[ROW_WIDTH*(n/PHASE_DIV) + m];
        end
      end else begin: gen_ge10
        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*ADDR_MAP[(12*m+8)+:3] +
                          80*ADDR_MAP[(12*m+4)+:2] +
                          8*(ADDR_MAP[12*m+:4]-5) + 4 + n]
                   = mux_address[ROW_WIDTH*(n/PHASE_DIV) + m];
        end
      end
    end

    
    for (m = 0; m < BANK_WIDTH; m = m + 1) begin: gen_ba_out
        assign out_ba[m]
                 = mem_dq_out[48*BANK_MAP[(12*m+8)+:3] +
                              12*BANK_MAP[(12*m+4)+:2] +
                              BANK_MAP[12*m+:4]];

      if (BANK_MAP[12*m+:4] < 4'hA) begin: gen_lt10
        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*BANK_MAP[(12*m+8)+:3] +
                          80*BANK_MAP[(12*m+4)+:2] +
                          8*BANK_MAP[12*m+:4] + n]
                   = mux_bank[BANK_WIDTH*(n/PHASE_DIV) + m];
        end
      end else begin: gen_ge10
        for (n = 0; n < 4; n = n + 1) begin: loop_xpose
          assign phy_dout[320*BANK_MAP[(12*m+8)+:3] +
                          80*BANK_MAP[(12*m+4)+:2] +
                          8*(BANK_MAP[12*m+:4]-5) + 4 + n]
                   = mux_bank[BANK_WIDTH*(n/PHASE_DIV) + m];
        end
      end
    end

    
    if (USE_CS_PORT == 1) begin: gen_cs_n_out
      for (m = 0; m < CS_WIDTH*nCS_PER_RANK; m = m + 1) begin: gen_cs_out
        assign out_cs_n[m]
                 = mem_dq_out[48*CS_MAP[(12*m+8)+:3] +
                              12*CS_MAP[(12*m+4)+:2] +
                              CS_MAP[12*m+:4]];
        if (CS_MAP[12*m+:4] < 4'hA) begin: gen_lt10
          for (n = 0; n < 4; n = n + 1) begin: loop_xpose
            assign phy_dout[320*CS_MAP[(12*m+8)+:3] +
                            80*CS_MAP[(12*m+4)+:2] +
                            8*CS_MAP[12*m+:4] + n]
                     = mux_cs_n[CS_WIDTH*nCS_PER_RANK*(n/PHASE_DIV) + m];
          end
        end else begin: gen_ge10
          for (n = 0; n < 4; n = n + 1) begin: loop_xpose
            assign phy_dout[320*CS_MAP[(12*m+8)+:3] +
                            80*CS_MAP[(12*m+4)+:2] +
                            8*(CS_MAP[12*m+:4]-5) + 4 + n]
                     = mux_cs_n[CS_WIDTH*nCS_PER_RANK*(n/PHASE_DIV) + m];
          end
        end
      end
    end


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

    
    
    

    if (USE_DM_PORT == 1) begin: gen_dm_out
      for (m = 0; m < DM_WIDTH; m = m + 1) begin: gen_dm_out
        assign out_dm[m]
                 = mem_dq_out[48*FULL_MASK_MAP[(12*m+8)+:3] +
                              12*FULL_MASK_MAP[(12*m+4)+:2] +
                              FULL_MASK_MAP[12*m+:4]];
        assign ts_dm[m]
                 = mem_dq_ts[48*FULL_MASK_MAP[(12*m+8)+:3] +
                             12*FULL_MASK_MAP[(12*m+4)+:2] +
                             FULL_MASK_MAP[12*m+:4]];
        for (n = 0; n < PHASE_PER_CLK; n = n + 1) begin: loop_xpose
          assign phy_dout[320*FULL_MASK_MAP[(12*m+8)+:3] +
                          80*FULL_MASK_MAP[(12*m+4)+:2] +
                          8*FULL_MASK_MAP[12*m+:4] + n]
                   = mux_wrdata_mask[DM_WIDTH*n + m];
        end
      end
    end

    
    
    

    for (m = 0; m < DQ_WIDTH; m = m + 1) begin: gen_dq_inout
      
      assign mem_dq_in[40*FULL_DATA_MAP[(12*m+8)+:3] +
                       10*FULL_DATA_MAP[(12*m+4)+:2] +
                       FULL_DATA_MAP[12*m+:4]]
               = in_dq[m];
      
      assign out_dq[m]
               = mem_dq_out[48*FULL_DATA_MAP[(12*m+8)+:3] +
                            12*FULL_DATA_MAP[(12*m+4)+:2] +
                            FULL_DATA_MAP[12*m+:4]];
      assign ts_dq[m]
               = mem_dq_ts[48*FULL_DATA_MAP[(12*m+8)+:3] +
                           12*FULL_DATA_MAP[(12*m+4)+:2] +
                           FULL_DATA_MAP[12*m+:4]];
      for (n = 0; n < PHASE_PER_CLK; n = n + 1) begin: loop_xpose
        assign phy_dout[320*FULL_DATA_MAP[(12*m+8)+:3] +
                        80*FULL_DATA_MAP[(12*m+4)+:2] +
                        8*FULL_DATA_MAP[12*m+:4] + n]
                 = mux_wrdata[DQ_WIDTH*n + m];
      end
    end

    
    
    

    for (m = 0; m < DQS_WIDTH; m = m + 1) begin: gen_dqs_inout
      
      assign mem_dqs_in[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]]
        = in_dqs[m];
      
      assign out_dqs[m]
        = mem_dqs_out[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]];
      assign ts_dqs[m]
        = mem_dqs_ts[4*DQS_BYTE_MAP[(8*m+4)+:3] + DQS_BYTE_MAP[(8*m)+:2]];
    end
  endgenerate