assign IncrementByteCnt = StateData[1] & ~ByteCntMax
                        | StateBackOff & (&NibCnt[6:0])
                        | (StatePAD | StateFCS) & NibCnt[0] & ~ByteCntMax;