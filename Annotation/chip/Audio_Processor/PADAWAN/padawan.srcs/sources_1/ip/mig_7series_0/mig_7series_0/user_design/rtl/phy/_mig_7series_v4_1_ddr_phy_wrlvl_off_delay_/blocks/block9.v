  always @(posedge clk) begin
    po_delay_done_r1 <= #TCQ po_delay_done;
    po_delay_done_r2 <= #TCQ po_delay_done_r1;
    po_delay_done_r3 <= #TCQ po_delay_done_r2;
    po_delay_done_r4 <= #TCQ po_delay_done_r3;
  end