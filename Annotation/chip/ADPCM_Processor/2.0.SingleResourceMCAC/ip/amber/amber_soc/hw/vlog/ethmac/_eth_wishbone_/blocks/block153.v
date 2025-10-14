assign ram_ce = 1'b1;
assign ram_we = (BDWrite & {4{(WbEn & WbEn_q)}}) | {4{(TxStatusWrite | RxStatusWrite)}};
assign ram_oe = BDRead & WbEn & WbEn_q | TxEn & TxEn_q & (TxBDRead | TxPointerRead) | RxEn & RxEn_q & (RxBDRead | RxPointerRead);