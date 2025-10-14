assign LatchByte1_d2 = InProgress & ~WriteOp & BitCounter == 7'h37;
assign LatchByte0_d2 = InProgress & ~WriteOp & BitCounter == 7'h3F;