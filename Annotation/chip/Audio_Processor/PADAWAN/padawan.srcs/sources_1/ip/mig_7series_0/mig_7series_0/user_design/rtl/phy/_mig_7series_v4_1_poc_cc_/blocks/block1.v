  always @(*) begin
    if (rst) dbg_poc_ns = 'b0;
    else begin
      dbg_poc_ns = dbg_poc_r[899:100];
      if (mmcm_edge_detect_rdy && lane < 8) begin
	dbg_poc_ns[(lane+1)*100] = poc_backup;
	dbg_poc_ns[(lane+1)*100+1] = dbg_poc_ns[(lane+1)*100+1] || run_too_small;
        dbg_poc_ns[(lane+1)*100+10+:TAPCNTRWIDTH] = left;
        dbg_poc_ns[(lane+1)*100+20+:TAPCNTRWIDTH] = right;
	dbg_poc_ns[(lane+1)*100+30+:TAPCNTRWIDTH+1] = window_center;
	dbg_poc_ns[(lane+1)*100+41+:TAPCNTRWIDTH+1] = edge_center;
      end
    end
  end