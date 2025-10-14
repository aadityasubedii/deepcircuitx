  always @(*) begin: ACTIVE_IODRP
    case (Active_IODRP)
      RZQ:      begin
        RZQ_IODRP_CS  = IODRP_CS;
        ZIO_IODRP_CS  = 1'b0;
        IODRP_SDO     = RZQ_IODRP_SDO;
      end
      ZIO:      begin
        RZQ_IODRP_CS  = 1'b0;
        ZIO_IODRP_CS  = IODRP_CS;
        IODRP_SDO     = ZIO_IODRP_SDO;
      end
      MCB_PORT: begin
        RZQ_IODRP_CS  = 1'b0;
        ZIO_IODRP_CS  = 1'b0;
        IODRP_SDO     = 1'b0;
      end
      default:  begin
        RZQ_IODRP_CS  = 1'b0;
        ZIO_IODRP_CS  = 1'b0;
        IODRP_SDO     = 1'b0;
      end
    endcase
  end