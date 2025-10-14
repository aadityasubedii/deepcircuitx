generate 
if ((C_MEM_TYPE == "DDR" || C_MEM_TYPE == "DDR2" || C_MEM_TYPE == "DDR3") &&
     (SKIP_IN_TERM_CAL == 1'b0)
     ) begin : gen_zio

IOBUF IOBUF_ZIO (
    .O  (ZIO_IN),
    .IO (ZIO_Pin),
    .I  (ZIO_OUT),
    .T  (ZIO_TOUT)
    );


IODRP2 IODRP2_ZIO       (
      .DATAOUT(),
      .DATAOUT2(),
      .DOUT(ZIO_OUT),
      .SDO(ZIO_IODRP_SDO),
      .TOUT(ZIO_TOUT),
      .ADD(IODRP_ADD),
      .BKST(IODRP_BKST),
      .CLK(UI_CLK),
      .CS(ZIO_IODRP_CS),
      .IDATAIN(ZIO_IN),
      .IOCLK0(IOCLK),
      .IOCLK1(1'b1),
      .ODATAIN(RZQ_ZIO_ODATAIN),
      .SDI(IODRP_SDI),
      .T(RZQ_ZIO_TRISTATE)
      );


end 
endgenerate