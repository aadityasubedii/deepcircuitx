    assign data_out_enable = ce2dqe && oe2dqe && we2dqe && by2dqe;
    assign variable_sync   = !operating_mode && !initial_latency && sync_access; 
    assign data_out_valid  = we2dq && ((!variable_sync && ce2dq && oe2dq && by2dq && adv2dq && addr2dq) || (variable_sync && soe2dq && saddr2dq));
    assign wait_out_enable = cr20wait_code ? ce2waite && (oe2waite || clk2waite) && we2waite : ce2waite;
    assign wait_out_valid  = cr20wait_code ? ce2wait  && (oe2wait  || clk2waite) : ce2wait;