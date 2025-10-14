        end
        DONE: begin           
          Pre_SYSRST              <= 1'b0;    
          MCB_UICMDEN             <= 1'b0;  
          STATE <= DONE;
        end
        default:        begin
          MCB_UICMDEN             <= 1'b0;  
          MCB_UIDONECAL           <= 1'b1;  
          Pre_SYSRST              <= 1'b0;  
          IODRPCTRLR_CMD_VALID    <= 1'b0;
          IODRPCTRLR_MEMCELL_ADDR <= 8'h00;
          IODRPCTRLR_WRITE_DATA   <= 8'h00;
          IODRPCTRLR_R_WB         <= 1'b0;
          IODRPCTRLR_USE_BKST     <= 1'b0;
          P_Term                  <= 6'b0;
          N_Term                  <= 5'b0;
          Active_IODRP            <= ZIO;
          Max_Value_Previous      <= 8'b0;
          MCB_UILDQSINC           <= 1'b0;  
          MCB_UIUDQSINC           <= 1'b0;  
          MCB_UILDQSDEC           <= 1'b0;  
          MCB_UIUDQSDEC           <= 1'b0;  
          counter_en              <= 1'b0;
          First_Dyn_Cal_Done      <= 1'b0;  
          Max_Value               <= Max_Value;
          STATE                   <= START;
        end