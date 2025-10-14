   generate 
      for(addr_i = 0; addr_i < C_MEM_ADDR_WIDTH; addr_i = addr_i + 1) begin : gen_addr_obuft
        OBUFT iob_addr_inst
        (.I  ( ioi_addr[addr_i]), 
         .T   ( t_addr[addr_i]), 
         .O ( mcbx_dram_addr[addr_i])
        );
      end       
   endgenerate