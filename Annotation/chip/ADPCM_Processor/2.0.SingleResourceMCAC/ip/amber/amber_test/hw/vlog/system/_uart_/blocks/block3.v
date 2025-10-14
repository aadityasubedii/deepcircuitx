assign xTXD_STATE      = txd_state == TXD_IDLE       ? "TXD_IDLE"   :
                         txd_state == TXD_START      ? "TXD_START"  :
                         txd_state == TXD_DATA0      ? "TXD_DATA0"  :
                         txd_state == TXD_DATA1      ? "TXD_DATA1"  :
                         txd_state == TXD_DATA2      ? "TXD_DATA2"  :
                         txd_state == TXD_DATA3      ? "TXD_DATA3"  :
                         txd_state == TXD_DATA4      ? "TXD_DATA4"  :
                         txd_state == TXD_DATA5      ? "TXD_DATA5"  :
                         txd_state == TXD_DATA6      ? "TXD_DATA6"  :
                         txd_state == TXD_DATA7      ? "TXD_DATA7"  :
                         txd_state == TXD_STOP1      ? "TXD_STOP1"  :
                         txd_state == TXD_STOP2      ? "TXD_STOP2"  :
                         txd_state == TXD_STOP3      ? "TXD_STOP3"  :
                                                       "UNKNOWN"    ;
