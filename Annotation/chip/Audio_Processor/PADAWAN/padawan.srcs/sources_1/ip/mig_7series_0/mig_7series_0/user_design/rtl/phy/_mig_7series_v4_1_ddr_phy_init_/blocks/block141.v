        if (cnt_cmd_done_r && ~(phy_ctl_full || phy_cmd_full)) 
          init_next_state = INIT_WRCAL_READ;
        else if (dqsfound_retry)
            init_next_state = INIT_RDLVL_STG2_READ_WAIT;


      INIT_WRCAL_READ:
        if (burst_addr_r == 1'b1)
          init_next_state = INIT_WRCAL_READ_WAIT;