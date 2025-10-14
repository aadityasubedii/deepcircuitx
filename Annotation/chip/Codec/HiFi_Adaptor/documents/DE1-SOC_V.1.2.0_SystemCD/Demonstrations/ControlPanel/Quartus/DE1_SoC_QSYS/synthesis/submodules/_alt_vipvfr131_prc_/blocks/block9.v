alt_vipvfr131_prc_read_master 
#(.ADDR_WIDTH (MM_ADDR_REQUIREDWIDTH),
    .DATA_WIDTH (MEM_PORT_WIDTH),
    .READ_USED (1),
    .COMMAND_FIFO_DEPTH (1),  
    .READ_FIFO_DEPTH (RMASTER_FIFO_DEPTH),
    .CLOCKS_ARE_SAME (!CLOCKS_ARE_SEPARATE),
    .MAX_BURST_LENGTH_REQUIREDWIDTH (MAX_BURST_LENGTH_REQUIREDWIDTH),
    .BURST_WIDTH (MM_MASTER_BURST_REQUIREDWIDTH),
    .READ_TARGET_BURST_SIZE (RMASTER_BURST_TARGET),
    .UNPACKED_WIDTH(BPS * CHANNELS_IN_PAR)
    )
read_master
(		.clock (clock),
		.reset (reset),
        
    .ena(global_ena),
    .stall(stall_FROM_read_master_TO_WIRE_global_ena),
    
    .cmd_addr(cmd_addr_FROM_prc_core_TO_read_master),
    .cmd_write_instead_of_read(1'b0),  
    .cmd_burst_instead_of_single_op(1'b1), 
    .cmd_length_of_burst(cmd_length_of_burst_FROM_prc_core_TO_read_master),
    .cmd(cmd_FROM_prc_core_TO_read_master),

    .read_data(pixel_data_FROM_read_master_TO_prc_core),
    .read(read_FROM_prc_core_TO_read_master),
    .discard_remaining_data_of_read_word(discard_remaining_data_of_read_word_FROM_prc_core_TO_read_master),

    .av_address (master_av_address),
    .av_read (master_av_read),
    .av_clock (master_clock),
    .av_reset (master_reset),
    .av_readdata (master_av_readdata),
    .av_readdatavalid (master_av_readdatavalid),
    .av_waitrequest (master_av_waitrequest),
    .av_burstcount (master_av_burstcount)
 
); 