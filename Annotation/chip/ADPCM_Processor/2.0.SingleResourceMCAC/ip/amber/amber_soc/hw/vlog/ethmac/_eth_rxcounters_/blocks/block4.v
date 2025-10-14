assign ResetIFGCounter = StateSFD  &  MRxDV & MRxDEqD | StateDrop;

assign IncrementIFGCounter = ~ResetIFGCounter & (StateDrop | StateIdle | StatePreamble | StateSFD) & ~IFGCounterEq24;