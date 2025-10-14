module DE1_SoC_QSYS_jtag_uart_scfifo_r (
                                         
                                          clk,
                                          fifo_clear,
                                          fifo_rd,
                                          rst_n,
                                          t_dat,
                                          wr_rfifo,

                                         
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
  input            fifo_clear;
  input            fifo_rd;
  input            rst_n;
  input   [  7: 0] t_dat;
  input            wr_rfifo;


wire             fifo_EF;
wire    [  7: 0] fifo_rdata;
wire             rfifo_full;
wire    [  5: 0] rfifo_used;



  DE1_SoC_QSYS_jtag_uart_sim_scfifo_r the_DE1_SoC_QSYS_jtag_uart_sim_scfifo_r
    (
      .clk        (clk),
      .fifo_EF    (fifo_EF),
      .fifo_rd    (fifo_rd),
      .fifo_rdata (fifo_rdata),
      .rfifo_full (rfifo_full),
      .rfifo_used (rfifo_used),
      .rst_n      (rst_n)
    );