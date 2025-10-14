assign TxDoneOut  = CtrlMux? ((~TxStartFrmIn) & (~BlockTxDone) & MuxedDone) : 
                             ((~TxStartFrmIn) & (~BlockTxDone) & TxDoneIn);