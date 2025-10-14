always @( posedge i_clk )
    if ( wb_read_ack || wb_start_write )
        begin
        `TB_DEBUG_MESSAGE
        
        if ( wb_start_write )
            $write("Write 0x%08x to   ", wb_wdata32);
        else
            $write("Read  0x%08x from ", o_wb_dat);
            
        case ( i_wb_adr[15:0] )
            AMBER_UART_PID0:    $write("UART PID0 register"); 
            AMBER_UART_PID1:    $write("UART PID1 register"); 
            AMBER_UART_PID2:    $write("UART PID2 register"); 
            AMBER_UART_PID3:    $write("UART PID3 register"); 
            AMBER_UART_CID0:    $write("UART CID0 register"); 
            AMBER_UART_CID1:    $write("UART CID1 register"); 
            AMBER_UART_CID2:    $write("UART CID2 register"); 
            AMBER_UART_CID3:    $write("UART CID3 register"); 
            AMBER_UART_DR:      $write("UART Tx/Rx char %c", wb_start_write ? wb_wdata32[7:0] : o_wb_dat[7:0] );
            AMBER_UART_RSR:     $write("UART (Read) Receive status, (Write) Error Clear");
            AMBER_UART_LCRH:    $write("UART Line Control High Byte");
            AMBER_UART_LCRM:    $write("UART Line Control Middle Byte");
            AMBER_UART_LCRL:    $write("UART Line Control Low Byte");
            AMBER_UART_CR:      $write("UART Control Register");
            AMBER_UART_FR:      $write("UART Flag Register");
            AMBER_UART_IIR:     $write("UART (Read) Interrupt Identification Register");

            default:
                begin
                `TB_ERROR_MESSAGE
                $write("Unknown UART Register region");
                end
        endcase
        
        $write(", Address 0x%08h\n", i_wb_adr); 
        end