          end
        end
        ANALYZE_MAX_VALUE:  begin 
          if (!First_Dyn_Cal_Done)
            STATE <= FIRST_DYN_CAL;
          else
            if ((Max_Value<Max_Value_Previous)&&(Max_Value_Delta_Dn>=INCDEC_THRESHOLD)) begin
              STATE <= DECREMENT;         
              TARGET_DQS_DELAY   <= Mult_Divide(Max_Value, DQS_NUMERATOR, DQS_DENOMINATOR);
            end
          else
            if ((Max_Value>Max_Value_Previous)&&(Max_Value_Delta_Up>=INCDEC_THRESHOLD)) begin
              STATE <= INCREMENT;         
              TARGET_DQS_DELAY   <= Mult_Divide(Max_Value, DQS_NUMERATOR, DQS_DENOMINATOR);
            end
          else begin
            Max_Value           <= Max_Value_Previous;
            STATE <= START_DYN_CAL;
          end