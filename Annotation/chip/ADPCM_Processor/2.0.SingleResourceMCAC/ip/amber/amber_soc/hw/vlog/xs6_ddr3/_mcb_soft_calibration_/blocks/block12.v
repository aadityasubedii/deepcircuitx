          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_WRITE_POS_INDELAY;
          else
            STATE <= LDQS_WAIT1;
        end
        LDQS_WAIT1:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_WAIT1;
          else begin