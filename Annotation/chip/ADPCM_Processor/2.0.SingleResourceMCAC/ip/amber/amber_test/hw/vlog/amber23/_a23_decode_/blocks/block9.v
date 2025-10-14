 always @*
    begin
    
    control_state_nxt = control_state;

    
    if ( control_state == RST_WAIT1 )     control_state_nxt = RST_WAIT2;
    if ( control_state == RST_WAIT2 )     control_state_nxt = EXECUTE;
    if ( control_state == INT_WAIT1 )     control_state_nxt = INT_WAIT2;
    if ( control_state == INT_WAIT2 )     control_state_nxt = EXECUTE;
    if ( control_state == COPRO_WAIT )    control_state_nxt = PRE_FETCH_EXEC;
    if ( control_state == PC_STALL1 )     control_state_nxt = PC_STALL2;
    if ( control_state == PC_STALL2 )     control_state_nxt = EXECUTE;
    if ( control_state == SWAP_WRITE )    control_state_nxt = SWAP_WAIT1;
    if ( control_state == SWAP_WAIT1 )    control_state_nxt = SWAP_WAIT2;
    if ( control_state == MULT_STORE )    control_state_nxt = PRE_FETCH_EXEC;
    if ( control_state == MTRANS5_ABORT ) control_state_nxt = PRE_FETCH_EXEC;

    if ( control_state == MEM_WAIT1 )
        control_state_nxt = MEM_WAIT2;

    if ( control_state == MEM_WAIT2   ||
        control_state == SWAP_WAIT2    )
        begin
        if ( write_pc ) 
            control_state_nxt = PC_STALL1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
        end

    if ( control_state == MTRANS_EXEC1 )
        begin
        if (mtrans_instruction_nxt[15:0] != 16'd0)
            control_state_nxt = MTRANS_EXEC2;
        else   
            control_state_nxt = MTRANS_EXEC3;
        end

        
        
    if ( control_state == MTRANS_EXEC2 && mtrans_num_registers == 5'd1 )
        control_state_nxt = MTRANS_EXEC3;

    if ( control_state == MTRANS_EXEC3 )     control_state_nxt = MTRANS_EXEC4;

    if ( control_state == MTRANS_EXEC3B )    control_state_nxt = MTRANS_EXEC4;

    if ( control_state == MTRANS_EXEC4  )
        begin
        if ( dabt ) 
            control_state_nxt = MTRANS5_ABORT;
        else if (write_pc) 
            control_state_nxt = PC_STALL1;
        else
            control_state_nxt = PRE_FETCH_EXEC;
        end

    if ( control_state == MULT_PROC1 )
        begin
        if (!instruction_execute)
            control_state_nxt = PRE_FETCH_EXEC;
        else
            control_state_nxt = MULT_PROC2;
        end

    if ( control_state == MULT_PROC2 )
        begin
        if ( i_multiply_done )
            if      ( o_multiply_function[1] )  
                control_state_nxt = MULT_ACCUMU;
            else
                control_state_nxt = MULT_STORE;
        end


    if ( control_state == MULT_ACCUMU )
        begin
        control_state_nxt = MULT_STORE;
        end


    
    
    if ( instruction_valid )
        begin
        
        
        control_state_nxt = EXECUTE;

        if ( mem_op )  
             control_state_nxt = MEM_WAIT1;
        if ( write_pc )
             control_state_nxt = PC_STALL1;
        if ( itype == MTRANS )
            begin
            if ( mtrans_num_registers != 5'd0 )
                begin
                
                if ( mtrans_num_registers == 5'd1 )
                    control_state_nxt = MTRANS_EXEC3B;
                else
                    control_state_nxt = MTRANS_EXEC1;
                end
            else
                control_state_nxt = MTRANS_EXEC3;
            end

        if ( itype == MULT )
                control_state_nxt = MULT_PROC1;

        if ( itype == SWAP )
                control_state_nxt = SWAP_WRITE;

        if ( itype == CORTRANS && !und_request )
                control_state_nxt = COPRO_WAIT;

         
        if ( interrupt )
                control_state_nxt = INT_WAIT1;
        end
    end