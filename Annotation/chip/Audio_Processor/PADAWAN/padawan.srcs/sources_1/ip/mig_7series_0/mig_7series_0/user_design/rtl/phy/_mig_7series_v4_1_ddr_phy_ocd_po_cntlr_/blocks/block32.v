  wire signed [8:0] stg2_target_ns = $signed({3'b0, wl_po_fine_cnt_sel}) + stg2_steps;
  reg signed [8:0] stg2_target_r;