  generate
    case ({(nCK_PER_CLK == 4), (nCK_PER_CLK == 2), (ADDR_CMD_MODE == "2T")})
      3'b000 : begin : one_one_not2T
      end
      3'b001 : begin : one_one_2T
      end
      3'b010 : begin : two_one_not2T