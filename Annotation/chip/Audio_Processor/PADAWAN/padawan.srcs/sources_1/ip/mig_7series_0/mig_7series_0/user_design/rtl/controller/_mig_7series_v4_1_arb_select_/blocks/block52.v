  generate
    if((nCK_PER_CLK == 4) && (ADDR_CMD_MODE != "2T")) begin : pre_mux
      reg [OUT_CMD_WIDTH-1:0] pre_cmd_r = {OUT_CMD_WIDTH {1'b0}};