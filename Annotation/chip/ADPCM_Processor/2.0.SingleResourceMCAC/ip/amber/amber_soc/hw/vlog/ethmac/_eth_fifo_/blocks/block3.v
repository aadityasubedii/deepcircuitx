assign empty = ~(|cnt);
assign almost_empty = cnt == 1;
assign full  = cnt == DEPTH;
assign almost_full  = &cnt[CNT_WIDTH-2:0];