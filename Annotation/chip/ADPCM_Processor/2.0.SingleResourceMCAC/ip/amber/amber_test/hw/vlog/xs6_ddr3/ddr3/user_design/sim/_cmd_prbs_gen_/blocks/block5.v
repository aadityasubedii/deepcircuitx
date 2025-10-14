    always @(lfsr_q[32:1]) begin
    
     if (FAMILY == "SPARTAN6" ) begin  
    
      for(i = logb2(DWIDTH) + 1; i <= SEED_WIDTH - 1; i = i + 1)

       if(PRBS_SADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_SADDR[i] | lfsr_q[i+1];
       else if(PRBS_EADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_EADDR[i] & lfsr_q[i+1];
       else
          prbs[i] =  lfsr_q[i+1];
          
       prbs[logb2(DWIDTH )  :0] = {logb2(DWIDTH ) + 1{1'b0}};         

      end
    else begin
     for(i = logb2(DWIDTH)-4; i <= SEED_WIDTH - 1; i = i + 1)
       if(PRBS_SADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_SADDR[i] | lfsr_q[i+1];
       else if(PRBS_EADDR_MASK_POS[i] == 1)
          prbs[i] = PRBS_EADDR[i] & lfsr_q[i+1];
       else
          prbs[i] =  lfsr_q[i+1];
     prbs[logb2(DWIDTH)-5:0] = {logb2(DWIDTH) - 4{1'b0}};

    end  
 
  end  