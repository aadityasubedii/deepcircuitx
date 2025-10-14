always @ (RxPointerLSB_rst)
begin
  case(RxPointerLSB_rst[1:0])  
    2'h0 : RxByteSel[3:0] = 4'hf;
    2'h1 : RxByteSel[3:0] = 4'h7;
    2'h2 : RxByteSel[3:0] = 4'h3;
    2'h3 : RxByteSel[3:0] = 4'h1;
  endcase
end