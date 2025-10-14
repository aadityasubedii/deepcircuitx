            assign in_payload[
                DATA_WIDTH + PACKET_WIDTH - 1 : 
                DATA_WIDTH
            ] = {in_startofpacket, in_endofpacket};