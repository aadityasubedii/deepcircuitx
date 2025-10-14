always @(posedge i_clk)
    if ( wb_read_ack || wb_start_write )
        begin
        `TB_DEBUG_MESSAGE
        
        if ( wb_start_write )
            $write("Write 0x%08x to   ", i_wb_dat);
        else
            $write("Read  0x%08x from ", o_wb_dat);
            
        case ( i_wb_adr[15:0] )
            AMBER_TM_TIMER0_LOAD:
                $write(" Timer Module Timer 0 Load"); 
            AMBER_TM_TIMER1_LOAD:
                $write(" Timer Module Timer 1 Load"); 
            AMBER_TM_TIMER2_LOAD:
                $write(" Timer Module Timer 2 Load"); 
            AMBER_TM_TIMER0_CTRL:
                $write(" Timer Module Timer 0 Control"); 
            AMBER_TM_TIMER1_CTRL:
                $write(" Timer Module Timer 1 Control"); 
            AMBER_TM_TIMER2_CTRL:
                $write(" Timer Module Timer 2 Control"); 
            AMBER_TM_TIMER0_VALUE:
                $write(" Timer Module Timer 0 Value"); 
            AMBER_TM_TIMER1_VALUE:
                $write(" Timer Module Timer 1 Value"); 
            AMBER_TM_TIMER2_VALUE:
                $write(" Timer Module Timer 2 Value"); 
            AMBER_TM_TIMER0_CLR:    
                $write(" Timer Module Timer 0 Clear"); 
            AMBER_TM_TIMER1_CLR:         
                $write(" Timer Module Timer 1 Clear"); 
            AMBER_TM_TIMER2_CLR:           
                $write(" Timer Module Timer 2 Clear"); 

            default:
                begin
                $write(" unknown Amber IC Register region");
                $write(", Address 0x%08h\n", i_wb_adr); 
                `TB_ERROR_MESSAGE
                end
        endcase
        
        $write(", Address 0x%08h\n", i_wb_adr); 
        end