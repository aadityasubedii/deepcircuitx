generate
    if(USE_CONTROL) begin
        reg enable_reg;
        reg write_trigger_ack_reg;
        
        wire is_side_registers;
        reg [1:0] interrupt_enable;
        reg status_update_int_reg;
        reg genlocked_reg;
        reg genlocked_int_reg;
        reg [1:0] genlock_enable_reg;
        
        wire [15:0] usedw_output;
        wire [15:0] is_mode_match_output;
        
        reg [NO_OF_MODES_INT-1:0] is_mode_match;
        wire clear_interrupts;
        
        reg clear_underflow_sticky_reg;
        
        wire mode_write;
        
        if(USED_WORDS_WIDTH >= 16)
            assign usedw_output = usedw[15:0];
        else
            assign usedw_output = {{16-USED_WORDS_WIDTH{1'b0}}, usedw};
        
        if(NO_OF_MODES_INT >= 16) begin
            assign is_mode_match_output = is_mode_match[15:0];
        end else begin
            assign is_mode_match_output = {{16-NO_OF_MODES_INT{1'b0}}, is_mode_match};
        end
        
        assign enable = enable_reg;
        assign av_readdata = (av_address == 8'd1) ? {{12{1'b0}}, genlocked,
                                                                 underflow_sticky,
                                                                 1'b0,
                                                                 enable_resync} :
                             (av_address == 8'd2) ? {{13{1'b0}}, genlocked_int_reg,
                                                                 status_update_int_reg,
                                                                 1'b0} :
                             (av_address == 8'd3) ? usedw_output :
                             (av_address == 8'd4) ? is_mode_match_output :
                             {{11{1'b0}}, genlock_enable, interrupt_enable, enable_reg};
        assign av_waitrequest = av_write & ~(av_write_ack | is_side_registers);
        assign is_side_registers = av_address <= 8'd4;
        assign write_trigger = av_write & ~is_side_registers;
        assign write_trigger_ack = write_trigger_ack_reg;
        assign status_update_int = status_update_int_reg | genlocked_int_reg;
        assign clear_interrupts = av_write && av_address == 8'd2;
        assign clear_underflow_sticky = clear_underflow_sticky_reg;
        assign genlock_enable = genlock_enable_reg;
        