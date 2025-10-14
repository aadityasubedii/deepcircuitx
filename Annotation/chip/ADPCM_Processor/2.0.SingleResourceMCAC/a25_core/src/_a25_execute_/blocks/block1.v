assign  xMODE  =  status_bits_mode == SVC  ? "SVC"  :
                  status_bits_mode == IRQ  ? "IRQ"  :
                  status_bits_mode == FIRQ ? "FIRQ" :
                  status_bits_mode == USR  ? "USR"  :
                                             "XXX"  ;