   generate 
      for(ba_i = 0; ba_i < C_MEM_BANKADDR_WIDTH; ba_i = ba_i + 1) begin : gen_ba_obuft
        OBUFT iob_ba_inst
        (.I  ( ioi_ba[ba_i]), 
         .T   ( t_ba[ba_i]), 
         .O ( mcbx_dram_ba[ba_i])
        );
      end       
   endgenerate