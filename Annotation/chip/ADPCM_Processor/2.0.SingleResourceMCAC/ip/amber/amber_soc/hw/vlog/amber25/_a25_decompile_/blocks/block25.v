always @*
    begin
    
    if ( !execute_now ) 
        begin 
        xINSTRUCTION_EXECUTE =  xINSTRUCTION_EXECUTE_R; 
        end 

    else if ( itype == REGOP    && opcode == ADC                                                          ) xINSTRUCTION_EXECUTE = "adc  ";
    else if ( itype == REGOP    && opcode == ADD                                                          ) xINSTRUCTION_EXECUTE = "add  ";
    else if ( itype == REGOP    && opcode == AND                                                          ) xINSTRUCTION_EXECUTE = "and  ";
    else if ( itype == BRANCH   && execute_instruction[24] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "b    ";
    else if ( itype == REGOP    && opcode == BIC                                                          ) xINSTRUCTION_EXECUTE = "bic  ";
    else if ( itype == BRANCH   && execute_instruction[24] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "bl   ";
    else if ( itype == COREGOP                                                                            ) xINSTRUCTION_EXECUTE = "cdp  ";
    else if ( itype == REGOP    && opcode == CMN                                                          ) xINSTRUCTION_EXECUTE = "cmn  ";
    else if ( itype == REGOP    && opcode == CMP                                                          ) xINSTRUCTION_EXECUTE = "cmp  ";
    else if ( itype == REGOP    && opcode == EOR                                                          ) xINSTRUCTION_EXECUTE = "eor  ";
    else if ( itype == CODTRANS && execute_instruction[20] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "ldc  ";
    else if ( itype == MTRANS   && execute_instruction[20] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "ldm  ";
    else if ( itype == TRANS    && {execute_instruction[22],execute_instruction[20]}    == {1'b0, 1'b1}   ) xINSTRUCTION_EXECUTE = "ldr  ";
    else if ( itype == TRANS    && {execute_instruction[22],execute_instruction[20]}    == {1'b1, 1'b1}   ) xINSTRUCTION_EXECUTE = "ldrb ";
    else if ( itype == CORTRANS && execute_instruction[20] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "mcr  ";
    else if ( itype == MULT     && execute_instruction[21] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "mla  ";
    else if ( itype == REGOP    && opcode == MOV                                                          ) xINSTRUCTION_EXECUTE = "mov  ";
    else if ( itype == CORTRANS && execute_instruction[20] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "mrc  ";
    else if ( itype == MULT     && execute_instruction[21] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "mul  ";
    else if ( itype == REGOP    && opcode == MVN                                                          ) xINSTRUCTION_EXECUTE = "mvn  ";
    else if ( itype == REGOP    && opcode == ORR                                                          ) xINSTRUCTION_EXECUTE = "orr  ";
    else if ( itype == REGOP    && opcode == RSB                                                          ) xINSTRUCTION_EXECUTE = "rsb  ";
    else if ( itype == REGOP    && opcode == RSC                                                          ) xINSTRUCTION_EXECUTE = "rsc  ";
    else if ( itype == REGOP    && opcode == SBC                                                          ) xINSTRUCTION_EXECUTE = "sbc  ";
    else if ( itype == CODTRANS && execute_instruction[20] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "stc  ";
    else if ( itype == MTRANS   && execute_instruction[20] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "stm  ";
    else if ( itype == TRANS    && {execute_instruction[22],execute_instruction[20]}    == {1'b0, 1'b0}   ) xINSTRUCTION_EXECUTE = "str  ";
    else if ( itype == TRANS    && {execute_instruction[22],execute_instruction[20]}    == {1'b1, 1'b0}   ) xINSTRUCTION_EXECUTE = "strb ";
    else if ( itype == REGOP    && opcode == SUB                                                          ) xINSTRUCTION_EXECUTE = "sub  ";  
    else if ( itype == SWI                                                                                ) xINSTRUCTION_EXECUTE = "swi  ";  
    else if ( itype == SWAP     && execute_instruction[22] == 1'b0                                        ) xINSTRUCTION_EXECUTE = "swp  ";  
    else if ( itype == SWAP     && execute_instruction[22] == 1'b1                                        ) xINSTRUCTION_EXECUTE = "swpb ";  
    else if ( itype == REGOP    && opcode == TEQ                                                          ) xINSTRUCTION_EXECUTE = "teq  ";  
    else if ( itype == REGOP    && opcode == TST                                                          ) xINSTRUCTION_EXECUTE = "tst  ";  
    else                                                                                                    xINSTRUCTION_EXECUTE = "unkow";  
    end