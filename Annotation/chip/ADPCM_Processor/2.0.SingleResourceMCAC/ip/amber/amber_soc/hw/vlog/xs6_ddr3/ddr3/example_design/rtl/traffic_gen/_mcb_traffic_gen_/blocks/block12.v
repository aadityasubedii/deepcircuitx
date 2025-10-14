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
    .rst           (rst_rb[0]),
    .wr_en         (!mcb_rd_empty),
    .wr_data       (mcb_rd_data_i),
    .rd_en         (mcb_rd_en_o),
    .rd_clk        (clk_i),
    .rd_data       (rd_v6_mdata),
    .full          (),
    .almost_full   (rd_mdata_fifo_afull),
    .empty         (rd_mdata_fifo_empty)
   
   );