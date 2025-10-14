always @ (posedge WB_CLK_I)
begin
  WB_ACK_O <=#Tp (|BDWrite) & WbEn & WbEn_q | BDRead & WbEn & ~WbEn_q;
end