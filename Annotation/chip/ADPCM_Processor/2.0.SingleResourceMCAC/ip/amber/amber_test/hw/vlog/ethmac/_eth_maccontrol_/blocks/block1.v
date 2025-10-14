eth_transmitcontrol transmitcontrol1
(
 .MTxClk(MTxClk), .TxReset(TxReset), .TxUsedDataIn(TxUsedDataIn), .TxUsedDataOut(TxUsedDataOut), 
 .TxDoneIn(TxDoneIn), .TxAbortIn(TxAbortIn), .TxStartFrmIn(TxStartFrmIn), .TPauseRq(TPauseRq), 
 .TxUsedDataOutDetected(TxUsedDataOutDetected), .TxFlow(TxFlow), .DlyCrcEn(DlyCrcEn), .TxPauseTV(TxPauseTV), 
 .MAC(MAC), .TxCtrlStartFrm(TxCtrlStartFrm), .TxCtrlEndFrm(TxCtrlEndFrm), .SendingCtrlFrm(SendingCtrlFrm), 
 .CtrlMux(CtrlMux), .ControlData(ControlData), .WillSendControlFrame(WillSendControlFrame), .BlockTxDone(BlockTxDone)
);