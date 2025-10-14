  generate
    begin
      if (MEM_ADDR_ORDER == "TG_TEST")
      begin
        assign col[4:0] = app_rdy_r
                      ? app_addr_r1[0+:5]
                      : app_addr_r2[0+:5];

        if (RANKS==1)
        begin
          assign col[COL_WIDTH-1:COL_WIDTH-2] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+:2]
                        : app_addr_r2[5+3+BANK_WIDTH+:2];
          assign col[COL_WIDTH-3:5] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+2+2+:COL_WIDTH-7]
                        : app_addr_r2[5+3+BANK_WIDTH+2+2+:COL_WIDTH-7];
        end
        else
        begin
          assign col[COL_WIDTH-1:COL_WIDTH-2] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+RANK_WIDTH+:2]
                        : app_addr_r2[5+3+BANK_WIDTH+RANK_WIDTH+:2];
          assign col[COL_WIDTH-3:5] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+RANK_WIDTH+2+2+:COL_WIDTH-7]
                        : app_addr_r2[5+3+BANK_WIDTH+RANK_WIDTH+2+2+:COL_WIDTH-7];
        end
        assign row[2:0] = app_rdy_r
                       ? app_addr_r1[5+:3]
                       : app_addr_r2[5+:3];
        if (RANKS==1)  
        begin
          assign row[ROW_WIDTH-1:ROW_WIDTH-2] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+2+:2]
                         : app_addr_r2[5+3+BANK_WIDTH+2+:2];
          assign row[ROW_WIDTH-3:3] = app_rdy_r
                         ? app_addr_r1[5+3+BANK_WIDTH+2+2+COL_WIDTH-7+:ROW_WIDTH-5]
                         : app_addr_r2[5+3+BANK_WIDTH+2+2+COL_WIDTH-7+:ROW_WIDTH-5];
        end
        else
        begin
          assign row[ROW_WIDTH-1:ROW_WIDTH-2] = app_rdy_r
                        ? app_addr_r1[5+3+BANK_WIDTH+RANK_WIDTH+2+:2]
                         : app_addr_r2[5+3+BANK_WIDTH+RANK_WIDTH+2+:2];
          assign row[ROW_WIDTH-3:3] = app_rdy_r
                         ? app_addr_r1[5+3+BANK_WIDTH+RANK_WIDTH+2+2+COL_WIDTH-7+:ROW_WIDTH-5]
                         : app_addr_r2[5+3+BANK_WIDTH+RANK_WIDTH+2+2+COL_WIDTH-7+:ROW_WIDTH-5];
        end
        assign bank = app_rdy_r
                       ? app_addr_r1[5+3+:BANK_WIDTH]
                       : app_addr_r2[5+3+:BANK_WIDTH];
        assign rank = (RANKS == 1)
                        ? 1'b0
                        : app_rdy_r
                          ? app_addr_r1[5+3+BANK_WIDTH+:RANK_WIDTH]
                          : app_addr_r2[5+3+BANK_WIDTH+:RANK_WIDTH];
      end
      else if (MEM_ADDR_ORDER == "ROW_BANK_COLUMN")
      begin
        assign col = app_rdy_r
                      ? app_addr_r1[0+:COL_WIDTH]
                      : app_addr_r2[0+:COL_WIDTH];
        assign row = app_rdy_r
                       ? app_addr_r1[COL_WIDTH+BANK_WIDTH+:ROW_WIDTH]
                       : app_addr_r2[COL_WIDTH+BANK_WIDTH+:ROW_WIDTH];
        assign bank = app_rdy_r
                        ? app_addr_r1[COL_WIDTH+:BANK_WIDTH]
                        : app_addr_r2[COL_WIDTH+:BANK_WIDTH];
        assign rank = (RANKS == 1)
                        ? 1'b0
                        : app_rdy_r
                          ? app_addr_r1[COL_WIDTH+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH]
                          : app_addr_r2[COL_WIDTH+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH];
      end
      else
      begin
        assign col = app_rdy_r
                      ? app_addr_r1[0+:COL_WIDTH]
                      : app_addr_r2[0+:COL_WIDTH];
        assign row = app_rdy_r
                       ? app_addr_r1[COL_WIDTH+:ROW_WIDTH]
                       : app_addr_r2[COL_WIDTH+:ROW_WIDTH];
        assign bank = app_rdy_r
                        ? app_addr_r1[COL_WIDTH+ROW_WIDTH+:BANK_WIDTH]
                        : app_addr_r2[COL_WIDTH+ROW_WIDTH+:BANK_WIDTH];
        assign rank = (RANKS == 1)
                        ? 1'b0
                        : app_rdy_r
                          ? app_addr_r1[COL_WIDTH+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH]
                          : app_addr_r2[COL_WIDTH+ROW_WIDTH+BANK_WIDTH+:RANK_WIDTH];
      end
     end
  endgenerate