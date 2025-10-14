always @ (*)
begin
             load_seed_o   = 1'b0;
             if (CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                 addr_mode = 'b0;
             else
                 addr_mode   = SEQUENTIAL_ADDR;

             if (CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                 instr_mode_o = 'b0;
             else
                 instr_mode_o   = FIXED_INSTR_MODE;


             if (CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                 bl_mode_o = 'b0;
             else
                 bl_mode_o   = FIXED_BL_MODE;

           
             
             if (FAMILY == "VIRTEX6")
                 fixed_bl_o = FIXED_BL_VALUE;
                                                 
             else if (data_mode_o[2:0] == 3'b111 && FAMILY == "SPARTAN6")
                 fixed_bl_o = 64;  
             else
                  fixed_bl_o    = fix_bl_value;
                 
                 
                 
             mode_load_o   = 1'b0;
             run_traffic = 1'b0;   
             next_state = IDLE;

             if (PORT_MODE == "RD_MODE") begin
               fixed_instr_o = RD_INSTR;
             end
              else if( PORT_MODE == "WR_MODE" || PORT_MODE == "BI_MODE") begin
               fixed_instr_o = WR_INSTR;
             end
             
case(current_state)
   IDLE:  
        begin
         if(mcb_init_done_reg )   
            begin
              if (PORT_MODE == "WR_MODE" || PORT_MODE == "BI_MODE") begin
                 next_state = INIT_MEM_WRITE;
              mode_load_o = 1'b1;
              run_traffic = 1'b0;
              load_seed_o   = 1'b1;
             end
              else if (PORT_MODE == "RD_MODE" && end_addr_reached) begin
                    next_state = TEST_MEM;
                    mode_load_o = 1'b1;
                    run_traffic = 1'b1;
              load_seed_o   = 1'b1;
                    
              end
            end
         else
              begin
              next_state = IDLE;
              run_traffic = 1'b0;
              load_seed_o   = 1'b0;
              
              end
         
         end
   INIT_MEM_WRITE:  begin
   
         if (end_addr_reached  && EYE_TEST == "FALSE"  )
            begin
               next_state = TEST_MEM;
               mode_load_o = 1'b1;
               load_seed_o   = 1'b1;
               run_traffic = 1'b1;
               
            end   
          else
             begin
               next_state = INIT_MEM_WRITE;
              run_traffic = 1'b1; 
              mode_load_o = 1'b0;
              load_seed_o   = 1'b0;
              if (EYE_TEST == "TRUE")  
                addr_mode   = FIXED_ADDR;
              else if (CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                addr_mode = 'b0;
              else
                addr_mode   = SEQUENTIAL_ADDR;
              
             end  
         
        end
      
   INIT_MEM_READ:  begin
   
         if (end_addr_reached  )
            begin
               next_state = TEST_MEM;
               mode_load_o = 1'b1;
              load_seed_o   = 1'b1;
               
            end   
          else
             begin
               next_state = INIT_MEM_READ;
              run_traffic = 1'b0; 
              mode_load_o = 1'b0;
              load_seed_o   = 1'b0;
              
             end  
         
        end
   TEST_MEM: begin  
         if (cmp_error)
               next_state = CMP_ERROR;
               
         else
           next_state = TEST_MEM;
           run_traffic = 1'b1;
       

           if (PORT_MODE == "BI_MODE" && TST_MEM_INSTR_MODE == "FIXED_INSTR_W_MODE")
                fixed_instr_o = WR_INSTR;
           else if (PORT_MODE == "BI_MODE" && TST_MEM_INSTR_MODE == "FIXED_INSTR_R_MODE")
                fixed_instr_o = RD_INSTR;                
           else if (PORT_MODE == "RD_MODE")
              fixed_instr_o = RD_INSTR;
           
           else if( PORT_MODE == "WR_MODE") 
              fixed_instr_o = WR_INSTR;
           
        
             if (FAMILY == "VIRTEX6")
                 fixed_bl_o = fix_bl_value;
             else if ((data_mode_o == 3'b111) && (FAMILY == "SPARTAN6"))
                 fixed_bl_o = 64;  
             else
            fixed_bl_o    = fix_bl_value;
                 
           bl_mode_o     = bl_mode_sel;

              if (bl_mode_o == PRBS_BL_MODE)  
                addr_mode   = PRBS_ADDR;
              else
                addr_mode   = addr_mode_sel;

           
           
           if(PORT_MODE == "BI_MODE") begin
               if(CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                   instr_mode_o  = BRAM_INSTR_MODE;
               else
                   instr_mode_o  = test_mem_instr_mode;
              end
           else if (PORT_MODE == "RD_MODE" || PORT_MODE == "WR_MODE") begin
               instr_mode_o  = FIXED_INSTR_MODE;
           end
              
         end
   
   
   

   
   CMP_ERROR: 
        begin
               next_state = CMP_ERROR;
               bl_mode_o     = bl_mode_sel;
               fixed_instr_o = RD_INSTR;
               addr_mode   = SEQUENTIAL_ADDR;
               if(CMD_PATTERN == "CGEN_BRAM" || bram_mode_enable )
                   instr_mode_o  = BRAM_INSTR_MODE;
               else
                   instr_mode_o  = test_mem_instr_mode;
               
               run_traffic = 1'b1;       

        end
   default:
          begin
            next_state = IDLE;       
           

        end
  
 endcase
 end




endmodule