            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH + PERROR_W - 1 : 
                DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH
            ] = in_error;