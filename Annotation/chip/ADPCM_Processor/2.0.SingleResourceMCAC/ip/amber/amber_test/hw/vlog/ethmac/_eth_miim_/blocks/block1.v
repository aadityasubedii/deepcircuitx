eth_outputcontrol outctrl(.Clk(Clk), .Reset(Reset), .MdcEn_n(MdcEn_n), .InProgress(InProgress), 
                          .ShiftedBit(ShiftedBit), .BitCounter(BitCounter), .WriteOp(WriteOp), .NoPre(NoPre), 
                          .Mdo(Mdo), .MdoEn(MdoEn)
                         );