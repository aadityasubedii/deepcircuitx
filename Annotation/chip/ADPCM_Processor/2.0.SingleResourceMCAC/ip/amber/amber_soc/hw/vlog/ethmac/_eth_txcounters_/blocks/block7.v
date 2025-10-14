assign ExcessiveDeferCnt = NibCnt[13:0] == 16'h17b7;

assign ExcessiveDefer  = NibCnt[13:0] == 16'h17b7 & ~ExDfrEn;   