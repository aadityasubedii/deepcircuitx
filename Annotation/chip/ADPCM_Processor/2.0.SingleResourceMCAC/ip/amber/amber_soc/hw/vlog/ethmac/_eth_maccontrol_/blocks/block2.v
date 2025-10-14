eth_receivecontrol receivecontrol1 
(
 .MTxClk(MTxClk), .MRxClk(MRxClk), .TxReset(TxReset), .RxReset(RxReset), .RxData(RxData), 
 .RxValid(RxValid), .RxStartFrm(RxStartFrm), .RxEndFrm(RxEndFrm), .RxFlow(RxFlow), 
 .ReceiveEnd(ReceiveEnd), .MAC(MAC), .DlyCrcEn(DlyCrcEn), .TxDoneIn(TxDoneIn), 
 .TxAbortIn(TxAbortIn), .TxStartFrmOut(TxStartFrmOut), .ReceivedLengthOK(ReceivedLengthOK), 
 .ReceivedPacketGood(ReceivedPacketGood), .TxUsedDataOutDetected(TxUsedDataOutDetected), 
 .Pause(Pause), .ReceivedPauseFrm(ReceivedPauseFrm), .AddressOK(ControlFrmAddressOK), 
 .r_PassAll(r_PassAll), .RxStatusWriteLatched_sync2(RxStatusWriteLatched_sync2), .SetPauseTimer(SetPauseTimer)
);