assign TempTxBDAddress[7:1] = {7{ TxStatusWrite     & ~WrapTxStatusBit}}   & (TxBDAddress + 1'b1) ; 
assign TempRxBDAddress[7:1] = {7{ WrapRxStatusBit}} & (r_TxBDNum[6:0])     | 
                              {7{~WrapRxStatusBit}} & (RxBDAddress + 1'b1) ; 