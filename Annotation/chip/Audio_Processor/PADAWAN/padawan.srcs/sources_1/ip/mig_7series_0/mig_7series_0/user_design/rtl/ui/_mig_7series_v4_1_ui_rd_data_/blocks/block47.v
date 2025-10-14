  localparam RD_BUF_WIDTH = APP_DATA_WIDTH + (ECC == "OFF" ? 0 : 2*2*nCK_PER_CLK);
  localparam FULL_RAM_CNT = (RD_BUF_WIDTH/6);
  localparam REMAINDER = RD_BUF_WIDTH % 6;
  localparam RAM_CNT = FULL_RAM_CNT + ((REMAINDER == 0 ) ? 0 : 1);
  localparam RAM_WIDTH = (RAM_CNT*6);