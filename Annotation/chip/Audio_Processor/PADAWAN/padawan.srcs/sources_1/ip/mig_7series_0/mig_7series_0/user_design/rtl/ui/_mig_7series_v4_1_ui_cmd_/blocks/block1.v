  assign size = app_rdy_r
                  ? app_sz_r1
                  : app_sz_r2;
  assign cmd = app_rdy_r
                 ? app_cmd_r1
                 : app_cmd_r2;
  assign hi_priority = app_rdy_r
                         ? app_hi_pri_r1
                         : app_hi_pri_r2;

  wire request_accepted = use_addr_lcl && app_rdy_r;
  wire rd = app_cmd_r2[1:0] == 2'b01;
  wire wr = app_cmd_r2[1:0] == 2'b00;
  wire wr_bytes = app_cmd_r2[1:0] == 2'b11;
  wire write = wr || wr_bytes;
  output wire rd_accepted;
  assign rd_accepted = request_accepted && rd;
  output wire wr_accepted;
  assign wr_accepted = request_accepted && write;

  input [DATA_BUF_ADDR_WIDTH-1:0] wr_data_buf_addr;
  input [DATA_BUF_ADDR_WIDTH-1:0] rd_data_buf_addr_r;
  output wire [DATA_BUF_ADDR_WIDTH-1:0] data_buf_addr;

  assign data_buf_addr = ~write ? rd_data_buf_addr_r : wr_data_buf_addr;