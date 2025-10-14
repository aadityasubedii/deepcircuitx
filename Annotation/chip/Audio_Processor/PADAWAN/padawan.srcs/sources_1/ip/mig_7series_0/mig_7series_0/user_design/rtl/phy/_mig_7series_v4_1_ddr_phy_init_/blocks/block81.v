   always @(posedge clk)
     if (rst)
       complex_address <= #TCQ 'd0;
     else if (((init_state_r == INIT_RDLVL_COMPLEX_READ_WAIT) && (init_state_r1 != INIT_RDLVL_COMPLEX_READ_WAIT)) ||
              ((init_state_r == INIT_OCAL_COMPLEX_WRITE_WAIT) && (init_state_r1 != INIT_OCAL_COMPLEX_WRITE_WAIT)))              
       complex_address <= #TCQ phy_address[COL_WIDTH-1:0];
       