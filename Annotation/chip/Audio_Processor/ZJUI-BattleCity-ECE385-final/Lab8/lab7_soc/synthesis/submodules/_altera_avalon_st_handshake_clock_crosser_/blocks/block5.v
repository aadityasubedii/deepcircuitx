        if (EMPTY_WIDTH) begin
            assign out_empty = out_payload[
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W + EMPTY_WIDTH - 1 : 
              DATA_WIDTH + PACKET_WIDTH + PCHANNEL_W
            ];
        end else begin
            
            assign out_empty = 1'b0;