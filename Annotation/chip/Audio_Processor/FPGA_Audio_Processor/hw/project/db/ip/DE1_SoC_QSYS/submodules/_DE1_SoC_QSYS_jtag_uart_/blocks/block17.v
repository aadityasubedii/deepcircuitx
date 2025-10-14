

module DE1_SoC_QSYS_jtag_uart_scfifo_w (
                                         
                                          clk,
                                          fifo_clear,
                                          fifo_wdata,
                                          fifo_wr,
                                          rd_wfifo,

                                         
                                          fifo_FF,
                                          r_dat,
                                          wfifo_empty,
                                          wfifo_used
                                       )
;

  output           fifo_FF;
  output  [  7: 0] r_dat;
  output           wfifo_empty;
  output  [  5: 0] wfifo_used;
  input            clk;
  input            fifo_clear;
  input   [  7: 0] fifo_wdata;
  input            fifo_wr;
  input            rd_wfifo;


wire             fifo_FF;
wire    [  7: 0] r_dat;
wire             wfifo_empty;
wire    [  5: 0] wfifo_used;



  DE1_SoC_QSYS_jtag_uart_sim_scfifo_w the_DE1_SoC_QSYS_jtag_uart_sim_scfifo_w
    (
      .clk         (clk),
      .fifo_FF     (fifo_FF),
      .fifo_wdata  (fifo_wdata),
      .fifo_wr     (fifo_wr),
      .r_dat       (r_dat),
      .wfifo_empty (wfifo_empty),
      .wfifo_used  (wfifo_used)
    );