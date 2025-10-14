  afifo #
   (.TCQ           (TCQ),
    .DSIZE         (38),
    .FIFO_DEPTH    (16),
    .ASIZE         (4),
    .SYNC          (1)  


   )
   cmd_fifo
   (
    .wr_clk        (clk_i),
    .rst           (rst_ra[0]),
    .wr_en         (cmd_fifo_wr),
    .wr_data       ({cmd2flow_bl,cmd2flow_addr}),
    .rd_en         (cmd_fifo_rd),
    .rd_clk        (clk_i),
    .rd_data       ({xfer_cmd_bl,xfer_addr}),
    .full          (cmd_fifo_full),
    .empty         (cmd_fifo_empty)

   );
