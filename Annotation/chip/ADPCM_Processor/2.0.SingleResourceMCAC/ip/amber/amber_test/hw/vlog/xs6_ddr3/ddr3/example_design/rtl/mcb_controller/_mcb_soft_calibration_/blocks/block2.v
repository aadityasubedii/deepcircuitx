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