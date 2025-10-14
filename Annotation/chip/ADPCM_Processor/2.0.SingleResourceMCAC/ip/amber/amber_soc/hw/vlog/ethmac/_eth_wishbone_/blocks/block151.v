always @ (posedge WB_CLK_I or posedge Reset)
begin
  if(Reset)
    begin
      WbEn <=#Tp 1'b1;
      RxEn <=#Tp 1'b0;
      TxEn <=#Tp 1'b0;
      ram_addr <=#Tp 8'h0;
      ram_di <=#Tp 32'h0;
      BDRead <=#Tp 1'b0;
      BDWrite <=#Tp 1'b0;
    end
  else
    begin
      
      case ({WbEn_q, RxEn_q, TxEn_q, RxEn_needed, TxEn_needed})  
        5'b100_10, 5'b100_11 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b1;  
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp {RxBDAddress, RxPointerRead};
            ram_di <=#Tp RxBDDataIn;
          end
        5'b100_01 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b1;  
            ram_addr <=#Tp {TxBDAddress, TxPointerRead};
            ram_di <=#Tp TxBDDataIn;
          end
        5'b010_00, 5'b010_10 :
          begin
            WbEn <=#Tp 1'b1;  
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs[3:0] & {4{WB_WE_I}};
            BDRead <=#Tp (|BDCs) & ~WB_WE_I;
          end
        5'b010_01, 5'b010_11 :
          begin
            WbEn <=#Tp 1'b0;
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b1;  
            ram_addr <=#Tp {TxBDAddress, TxPointerRead};
            ram_di <=#Tp TxBDDataIn;
          end
        5'b001_00, 5'b001_01, 5'b001_10, 5'b001_11 :
          begin
            WbEn <=#Tp 1'b1;  
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs[3:0] & {4{WB_WE_I}};
            BDRead <=#Tp (|BDCs) & ~WB_WE_I;
          end
        5'b100_00 :
          begin
            WbEn <=#Tp 1'b0;  
          end
        5'b000_00 :
          begin
            WbEn <=#Tp 1'b1;  
            RxEn <=#Tp 1'b0;
            TxEn <=#Tp 1'b0;
            ram_addr <=#Tp WB_ADR_I[9:2];
            ram_di <=#Tp WB_DAT_I;
            BDWrite <=#Tp BDCs[3:0] & {4{WB_WE_I}};
            BDRead <=#Tp (|BDCs) & ~WB_WE_I;
          end
      endcase
    end
end