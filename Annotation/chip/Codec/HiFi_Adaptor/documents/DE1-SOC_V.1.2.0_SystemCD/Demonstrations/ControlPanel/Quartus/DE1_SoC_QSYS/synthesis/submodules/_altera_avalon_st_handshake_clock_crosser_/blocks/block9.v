            assign {out_startofpacket, out_endofpacket} = 
                out_payload[DATA_WIDTH + PACKET_WIDTH - 1 : DATA_WIDTH];