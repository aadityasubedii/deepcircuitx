eth_txethmac txethmac1
(
  .MTxClk(mtx_clk_pad_i),             .Reset(wb_rst_i),                   .CarrierSense(TxCarrierSense), 
  .Collision(Collision),              .TxData(TxDataOut),                 .TxStartFrm(TxStartFrmOut), 
  .TxUnderRun(TxUnderRun),            .TxEndFrm(TxEndFrmOut),             .Pad(PadOut),  
  .MinFL(r_MinFL),                    .CrcEn(CrcEnOut),                   .FullD(r_FullD), 
  .HugEn(r_HugEn),                    .DlyCrcEn(r_DlyCrcEn),              .IPGT(r_IPGT), 
  .IPGR1(r_IPGR1),                    .IPGR2(r_IPGR2),                    .CollValid(r_CollValid), 
  .MaxRet(r_MaxRet),                  .NoBckof(r_NoBckof),                .ExDfrEn(r_ExDfrEn), 
  .MaxFL(r_MaxFL),                    .MTxEn(mtxen_pad_o),                .MTxD(mtxd_pad_o), 
  .MTxErr(mtxerr_pad_o),              .TxUsedData(TxUsedDataIn),          .TxDone(TxDoneIn), 
  .TxRetry(TxRetry),                  .TxAbort(TxAbortIn),                .WillTransmit(WillTransmit), 
  .ResetCollision(ResetCollision),    .RetryCnt(RetryCnt),                .StartTxDone(StartTxDone), 
  .StartTxAbort(StartTxAbort),        .MaxCollisionOccured(MaxCollisionOccured), .LateCollision(LateCollision),   
  .DeferIndication(DeferIndication),  .StatePreamble(StatePreamble),      .StateData(StateData)   
);