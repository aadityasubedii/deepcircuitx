   generate
   genvar cnt;
   if (RANKS == 2) begin 
     for(cnt = 0; cnt < DQS_WIDTH; cnt = cnt +1) begin: coarse_dqs_cnt
       always @(posedge clk) begin
         if (rst) begin
           