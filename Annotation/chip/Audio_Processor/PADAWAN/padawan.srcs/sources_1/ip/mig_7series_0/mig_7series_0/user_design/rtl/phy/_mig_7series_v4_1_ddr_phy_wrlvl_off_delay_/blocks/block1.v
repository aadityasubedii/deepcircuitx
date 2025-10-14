  always @(posedge clk) begin
    po_s2_incdec_c <= #TCQ po_stg2_incdec_c;
    po_en_s2_c <= #TCQ po_en_stg2_c;
    ctl_lane_cnt <= #TCQ lane_cnt_dqs_c_r;
  end