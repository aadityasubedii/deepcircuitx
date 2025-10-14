   rd_fifo
   (
    .wr_clk        (clk_i),
    .rst           (rst_i),
    .wr_en         (wr_en),
    .wr_data       ({bl_i,addr_i}),
    .rd_en         (rd_en),
    .rd_clk        (clk_i),
    .rd_data       ({gen_bl_o,gen_addr_o}),
    .full          (full),
    .empty         (empty),
    .almost_full   ()
   
   );