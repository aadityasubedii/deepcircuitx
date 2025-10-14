generate
  if(CKE_ODT_AUX == "FALSE")begin
    assign mc_cke[0] = cke0;
    assign mc_cke[1] = cke_ns;
    if(nCK_PER_CLK == 4) begin
      assign mc_cke[2] = cke_ns;
      assign mc_cke[3] = cke_ns;
    end
  end
endgenerate