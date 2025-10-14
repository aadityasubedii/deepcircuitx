        LDQS_WAIT2:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_WAIT2;
          else begin
            STATE <= UDQS_WRITE_POS_INDELAY;
          end
        end
        UDQS_WRITE_POS_INDELAY:  begin
          IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_WRITE_POS_INDELAY;
          else