  localparam WR_BUF_WIDTH = 
               APP_DATA_WIDTH + APP_MASK_WIDTH + (ECC_TEST == "OFF" ? 0 : 2*nCK_PER_CLK);
  localparam FULL_RAM_CNT = (WR_BUF_WIDTH/6);
  localparam REMAINDER = WR_BUF_WIDTH % 6;
  localparam RAM_CNT = FULL_RAM_CNT + ((REMAINDER == 0 ) ? 0 : 1);
  localparam RAM_WIDTH = (RAM_CNT*6);
  wire [RAM_WIDTH-1:0] wr_buf_out_data_w;