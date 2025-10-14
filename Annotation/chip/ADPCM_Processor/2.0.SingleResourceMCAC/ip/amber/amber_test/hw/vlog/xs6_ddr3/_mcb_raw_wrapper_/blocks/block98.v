           if (C_MEM_ADDR_ORDER == "ROW_BANK_COLUMN") begin  
                 

                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p0_cmd_ra = p0_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p0_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p0_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p0_cmd_ba = p0_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p0_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p0_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p0_cmd_ca[11:0] = p0_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p0_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p0_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 
                 
                
                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p1_cmd_ra = p1_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p1_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p1_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p1_cmd_ba = p1_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p1_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p1_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p1_cmd_ca[11:0] = p1_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p1_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p1_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 
                
                
                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p2_cmd_ra = p2_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p2_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p2_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p2_cmd_ba = p2_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p2_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p2_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p2_cmd_ca[11:0] = p2_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p2_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p2_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 


              
                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p3_cmd_ra = p3_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p3_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p3_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p3_cmd_ba = p3_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p3_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p3_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p3_cmd_ca[11:0] = p3_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p3_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p3_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 
                
              
                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p4_cmd_ra = p4_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p4_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p4_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p4_cmd_ba = p4_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p4_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p4_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p4_cmd_ca[11:0] = p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p4_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 

              
              
                 if (C_MEM_ADDR_WIDTH == 15)  
                          assign p5_cmd_ra = p5_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ];
                 else
                          assign p5_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p5_cmd_byte_addr[C_MEM_ADDR_WIDTH + C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1  : C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS ]};


                 if (C_MEM_BANKADDR_WIDTH  == 3 )  
                          assign p5_cmd_ba = p5_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 :  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p5_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p5_cmd_byte_addr[C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_NUM_COL_BITS ]};  
                 
                 
                 if (C_MEM_NUM_COL_BITS == 12)  
                          assign p5_cmd_ca[11:0] = p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p5_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                 
                end
               
            else  
              begin
                 
                 if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                          assign p0_cmd_ba = p0_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p0_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p0_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ]};  


                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p0_cmd_ra = p0_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p0_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p0_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};                
                                   
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p0_cmd_ca[11:0] = p0_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p0_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p0_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};


                
                 if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                          assign p1_cmd_ba = p1_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p1_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p1_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ]};  
                                   
                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p1_cmd_ra = p1_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p1_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p1_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p1_cmd_ca[11:0] = p1_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p1_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p1_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
                
               
                if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                       assign p2_cmd_ba = p2_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                else
                       assign p2_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                        p2_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS  ]};  
      
                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p2_cmd_ra = p2_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p2_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p2_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p2_cmd_ca[11:0] = p2_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p2_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p2_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};

              
                 if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                          assign p3_cmd_ba = p3_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p3_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p3_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ]};  
                                   
                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p3_cmd_ra = p3_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p3_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p3_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p3_cmd_ca[11:0] = p3_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p3_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p3_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
   
   
                 
                 if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                          assign p4_cmd_ba = p4_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p4_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p4_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ]};  
                                   
                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p4_cmd_ra = p4_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p4_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p4_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p4_cmd_ca[11:0] = p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p4_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p4_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};

                 
   
                 if (C_MEM_BANKADDR_WIDTH  == 3 ) 
                          assign p5_cmd_ba = p5_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ];  
                 else
                          assign p5_cmd_ba = {allzero[2 : C_MEM_BANKADDR_WIDTH],  
                                   p5_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_BANKADDR_WIDTH +  C_MEM_NUM_COL_BITS - 1 : C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS ]};  
                                   
                 if (C_MEM_ADDR_WIDTH == 15) 
                          assign p5_cmd_ra = p5_cmd_byte_addr[C_MEM_ADDR_WIDTH  + C_MEM_NUM_COL_BITS - 1  :  C_MEM_NUM_COL_BITS ];
                 else
                          assign p5_cmd_ra = {allzero[14 : C_MEM_ADDR_WIDTH] , p5_cmd_byte_addr[C_MEM_ADDR_WIDTH  +  C_MEM_NUM_COL_BITS - 1  : C_MEM_NUM_COL_BITS ]};
                 
                 if (C_MEM_NUM_COL_BITS == 12) 
                          assign p5_cmd_ca[11:0] = p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0];
                 else
                          assign p5_cmd_ca[11:0] = {allzero[11 : C_MEM_NUM_COL_BITS] , p5_cmd_byte_addr[C_MEM_NUM_COL_BITS - 1 : 0]};
             
            end

              

end else if(C_NUM_DQ_PINS == 4) begin : x4_Addr