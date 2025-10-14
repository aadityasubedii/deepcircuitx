assign NibCntEq7   = &NibCnt[2:0];
assign NibCntEq15  = &NibCnt[3:0];

assign NibbleMinFl = NibCnt >= (((MinFL-3'h4)<<1) -1);  

assign ExcessiveDeferCnt = NibCnt[13:0] == 16'h17b7;