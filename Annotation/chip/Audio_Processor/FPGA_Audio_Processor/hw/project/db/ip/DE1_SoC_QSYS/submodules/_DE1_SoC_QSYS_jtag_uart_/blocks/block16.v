module DE1_SoC_QSYS_jtag_uart_sim_scfifo_r (
                                             
                                              clk,
                                              fifo_rd,
                                              rst_n,

                                             
                                              fifo_EF,
                                              fifo_rdata,
                                              rfifo_full,
                                              rfifo_used
                                           )
;

  output           fifo_EF;
  output  [  7: 0] fifo_rdata;
  output           rfifo_full;
  output  [  5: 0] rfifo_used;
  input            clk;
  input            fifo_rd;
  input            rst_n;
