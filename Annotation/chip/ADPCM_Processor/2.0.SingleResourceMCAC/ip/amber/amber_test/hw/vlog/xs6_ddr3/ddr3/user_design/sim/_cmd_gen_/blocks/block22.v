always @ (posedge clk_i)
    end_addr_range <= #TCQ    end_addr_i[15:0] - (DWIDTH/8 *bl_out_reg) + 1   ;
