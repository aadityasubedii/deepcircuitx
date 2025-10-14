always@(CrcHash or IntHash)
begin
  case(CrcHash[4:3])
    2'b00: ByteHash = IntHash[7:0];
    2'b01: ByteHash = IntHash[15:8];
    2'b10: ByteHash = IntHash[23:16];
    2'b11: ByteHash = IntHash[31:24];
  endcase
end