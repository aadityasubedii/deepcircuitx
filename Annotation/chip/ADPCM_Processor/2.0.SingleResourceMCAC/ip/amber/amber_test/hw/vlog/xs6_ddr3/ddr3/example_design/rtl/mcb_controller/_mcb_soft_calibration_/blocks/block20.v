        WAIT_FOR_UODONE:  begin  
          Pre_SYSRST      <= 1'b0;    
          if (IODRPCTRLR_RDY_BUSY_N && MCB_UODONECAL) begin 
            MCB_UICMDEN <= 1'b1;    
            DQS_DELAY_INITIAL <= Mult_Divide(Max_Value, DQS_NUMERATOR, DQS_DENOMINATOR);
            STATE       <= LDQS_WRITE_POS_INDELAY;
          end
          else
            STATE       <= WAIT_FOR_UODONE;
        end