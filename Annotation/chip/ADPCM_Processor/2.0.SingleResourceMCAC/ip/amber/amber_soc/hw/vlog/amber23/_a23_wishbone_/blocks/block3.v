wire    [(14*8)-1:0]   xAS_STATE;


assign xAS_STATE  = wishbone_st == WB_IDLE       ? "WB_IDLE"       :
                    wishbone_st == WB_BURST1     ? "WB_BURST1"     :
                    wishbone_st == WB_BURST2     ? "WB_BURST2"     :
                    wishbone_st == WB_BURST3     ? "WB_BURST3"     :
                    wishbone_st == WB_WAIT_ACK   ? "WB_WAIT_ACK"   :
                                                      "UNKNOWN"       ;