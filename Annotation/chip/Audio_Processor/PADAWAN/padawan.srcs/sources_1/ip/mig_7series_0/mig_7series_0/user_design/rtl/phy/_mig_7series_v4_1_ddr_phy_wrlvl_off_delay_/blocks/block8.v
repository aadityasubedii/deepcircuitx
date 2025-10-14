  always @(posedge clk) begin
    po_s2_incdec_f <= #TCQ po_stg2_f_incdec;
    po_en_s2_f <= #TCQ po_en_stg2_f;
  end