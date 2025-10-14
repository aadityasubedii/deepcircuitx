  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          trc_jtag_addr <= 0;
      else if (take_action_tracemem_a ||
                take_no_action_tracemem_a || 
                take_action_tracemem_b)
          trc_jtag_addr <= take_action_tracemem_a ? 
                    jdo[35 : 19] : 
                    trc_jtag_addr + 1;

    end