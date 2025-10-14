  generate
    if(DRAM_TYPE == "DDR3") begin: gen_load_mr1_DDR3
      assign load_mr1[0]     = 1'b0;   
      assign load_mr1[1]     = (OUTPUT_DRV == "LOW") ? 1'b0 : 1'b1; 
      assign load_mr1[2]     = ((RTT_NOM_int == "30") || (RTT_NOM_int == "40") || 
                                (RTT_NOM_int == "60")) ? 1'b1 : 1'b0;
      assign load_mr1[4:3]   = (AL == "0")    ? 2'b00 :
                               (AL == "CL-1") ? 2'b01 :
                               (AL == "CL-2") ? 2'b10 : 2'b11;
      assign load_mr1[5]     = 1'b0; 
      assign load_mr1[6]     = ((RTT_NOM_int == "40") || (RTT_NOM_int == "120")) ? 
                               1'b1 : 1'b0;
      assign load_mr1[7]     = 1'b0;   
      assign load_mr1[8]     = 1'b0;
      assign load_mr1[9]     = ((RTT_NOM_int == "20") || (RTT_NOM_int == "30")) ?
                                1'b1 : 1'b0;
      assign load_mr1[10]    = 1'b0;
      assign load_mr1[15:11] = 5'b00000;
    end else if (DRAM_TYPE == "DDR2") begin: gen_load_mr1_DDR2 
      assign load_mr1[0]     = 1'b0;   
      assign load_mr1[1]     = (OUTPUT_DRV == "LOW") ? 1'b1 : 1'b0; 
      assign load_mr1[2]     = ((RTT_NOM_int == "75") || (RTT_NOM_int == "50")) ?
                                1'b1 : 1'b0;
      assign load_mr1[5:3]   = (AL == "0") ? 3'b000 :
                               (AL == "1") ? 3'b001 :
                               (AL == "2") ? 3'b010 :
                               (AL == "3") ? 3'b011 :
                               (AL == "4") ? 3'b100 : 3'b111;     
      assign load_mr1[6]     = ((RTT_NOM_int == "50") || 
                                (RTT_NOM_int == "150")) ? 1'b1 : 1'b0;
      assign load_mr1[9:7]   = 3'b000;
      assign load_mr1[10]    = (DDR2_DQSN_ENABLE == "YES") ? 1'b0 : 1'b1;
      assign load_mr1[15:11] = 5'b00000;

    end
  endgenerate