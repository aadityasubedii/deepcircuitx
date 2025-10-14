  always @(posedge UI_CLK) begin: NEXT_STATE_LOGIC
    if (RST_reg) begin                      
      MCB_CMD_VALID           <= 1'b0;
      MCB_UIADDR              <= 5'b0;
      MCB_UICMDEN             <= 1'b1;      
      MCB_UIDONECAL           <= 1'b0;      
      MCB_USE_BKST            <= 1'b0;
      MCB_UIDRPUPDATE         <= 1'b1;
      Pre_SYSRST              <= 1'b1;      
      IODRPCTRLR_CMD_VALID    <= 1'b0;
      IODRPCTRLR_MEMCELL_ADDR <= NoOp;
      IODRPCTRLR_WRITE_DATA   <= 1'b0;
      IODRPCTRLR_R_WB         <= WRITE_MODE;
      IODRPCTRLR_USE_BKST     <= 1'b0;
      P_Term                  <= 6'b0;
      N_Term                  <= 7'b0;
      P_Term_s                <= 6'b0;
      N_Term_w                <= 7'b0;
      P_Term_w                <= 6'b0;
      N_Term_s                <= 7'b0;
      P_Term_Prev             <= 6'b0;
      N_Term_Prev             <= 7'b0;
      Active_IODRP            <= RZQ;
      MCB_UILDQSINC           <= 1'b0;      
      MCB_UIUDQSINC           <= 1'b0;      
      MCB_UILDQSDEC           <= 1'b0;      
      MCB_UIUDQSDEC           <= 1'b0;      
      counter_en              <= 1'b0;
      First_Dyn_Cal_Done      <= 1'b0;      
      Max_Value               <= 8'b0;
      Max_Value_Previous      <= 8'b0;
      STATE                   <= START;
      DQS_DELAY               <= 8'h0; 
      DQS_DELAY_INITIAL       <= 8'h0;
      TARGET_DQS_DELAY        <= 8'h0;
      LastPass_DynCal         <= `IN_TERM_PASS;
      First_In_Term_Done      <= 1'b0;
      MCB_UICMD               <= 1'b0;
      MCB_UICMDIN             <= 1'b0;
      MCB_UIDQCOUNT           <= 4'h0;
      counter_inc             <= 8'h0;
      counter_dec             <= 8'h0;
    end
    else begin
      counter_en              <= 1'b0;
      IODRPCTRLR_CMD_VALID    <= 1'b0;
      IODRPCTRLR_MEMCELL_ADDR <= NoOp;
      IODRPCTRLR_R_WB         <= READ_MODE;
      IODRPCTRLR_USE_BKST     <= 1'b0;
      MCB_CMD_VALID           <= 1'b0;
      MCB_UILDQSINC           <= 1'b0;            
      MCB_UIUDQSINC           <= 1'b0;            
      MCB_UILDQSDEC           <= 1'b0;            
      MCB_UIUDQSDEC           <= 1'b0;            
      MCB_USE_BKST            <= 1'b0;
      MCB_UICMDIN             <= 1'b0;
      DQS_DELAY               <= DQS_DELAY;
      TARGET_DQS_DELAY        <= TARGET_DQS_DELAY;
      case (STATE)
        START:  begin   
          MCB_UICMDEN     <= 1'b1;        
          MCB_UIDONECAL   <= 1'b0;        
          P_Term          <= 6'b0;
          N_Term          <= 7'b0;
          Pre_SYSRST      <= 1'b1;        
          LastPass_DynCal <= `IN_TERM_PASS;
          if (SKIP_IN_TERM_CAL) begin
               STATE <= WAIT_FOR_START_BROADCAST;
               P_Term <= 'b0;
               N_Term <= 'b0;
            end
          else if (IODRPCTRLR_RDY_BUSY_N)
            STATE  <= LOAD_RZQ_NTERM;
          else
            STATE  <= START;
        end



        LOAD_RZQ_NTERM: begin   
          Active_IODRP            <= RZQ;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= {1'b0,N_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_RZQ_NTERM;
          else
            STATE <= WAIT1;
        end
        WAIT1:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT1;
          else
            STATE <= LOAD_RZQ_PTERM;
        end
        LOAD_RZQ_PTERM: begin 
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,P_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_RZQ_PTERM;
          else
            STATE <= WAIT2;
        end
        WAIT2:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT2;
          else if ((RZQ_IN)||(P_Term == 6'b111111)) begin
            STATE <= MULTIPLY_DIVIDE;
          end
          else
            STATE <= INC_PTERM;
        end
        INC_PTERM: begin    
          P_Term  <= P_Term + 1;
          STATE   <= LOAD_RZQ_PTERM;
        end
        MULTIPLY_DIVIDE: begin 
           P_Term  <= Mult_Divide(P_Term-1, MULT, DIV);  
           STATE <= LOAD_ZIO_PTERM;
        end
        LOAD_ZIO_PTERM: begin   
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,P_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_ZIO_PTERM;
          else
            STATE <= WAIT3;
        end
        WAIT3:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT3;
          else begin
            STATE   <= LOAD_ZIO_NTERM;
          end
        end
        LOAD_ZIO_NTERM: begin   
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= {1'b0,N_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= LOAD_ZIO_NTERM;
          else
            STATE <= WAIT4;
        end
        WAIT4:  begin   
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT4;
          else if ((!ZIO_IN)||(N_Term == 7'b1111111)) begin
            if (PNSKEW) begin
              STATE    <= SKEW;
            end
            else 
            STATE <= WAIT_FOR_START_BROADCAST;
          end
          else
            STATE <= INC_NTERM;
        end
        INC_NTERM: begin    
          N_Term  <= N_Term + 1;
          STATE   <= LOAD_ZIO_NTERM;
        end
        SKEW : begin 
            P_Term_s <= Mult_Divide(P_Term, MULT_S, DIV_S);
            N_Term_w <= Mult_Divide(N_Term-1, MULT_W, DIV_W);
            P_Term_w <= Mult_Divide(P_Term, MULT_W, DIV_W);
            N_Term_s <= Mult_Divide(N_Term-1, MULT_S, DIV_S);
            P_Term   <= Mult_Divide(P_Term, MULT_S, DIV_S);
            N_Term   <= Mult_Divide(N_Term-1, MULT_W, DIV_W);
            STATE  <= WAIT_FOR_START_BROADCAST;
        end
        WAIT_FOR_START_BROADCAST: begin   
          Pre_SYSRST    <= 1'b0;      
          Active_IODRP  <= MCB_PORT;
          if (START_BROADCAST && IODRPCTRLR_RDY_BUSY_N) begin
            if (P_Term != P_Term_Prev || SKIP_IN_TERM_CAL   ) begin
              STATE       <= BROADCAST_PTERM;
              P_Term_Prev <= P_Term;
            end
            else if (N_Term != N_Term_Prev) begin
              N_Term_Prev <= N_Term;
              STATE       <= BROADCAST_NTERM;
            end
            else
              STATE <= OFF_RZQ_PTERM;
          end
          else
            STATE   <= WAIT_FOR_START_BROADCAST;
        end
        BROADCAST_PTERM:  begin    

          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,P_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          MCB_CMD_VALID           <= 1'b1;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          MCB_USE_BKST            <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= BROADCAST_PTERM;
          else
            STATE <= WAIT5;
        end
        WAIT5:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= WAIT5;
          else if (First_In_Term_Done) begin  
            if (MCB_UOREFRSHFLAG) begin
              MCB_UIDRPUPDATE <= 1'b1;
              if (N_Term != N_Term_Prev) begin
                N_Term_Prev <= N_Term;
                STATE       <= BROADCAST_NTERM;
              end
              else
                STATE <= OFF_RZQ_PTERM;
            end
            else
              STATE <= WAIT5;   
          end
          else begin
            N_Term_Prev <= N_Term;
            STATE <= BROADCAST_NTERM;
          end
        end
        BROADCAST_NTERM:  begin    
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= {2'b00,N_Term};
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          MCB_CMD_VALID           <= 1'b1;
          MCB_USE_BKST            <= 1'b1;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          if (MCB_RDY_BUSY_N)
            STATE <= BROADCAST_NTERM;
          else
            STATE <= WAIT6;
        end
        WAIT6:  begin             
          if (!MCB_RDY_BUSY_N)
            STATE <= WAIT6;
          else if (First_In_Term_Done) begin  
            if (MCB_UOREFRSHFLAG) begin
              MCB_UIDRPUPDATE <= 1'b1;
              STATE           <= OFF_RZQ_PTERM;
            end
            else
              STATE <= WAIT6;   
          end
          else
               STATE <= LDQS_CLK_WRITE_P_TERM;
        end
          LDQS_CLK_WRITE_P_TERM:  begin   
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_w};
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_WRITE_P_TERM;
          else
            STATE <= LDQS_CLK_P_TERM_WAIT;
        end
        LDQS_CLK_P_TERM_WAIT:  begin     
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_P_TERM_WAIT;
          else begin
            STATE           <= LDQS_CLK_WRITE_N_TERM;
          end
        end
        LDQS_CLK_WRITE_N_TERM:  begin   
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_s};
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_WRITE_N_TERM;
          else
            STATE <= LDQS_CLK_N_TERM_WAIT;
        end
        LDQS_CLK_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_CLK_N_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_P_TERM;
          end
        end
         LDQS_PIN_WRITE_P_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_s};
          MCB_UIADDR              <= IOI_LDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_WRITE_P_TERM;
          else
            STATE <= LDQS_PIN_P_TERM_WAIT;
        end
        LDQS_PIN_P_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= LDQS_PIN_WRITE_N_TERM;
          end
        end
         LDQS_PIN_WRITE_N_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_w};
          MCB_UIADDR              <= IOI_LDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_WRITE_N_TERM;
          else
            STATE <= LDQS_PIN_N_TERM_WAIT;
        end
        LDQS_PIN_N_TERM_WAIT:  begin  
          if (!MCB_RDY_BUSY_N)
            STATE <= LDQS_PIN_N_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_P_TERM;
          end
        end
        UDQS_CLK_WRITE_P_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_w};
          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_WRITE_P_TERM;
          else
            STATE <= UDQS_CLK_P_TERM_WAIT;
        end
        UDQS_CLK_P_TERM_WAIT:  begin 
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_CLK_WRITE_N_TERM;
          end
        end
        UDQS_CLK_WRITE_N_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_s};
          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_WRITE_N_TERM;
          else
            STATE <= UDQS_CLK_N_TERM_WAIT;
        end
        UDQS_CLK_N_TERM_WAIT:  begin 
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_CLK_N_TERM_WAIT;
          else begin
            STATE           <= UDQS_PIN_WRITE_P_TERM;
          end
        end
         UDQS_PIN_WRITE_P_TERM:  begin 
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {2'b00, P_Term_s};
          MCB_UIADDR              <= IOI_UDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_WRITE_P_TERM;
          else
            STATE <= UDQS_PIN_P_TERM_WAIT;
        end
        UDQS_PIN_P_TERM_WAIT:  begin  
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_P_TERM_WAIT;
          else begin
            STATE           <= UDQS_PIN_WRITE_N_TERM;
          end
        end
         UDQS_PIN_WRITE_N_TERM:  begin  
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= {1'b0, N_Term_w};
          MCB_UIADDR              <= IOI_UDQS_PIN;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_WRITE_N_TERM;
          else
            STATE <= UDQS_PIN_N_TERM_WAIT;
        end
        UDQS_PIN_N_TERM_WAIT:  begin   
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_PIN_N_TERM_WAIT;
          else begin
            STATE           <= OFF_RZQ_PTERM;
          end
        end
        OFF_RZQ_PTERM:  begin        
          Active_IODRP            <= RZQ;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= PTerm;
          IODRPCTRLR_WRITE_DATA   <= 8'b00;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          P_Term                  <= 6'b0;
          N_Term                  <= 5'b0;
          MCB_UIDRPUPDATE         <= ~First_In_Term_Done; 
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= OFF_RZQ_PTERM;
          else
            STATE <= WAIT7;
        end
        WAIT7:  begin             
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT7;
          else
            STATE <= OFF_ZIO_NTERM;
        end
        OFF_ZIO_NTERM:  begin     
          Active_IODRP            <= ZIO;
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= NTerm;
          IODRPCTRLR_WRITE_DATA   <= 8'b00;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= OFF_ZIO_NTERM;
          else
            STATE <= WAIT8;
        end
        WAIT8:  begin             
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT8;
          else begin
            if (First_In_Term_Done) begin
              STATE               <= START_DYN_CAL; 
            end
            else begin
              STATE               <= WRITE_CALIBRATE; 
            end
          end
        end
        RST_DELAY:  begin     
          if (Block_Reset) begin  
            STATE       <= RST_DELAY;
          end			 
          else begin
            STATE <= START_DYN_CAL_PRE;
          end
        end
       



        START_DYN_CAL_PRE:  begin   
          LastPass_DynCal <= `IN_TERM_PASS;
          MCB_UICMDEN     <= 1'b0;    
          MCB_UIDONECAL   <= 1'b1;    
          Pre_SYSRST      <= 1'b1;    
          if (~CALMODE_EQ_CALIBRATION)      
            STATE       <= START_DYN_CAL;  
          else if (pre_sysrst_minpulse_width_ok)   
            STATE       <= WAIT_FOR_UODONE;
          end
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
        LDQS_WRITE_POS_INDELAY:  begin
          IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
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
            STATE           <= LDQS_WRITE_NEG_INDELAY;
          end
        end
        LDQS_WRITE_NEG_INDELAY:  begin
          IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
          MCB_UIADDR              <= IOI_LDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= LDQS_WRITE_NEG_INDELAY;
          else
            STATE <= LDQS_WAIT2;
        end
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
            STATE <= UDQS_WAIT1;
        end
        UDQS_WAIT1:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_WAIT1;
          else begin
            STATE           <= UDQS_WRITE_NEG_INDELAY;
          end
        end
        UDQS_WRITE_NEG_INDELAY:  begin
          IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          IODRPCTRLR_WRITE_DATA   <= DQS_DELAY_INITIAL;
          MCB_UIADDR              <= IOI_UDQS_CLK;
          MCB_CMD_VALID           <= 1'b1;
          if (MCB_RDY_BUSY_N)
            STATE <= UDQS_WRITE_NEG_INDELAY;
          else
            STATE <= UDQS_WAIT2;
        end
        UDQS_WAIT2:  begin           
          if (!MCB_RDY_BUSY_N)
            STATE <= UDQS_WAIT2;
          else begin
            DQS_DELAY         <= DQS_DELAY_INITIAL;
            TARGET_DQS_DELAY  <= DQS_DELAY_INITIAL;
            STATE             <= START_DYN_CAL;
          end
        end

        START_DYN_CAL:  begin       
          Pre_SYSRST        <= 1'b0;      
          counter_inc       <= 8'b0;
          counter_dec       <= 8'b0;
          if (SKIP_DYNAMIC_DQS_CAL & SKIP_DYN_IN_TERMINATION)
            STATE <= DONE;  
          else
          if (IODRPCTRLR_RDY_BUSY_N && MCB_UODONECAL && ~SELFREFRESH_REQ_R1 ) begin  

            
            if (~SKIP_DYN_IN_TERMINATION & (LastPass_DynCal == `DYN_CAL_PASS)) begin
              LastPass_DynCal <= `IN_TERM_PASS;
              STATE           <= LOAD_RZQ_NTERM;
            end
            else begin
              LastPass_DynCal <= `DYN_CAL_PASS;
              STATE           <= WRITE_CALIBRATE;
            end
          end
          else
            STATE     <= START_DYN_CAL;
        end
        WRITE_CALIBRATE:  begin   
          Pre_SYSRST              <= 1'b0; 
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= DelayControl;
          IODRPCTRLR_WRITE_DATA   <= 8'h20; 
          IODRPCTRLR_R_WB         <= WRITE_MODE;
          Active_IODRP            <= RZQ;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= WRITE_CALIBRATE;
          else
            STATE <= WAIT9;
        end
        WAIT9:  begin     
          counter_en  <= 1'b1;
          if (count < 6'd38)  
            STATE     <= WAIT9;
          else
            STATE     <= READ_MAX_VALUE;
        end
        READ_MAX_VALUE: begin     
          IODRPCTRLR_CMD_VALID    <= 1'b1;
          IODRPCTRLR_MEMCELL_ADDR <= MaxValue;
          IODRPCTRLR_R_WB         <= READ_MODE;
          Max_Value_Previous      <= Max_Value;
          if (IODRPCTRLR_RDY_BUSY_N)
            STATE <= READ_MAX_VALUE;
          else
            STATE <= WAIT10;
        end
        WAIT10:  begin    
          if (!IODRPCTRLR_RDY_BUSY_N)
            STATE <= WAIT10;
          else begin
            Max_Value           <= IODRPCTRLR_READ_DATA;  
            if (~First_In_Term_Done) begin
              STATE               <= RST_DELAY;
              First_In_Term_Done  <= 1'b1;
            end
            else
              STATE               <= ANALYZE_MAX_VALUE;
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
        end
        FIRST_DYN_CAL:  begin 
          First_Dyn_Cal_Done  <= 1'b1;          
          STATE               <= START_DYN_CAL;
        end
        INCREMENT: begin      
          STATE               <= START_DYN_CAL; 
          MCB_UILDQSINC       <= 1'b0;          
          MCB_UIUDQSINC       <= 1'b0;          
          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          case (Inc_Dec_REFRSH_Flag)            
            3'b101: begin
              counter_inc <= counter_inc + 1'b1;
                STATE               <= INCREMENT; 
              if (DQS_DELAY < DQS_DELAY_UPPER_LIMIT && counter_inc >= 8'h04) begin 
                MCB_UILDQSINC       <= 1'b1;      
                MCB_UIUDQSINC       <= 1'b1;      
                DQS_DELAY           <= DQS_DELAY + 1'b1;
              end
            end
            3'b100: begin
              if (DQS_DELAY < DQS_DELAY_UPPER_LIMIT)
                STATE                <= INCREMENT; 
              end
            default:  
                STATE               <= START_DYN_CAL; 
          endcase
        end
        DECREMENT: begin      
          STATE               <= START_DYN_CAL; 
          MCB_UILDQSINC       <= 1'b0;          
          MCB_UIUDQSINC       <= 1'b0;          
          MCB_UILDQSDEC       <= 1'b0;          
          MCB_UIUDQSDEC       <= 1'b0;          
          if (DQS_DELAY != 8'h00) begin
            case (Inc_Dec_REFRSH_Flag)            
              3'b011: begin
                counter_dec <= counter_dec + 1'b1;
                  STATE               <= DECREMENT; 
                if (DQS_DELAY > DQS_DELAY_LOWER_LIMIT  && counter_dec >= 8'h04) begin 
                  MCB_UILDQSDEC       <= 1'b1;      
                  MCB_UIUDQSDEC       <= 1'b1;      
                  DQS_DELAY           <= DQS_DELAY - 1'b1; 
                end
              end
              3'b010: begin
                if (DQS_DELAY > DQS_DELAY_LOWER_LIMIT) 
                  STATE                 <= DECREMENT; 
                end
              default: begin
                  STATE               <= START_DYN_CAL; 
              end
            endcase
          end
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
      endcase
    end
  end