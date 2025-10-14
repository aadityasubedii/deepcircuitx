assign itype = 
    {execute_instruction[27:23], execute_instruction[21:20], execute_instruction[11:4] } == { 5'b00010, 2'b00, 8'b00001001 } ? SWAP     :  
    {execute_instruction[27:22], execute_instruction[7:4]                              } == { 6'b000000, 4'b1001           } ? MULT     :  
    {execute_instruction[27:26]                                                        } == { 2'b00                        } ? REGOP    :    
    {execute_instruction[27:26]                                                        } == { 2'b01                        } ? TRANS    :
    {execute_instruction[27:25]                                                        } == { 3'b100                       } ? MTRANS   :
    {execute_instruction[27:25]                                                        } == { 3'b101                       } ? BRANCH   :
    {execute_instruction[27:25]                                                        } == { 3'b110                       } ? CODTRANS :
    {execute_instruction[27:24], execute_instruction[4]                                } == { 4'b1110, 1'b0                } ? COREGOP  :
    {execute_instruction[27:24], execute_instruction[4]                                } == { 4'b1110, 1'b1                } ? CORTRANS :
                                                                                                                               SWI      ;

                                                                                                                 




assign TYPE_NAME    = itype == REGOP    ? "REGOP   " :
                      itype == MULT     ? "MULT    " :
                      itype == SWAP     ? "SWAP    " :
                      itype == TRANS    ? "TRANS   " : 
                      itype == MTRANS   ? "MTRANS  " : 
                      itype == BRANCH   ? "BRANCH  " : 
                      itype == CODTRANS ? "CODTRANS" : 
                      itype == COREGOP  ? "COREGOP " : 
                      itype == CORTRANS ? "CORTRANS" : 
                      itype == SWI      ? "SWI     " : 
                                         "UNKNOWN " ;