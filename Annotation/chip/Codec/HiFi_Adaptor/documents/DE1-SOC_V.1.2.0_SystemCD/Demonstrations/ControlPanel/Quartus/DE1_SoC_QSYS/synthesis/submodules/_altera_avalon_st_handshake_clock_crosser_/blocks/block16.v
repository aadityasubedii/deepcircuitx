    generate
        
        if (PACKET_WIDTH) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH - 1 : 
                DATA_WIDTH
            ] = {in_startofpacket, in_endofpacket};
        end
        
        if (USE_CHANNEL) begin
            assign in_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W - 1 : 
              DATA_WIDTH + PACKET_WIDTH
            ] = in_channel;
        end
        
        if (EMPTY_WIDTH) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH - 1 : 
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W
            ] = in_empty;
        end
        
        if (USE_ERROR) begin
            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH + PERROR_W - 1 : 
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH
            ] = in_error;
        end
    endgenerate