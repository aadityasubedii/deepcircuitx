   afifo #
   (
    .TCQ           (TCQ),
    .DSIZE         (DWIDTH),
    .FIFO_DEPTH    (32),
    .ASIZE         (5),
    .SYNC          (1)  
   
   
   )
   rd_mdata_fifo
   (
    .wr_clk        (clk_i),
    .rst           (rst_i[0]),
    .wr_en         (data_valid_i),
    .wr_data       (data_i),
    .rd_en         (rd_mdata_en),
    .rd_clk        (clk_i),
    .rd_data       (rd_v6_mdata),
    .full          (),
    .empty         (rd_mdata_fifo_empty),
    .almost_full   ()
   );