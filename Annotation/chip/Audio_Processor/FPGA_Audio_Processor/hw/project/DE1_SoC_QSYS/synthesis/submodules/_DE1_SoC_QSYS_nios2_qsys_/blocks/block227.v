  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          wait_for_one_post_bret_inst <= 1'b0;
      else 
        wait_for_one_post_bret_inst <= (~hbreak_enabled & oci_single_step_mode) ? 1'b1  : (F_valid | ~oci_single_step_mode) ? 1'b0  : wait_for_one_post_bret_inst;
    end