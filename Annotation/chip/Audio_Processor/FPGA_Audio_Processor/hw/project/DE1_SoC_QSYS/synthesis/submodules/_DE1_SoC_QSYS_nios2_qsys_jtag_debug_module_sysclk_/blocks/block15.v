  always @(posedge clk)
    begin
      sync2_udr <= sync_udr;
      update_jdo_strobe <= sync_udr & ~sync2_udr;
      enable_action_strobe <= update_jdo_strobe;
      sync2_uir <= sync_uir;
      jxuir <= sync_uir & ~sync2_uir;
    end