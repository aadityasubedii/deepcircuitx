always @ (Address       or Read           or MODEROut       or INT_SOURCEOut  or
          INT_MASKOut   or IPGTOut        or IPGR1Out       or IPGR2Out       or
          PACKETLENOut  or COLLCONFOut    or CTRLMODEROut   or MIIMODEROut    or
          MIICOMMANDOut or MIIADDRESSOut  or MIITX_DATAOut  or MIIRX_DATAOut  or 
          MIISTATUSOut  or MAC_ADDR0Out   or MAC_ADDR1Out   or TX_BD_NUMOut   or
          HASH0Out      or HASH1Out       or TXCTRLOut       
         )
begin
  if(Read)  
    begin
      case(Address)
        `ETH_MODER_ADR        :  DataOut<=MODEROut;
        `ETH_INT_SOURCE_ADR   :  DataOut<=INT_SOURCEOut;
        `ETH_INT_MASK_ADR     :  DataOut<=INT_MASKOut;
        `ETH_IPGT_ADR         :  DataOut<=IPGTOut;
        `ETH_IPGR1_ADR        :  DataOut<=IPGR1Out;
        `ETH_IPGR2_ADR        :  DataOut<=IPGR2Out;
        `ETH_PACKETLEN_ADR    :  DataOut<=PACKETLENOut;
        `ETH_COLLCONF_ADR     :  DataOut<=COLLCONFOut;
        `ETH_CTRLMODER_ADR    :  DataOut<=CTRLMODEROut;
        `ETH_MIIMODER_ADR     :  DataOut<=MIIMODEROut;
        `ETH_MIICOMMAND_ADR   :  DataOut<=MIICOMMANDOut;
        `ETH_MIIADDRESS_ADR   :  DataOut<=MIIADDRESSOut;
        `ETH_MIITX_DATA_ADR   :  DataOut<=MIITX_DATAOut;
        `ETH_MIIRX_DATA_ADR   :  DataOut<=MIIRX_DATAOut;
        `ETH_MIISTATUS_ADR    :  DataOut<=MIISTATUSOut;
        `ETH_MAC_ADDR0_ADR    :  DataOut<=MAC_ADDR0Out;
        `ETH_MAC_ADDR1_ADR    :  DataOut<=MAC_ADDR1Out;
        `ETH_TX_BD_NUM_ADR    :  DataOut<=TX_BD_NUMOut;
        `ETH_HASH0_ADR        :  DataOut<=HASH0Out;
        `ETH_HASH1_ADR        :  DataOut<=HASH1Out;
        `ETH_TX_CTRL_ADR      :  DataOut<=TXCTRLOut;

        default:             DataOut<=32'h0;
      endcase
    end
  else
    DataOut<=32'h0;
end