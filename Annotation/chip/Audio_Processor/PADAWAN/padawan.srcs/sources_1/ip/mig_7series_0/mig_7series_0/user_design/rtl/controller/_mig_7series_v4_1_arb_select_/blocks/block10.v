  generate
    if (nSLOTS > 1) begin : slot_1_configured
      wire slot_1_select = (slot_1_present[3] & slot_1_present[1])? 
            |({col_ra_one_hot[slot_0_population+1],
            col_ra_one_hot[slot_0_population]}) :
	   (slot_1_present[1]) ? col_ra_one_hot[slot_0_population] :1'b0;
      wire slot_1_read = EVEN_CWL_2T_MODE == "ON" ?
                          slot_1_select && col_rd_wr_r :
                          slot_1_select && col_rd_wr_ns;
      wire slot_1_write = EVEN_CWL_2T_MODE == "ON" ?
                            slot_1_select && ~col_rd_wr_r :
                            slot_1_select && ~col_rd_wr_ns;

      
      wire slot_1_odt = (DRAM_TYPE == "DDR3") ? ~slot_1_read : slot_1_write;
      assign mc_aux_out0[3] = slot_1_odt & sent_col;  

    end 
    else begin
      
      
      assign mc_aux_out0[3] = 1'b0;

    end 
  endgenerate