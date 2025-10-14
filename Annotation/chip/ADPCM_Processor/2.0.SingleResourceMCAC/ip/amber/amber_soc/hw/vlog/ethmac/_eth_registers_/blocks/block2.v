assign int_o = irq_txb  & INT_MASKOut[0] | 
               irq_txe  & INT_MASKOut[1] | 
               irq_rxb  & INT_MASKOut[2] | 
               irq_rxe  & INT_MASKOut[3] | 
               irq_busy & INT_MASKOut[4] | 
               irq_txc  & INT_MASKOut[5] | 
               irq_rxc  & INT_MASKOut[6] ;