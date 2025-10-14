      INIT_WRCAL_WRITE:
        
        
        if (wrcal_wr_cnt == 4'd1)
          init_next_state = INIT_WRCAL_WRITE_READ;
