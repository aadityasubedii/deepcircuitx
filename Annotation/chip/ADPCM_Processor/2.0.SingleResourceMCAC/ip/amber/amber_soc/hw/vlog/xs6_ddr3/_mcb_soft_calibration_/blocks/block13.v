            MCB_UICMDEN <= 1'b1;    
            DQS_DELAY_INITIAL <= Mult_Divide(Max_Value, DQS_NUMERATOR, DQS_DENOMINATOR);
            STATE       <= LDQS_WRITE_POS_INDELAY;
          end
          else
            STATE       <= WAIT_FOR_UODONE;
        end
        LDQS_WRITE_POS_INDELAY:  begin