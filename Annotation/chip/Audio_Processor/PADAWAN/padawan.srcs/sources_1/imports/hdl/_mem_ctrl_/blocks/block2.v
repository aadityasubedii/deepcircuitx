always @ (posedge clk_100MHz)
begin
    if (rst == 1)begin
        pstate <= WAIT;
        counterEnable <= 0;
        write_zero <= 0;
        get_data<=0;
        data_ready<=0;
        mem_bank<=0;
        end
    else begin
    if (pulse==1)nstate<=LEAVEDELETE;
    case (pstate)
    
        BANK : begin
            if(mem_bank==7)nstate<=INC_BLOCK;
            else nstate <= BANK;  
            if(recording[mem_bank] == 1)begin
                get_data <= 1;
                counterEnable <= 1;
                RamCEn<=0;
                RamOEn<=1;
                WEn_d1<=0;
                pstate<=BANK_ACK;
            end
            else if(playing[mem_bank] == 1)begin
                get_data<=0;
                RamCEn <= 0;
                RamOEn <= 0;
                WEn_d1 <= 1;
                counterEnable <= 1;
                pstate<=BANK_ACK;
            end
            else begin
                get_data<=0;
                RamCEn <= 1;
                RamOEn <= 1;
                WEn_d1 <= 1;
                data_ready <= 1;
                pstate <= FLAG;
            end            
        end
        
        FLAG : begin
            data_ready <= 0;
            mem_bank <= mem_bank + 1;
            pstate <= nstate;
        end
        
        BANK_ACK : begin
            get_data<=0;
            if (counter==55)begin 
                data_ready<=1;
                RamCEn<=1;
                RamOEn<=1;
                WEn_d1<=1;
            end
            else data_ready<=0;
            if(delay_done == 1)begin
                pstate <= nstate;
                mem_bank <= mem_bank + 1;
                counterEnable <= 0;
             end
        end
        
        INC_BLOCK: begin
            increment <= 1;
            mix_data<=1;
            nstate <= WAIT;
            pstate <= WAIT;
        end
        
    
        WAIT: begin
            mix_data <= 0;
            increment <= 0;
            if(pulse == 1)begin
                pstate <= BANK;
            end
            else if(delete == 1)begin
                pstate <= ENTERDELETE;                
            end
            else 
                pstate <= WAIT;
            end
    
        ENTERDELETE: begin
            if (max_delete_block==0)begin
                if (max_block==0)
                    max_delete_block<=mem_block_addr;
                else
                    max_delete_block<=max_block;
            end
            nstate<=DELETE;
            mem_bank<=delete_bank;
            write_zero <= 1;    
            pstate<=DELETE;
        end
        DELETE : begin
            RamCEn <= 0;
            RamOEn <= 1;
            WEn_d1 <= 0; 
            counterEnable <= 1;
            pstate <= DELETE_ACK;
        end
             
        DELETE_ACK : begin
            if(delay_done == 1)begin
                pstate <= DELETE_INC;
                RamCEn <= 1;
                RamOEn <= 1;
                WEn_d1 <= 1;
                counterEnable <= 0;
            end
        end 
         
        DELETE_INC : begin
            if(delete_address < max_delete_block)begin
                delete_address<=delete_address+1;
                pstate <= nstate;
            end
            else begin
                delete_clear <= 1; 
                delete_address<=0;
                write_zero<=0;
                max_delete_block<=0; 
                mem_bank<=0;    
                pstate <= ONECYCLE;  
            end  
        end 
                     
        ONECYCLE: begin 
           delete_clear<=0;
           pstate <=WAIT;
        end
        
        LEAVEDELETE: begin
            mem_bank<=0;
            write_zero<=0;
            counterEnable<=1;
            if(delay_done==1)begin
                counterEnable<=0;
                pstate<=BANK;
            end
        end
    endcase 
     
   end 