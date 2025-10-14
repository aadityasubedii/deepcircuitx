generate
  for (i = 0; i <= 5; i = i+1) begin : ddr_ck_gen_loop
    if (PO_DATA_CTL== "FALSE" && (BYTELANES_DDR_CK[i*4+PHASER_INDEX])) begin : ddr_ck_gen
      ODDR #(.DDR_CLK_EDGE  (ODDR_CLK_EDGE))
        ddr_ck (
        .C    (oserdes_clk),
        .R    (1'b0),
        .S    (),
        .D1   (1'b0),
        .D2   (1'b1),
        .CE   (1'b1),
        .Q    (ddr_ck_out_q[i])
      );
      OBUFDS ddr_ck_obuf  (.I(ddr_ck_out_q[i]), .O(ddr_ck_out[i*2]), .OB(ddr_ck_out[i*2+1]));
    end 
    else  begin : ddr_ck_null
      assign ddr_ck_out[i*2+1:i*2] = 2'b0;
    end
  end 
endgenerate