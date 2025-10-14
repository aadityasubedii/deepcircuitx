module lab7_soc_jtag_uart_0 (
                              
                               av_address,
                               av_chipselect,
                               av_read_n,
                               av_write_n,
                               av_writedata,
                               clk,
                               rst_n,

                              
                               av_irq,
                               av_readdata,
                               av_waitrequest,
                               dataavailable,
                               readyfordata
                            )
   ;

  output           av_irq;
  output  [ 31: 0] av_readdata;
  output           av_waitrequest;
  output           dataavailable;
  output           readyfordata;
  input            av_address;
  input            av_chipselect;
  input            av_read_n;
  input            av_write_n;
  input   [ 31: 0] av_writedata;
  input            clk;
  input            rst_n;


reg              ac;
wire             activity;
wire             av_irq;
wire    [ 31: 0] av_readdata;
reg              av_waitrequest;
reg              dataavailable;
reg              fifo_AE;
reg              fifo_AF;
wire             fifo_EF;
wire             fifo_FF;
wire             fifo_clear;
wire             fifo_rd;
wire    [  7: 0] fifo_rdata;
wire    [  7: 0] fifo_wdata;
reg              fifo_wr;
reg              ien_AE;
reg              ien_AF;
wire             ipen_AE;
wire             ipen_AF;
reg              pause_irq;
wire    [  7: 0] r_dat;
wire             r_ena;
reg              r_val;
wire             rd_wfifo;
reg              read_0;
reg              readyfordata;
wire             rfifo_full;
wire    [  5: 0] rfifo_used;
reg              rvalid;
reg              sim_r_ena;
reg              sim_t_dat;
reg              sim_t_ena;
reg              sim_t_pause;
wire    [  7: 0] t_dat;
reg              t_dav;
wire             t_ena;
wire             t_pause;
wire             wfifo_empty;
wire    [  5: 0] wfifo_used;
reg              woverflow;
wire             wr_rfifo;
  
  assign rd_wfifo = r_ena & ~wfifo_empty;
  assign wr_rfifo = t_ena & ~rfifo_full;
  assign fifo_clear = ~rst_n;
  lab7_soc_jtag_uart_0_scfifo_w the_lab7_soc_jtag_uart_0_scfifo_w
    (
      .clk         (clk),
      .fifo_FF     (fifo_FF),
      .fifo_clear  (fifo_clear),
      .fifo_wdata  (fifo_wdata),
      .fifo_wr     (fifo_wr),
      .r_dat       (r_dat),
      .rd_wfifo    (rd_wfifo),
      .wfifo_empty (wfifo_empty),
      .wfifo_used  (wfifo_used)
    );

  lab7_soc_jtag_uart_0_scfifo_r the_lab7_soc_jtag_uart_0_scfifo_r
    (
      .clk        (clk),
      .fifo_EF    (fifo_EF),
      .fifo_clear (fifo_clear),
      .fifo_rd    (fifo_rd),
      .fifo_rdata (fifo_rdata),
      .rfifo_full (rfifo_full),
      .rfifo_used (rfifo_used),
      .rst_n      (rst_n),
      .t_dat      (t_dat),
      .wr_rfifo   (wr_rfifo)
    );

  assign ipen_AE = ien_AE & fifo_AE;
  assign ipen_AF = ien_AF & (pause_irq | fifo_AF);
  assign av_irq = ipen_AE | ipen_AF;