  input [8:0] po_counter_read_val;
  reg ocd_cntlr2stg2_dec_r;
  output ocd_cntlr2stg2_dec;
  assign ocd_cntlr2stg2_dec = ocd_cntlr2stg2_dec_r;
  input po_rdy;

  reg [3:0] po_rd_wait_ns, po_rd_wait_r;