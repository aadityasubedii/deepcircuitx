  generate
  genvar i;
  genvar j;
    for (i = 0; i < RANKS; i = i + 1) begin: rank_final_loop
       reg [5:0] final_do_cand [RANKS-1:0];
       
       
       if (HIGHEST_BANK == 3) begin