assign SetWriteRxDataToFifo = (RxValid & RxReady & ~RxStartFrm & RxEnableWindow & (&RxByteCnt)) | 
                              (RxValid & RxReady &  RxStartFrm & (&RxPointerLSB_rst))           | 
                              (ShiftWillEnd & LastByteIn & (&RxByteCnt));