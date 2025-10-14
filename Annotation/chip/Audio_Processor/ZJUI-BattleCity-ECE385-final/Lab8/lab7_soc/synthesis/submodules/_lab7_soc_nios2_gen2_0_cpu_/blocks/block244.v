  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
          oci_ienable <= 32'b00000000000000000000000000000001;
      else if (take_action_oci_intr_mask_reg)
          oci_ienable <= writedata | ~(32'b00000000000000000000000000000001);
    end