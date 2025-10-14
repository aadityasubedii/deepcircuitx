assign TxStartFrmOut = CtrlMux? TxCtrlStartFrm : (TxStartFrmIn & ~Pause);
