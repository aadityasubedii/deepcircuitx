module rf_encoder (
    input  rst_n, clk2x, din, enable,
    output manch_out, miller_out, fmiller_out
);

manchester_encoder(
    .rst_n(rst_n),
    .clk2x(clk2x),
    .din(din),
    .enable(enable),
    .dout(manch_out)
);

miller_encoder(
    .rst_n(rst_n),
    .clk2x(clk2x),
    .din(din),
    .enable(enable),
    .dout(miller_out)    
);

fmiller_encoder(
    .rst_n(rst_n),
    .clk2x(clk2x),
    .din(din),
    .enable(enable),
    .dout(fmiller_out)    
);

endmodule