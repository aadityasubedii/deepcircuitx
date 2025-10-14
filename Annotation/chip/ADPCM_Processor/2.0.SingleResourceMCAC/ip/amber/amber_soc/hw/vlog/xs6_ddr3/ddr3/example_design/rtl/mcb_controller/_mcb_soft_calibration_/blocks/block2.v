        DONE: begin           
          Pre_SYSRST              <= 1'b0;    
          MCB_UICMDEN             <= 1'b0;  
          STATE <= DONE;
        end
        default:        begin
          MCB_UICMDEN             <= 1'b0;  
          MCB_UIDONECAL           <= 1'b1;  
          Pre_SYSRST              <= 1'b0;  