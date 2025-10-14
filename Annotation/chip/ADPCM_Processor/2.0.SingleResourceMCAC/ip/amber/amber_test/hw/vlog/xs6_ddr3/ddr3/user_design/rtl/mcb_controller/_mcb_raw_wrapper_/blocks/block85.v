          if(C_PORT_CONFIG == "B32_B32_R32_R32_R32_R32" ||
             C_PORT_CONFIG == "B32_B32_R32_R32_R32_W32" ||
             C_PORT_CONFIG == "B32_B32_R32_R32_W32_R32" ||
             C_PORT_CONFIG == "B32_B32_R32_R32_W32_W32" ||
             C_PORT_CONFIG == "B32_B32_R32_W32_R32_R32" ||
             C_PORT_CONFIG == "B32_B32_R32_W32_R32_W32" ||
             C_PORT_CONFIG == "B32_B32_R32_W32_W32_R32" ||
             C_PORT_CONFIG == "B32_B32_R32_W32_W32_W32" ||
             C_PORT_CONFIG == "B32_B32_W32_R32_R32_R32" ||
             C_PORT_CONFIG == "B32_B32_W32_R32_R32_W32" ||
             C_PORT_CONFIG == "B32_B32_W32_R32_W32_R32" ||
             C_PORT_CONFIG == "B32_B32_W32_R32_W32_W32" ||
             C_PORT_CONFIG == "B32_B32_W32_W32_R32_R32" ||
             C_PORT_CONFIG == "B32_B32_W32_W32_R32_W32" ||
             C_PORT_CONFIG == "B32_B32_W32_W32_W32_R32" ||
             C_PORT_CONFIG == "B32_B32_W32_W32_W32_W32"
             ) 
               begin
               if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                      assign p4_cmd_ba =  p4_cmd_byte_addr[C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1];
               else
                      assign p4_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH ] , p4_cmd_byte_addr[C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1]};
               
               
               if (C_MEM_ADDR_WIDTH == 15) 
                     assign p4_cmd_ra = p4_cmd_byte_addr[C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_NUM_COL_BITS - 1];
               else         
                     assign p4_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH ] , p4_cmd_byte_addr[C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_NUM_COL_BITS - 1]};
                        
                        
               if (C_MEM_NUM_COL_BITS == 12) 
                     assign p4_cmd_ca = {p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 2 : 0] , 1'b0};
               else
                     assign p4_cmd_ca = {allzero[11 : C_MEM_NUM_COL_BITS ] ,  p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 2 : 0] , 1'b0};


               if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                      assign p5_cmd_ba =  p5_cmd_byte_addr[C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1];
               else
                      assign p5_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH ] , p5_cmd_byte_addr[C_MEM_BANKADDR_WIDTH + C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1]};
               
               
               if (C_MEM_ADDR_WIDTH == 15) 
                     assign p5_cmd_ra = p5_cmd_byte_addr[C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_NUM_COL_BITS - 1];
               else         
                     assign p5_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH ] , p5_cmd_byte_addr[C_MEM_ADDR_WIDTH +  C_MEM_NUM_COL_BITS - 2 : C_MEM_NUM_COL_BITS - 1]};
                        
                        
               if (C_MEM_NUM_COL_BITS == 12) 
                     assign p5_cmd_ca = {p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 2 : 0] , 1'b0};
               else
                     assign p5_cmd_ca = {allzero[11 : C_MEM_NUM_COL_BITS ] ,  p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 2 : 0] , 1'b0};
              end