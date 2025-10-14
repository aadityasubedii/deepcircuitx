assign xRXD_STATE      = rxd_state == RXD_IDLE       ? "RXD_IDLE"      :
                         rxd_state == RXD_START      ? "RXD_START"     :
                         rxd_state == RXD_START_MID1 ? "RXD_START_MID1":
                         rxd_state == RXD_START_MID  ? "RXD_START_MID" :
                         rxd_state == RXD_DATA0      ? "RXD_DATA0"     :
                         rxd_state == RXD_DATA1      ? "RXD_DATA1"     :
                         rxd_state == RXD_DATA2      ? "RXD_DATA2"     :
                         rxd_state == RXD_DATA3      ? "RXD_DATA3"     :
                         rxd_state == RXD_DATA4      ? "RXD_DATA4"     :
                         rxd_state == RXD_DATA5      ? "RXD_DATA5"     :
                         rxd_state == RXD_DATA6      ? "RXD_DATA6"     :
                         rxd_state == RXD_DATA7      ? "RXD_DATA7"     :
                         rxd_state == RXD_STOP       ? "RXD_STOP"      :
                                                       "UNKNOWN"       ;
