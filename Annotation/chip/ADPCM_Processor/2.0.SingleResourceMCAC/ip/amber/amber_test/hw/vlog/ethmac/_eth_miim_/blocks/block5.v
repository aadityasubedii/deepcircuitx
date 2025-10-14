assign ByteSelect[0] = InProgress & ((NoPre & (BitCounter == 7'h0)) | (~NoPre & (BitCounter == 7'h20)));
assign ByteSelect[1] = InProgress & (BitCounter == 7'h28);
assign ByteSelect[2] = InProgress & WriteOp & (BitCounter == 7'h30);
assign ByteSelect[3] = InProgress & WriteOp & (BitCounter == 7'h38);