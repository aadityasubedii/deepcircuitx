  generate if (CCENABLE == 0) begin : no_characterization
    assign samples = SAMPLES[SAMPCNTRWIDTH:0];
    assign samps_solid_thresh = SAMPS_SOLID_THRESH[SAMPCNTRWIDTH:0];
  end else begin : characterization
  end endgenerate