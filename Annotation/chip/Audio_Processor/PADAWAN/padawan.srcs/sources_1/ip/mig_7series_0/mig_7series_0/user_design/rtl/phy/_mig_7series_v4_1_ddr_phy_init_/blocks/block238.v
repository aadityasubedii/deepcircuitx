  always @ (posedge clk) 
    complex_act_start <= #TCQ (init_state_r == INIT_RDLVL_COMPLEX_ACT) || (init_state_r == INIT_RDLVL_COMPLEX_PI_WAIT);

  