assign r_MaxRet[3:0]      = COLLCONFOut[19:16];
assign r_CollValid[5:0]   = COLLCONFOut[5:0];

assign r_TxFlow           = CTRLMODEROut[2];
assign r_RxFlow           = CTRLMODEROut[1];
assign r_PassAll          = CTRLMODEROut[0];