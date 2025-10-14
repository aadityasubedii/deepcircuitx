eth_rxethmac rxethmac1
(
  .MRxClk(mrx_clk_pad_i),               .MRxDV(MRxDV_Lb),                     .MRxD(MRxD_Lb),
  .Transmitting(Transmitting),          .HugEn(r_HugEn),                      .DlyCrcEn(r_DlyCrcEn), 
  .MaxFL(r_MaxFL),                      .r_IFG(r_IFG),                        .Reset(wb_rst_i),
  .RxData(RxData),                      .RxValid(RxValid),                    .RxStartFrm(RxStartFrm), 
  .RxEndFrm(RxEndFrm),                  .ByteCnt(RxByteCnt), 
  .ByteCntEq0(RxByteCntEq0),            .ByteCntGreat2(RxByteCntGreat2),      .ByteCntMaxFrame(RxByteCntMaxFrame), 
  .CrcError(RxCrcError),                .StateIdle(RxStateIdle),              .StatePreamble(RxStatePreamble), 
  .StateSFD(RxStateSFD),                .StateData(RxStateData),
  .MAC(r_MAC),                          .r_Pro(r_Pro),                        .r_Bro(r_Bro),
  .r_HASH0(r_HASH0),                    .r_HASH1(r_HASH1),                    .RxAbort(RxAbort), 
  .AddressMiss(AddressMiss),            .PassAll(r_PassAll),                  .ControlFrmAddressOK(ControlFrmAddressOK)
);