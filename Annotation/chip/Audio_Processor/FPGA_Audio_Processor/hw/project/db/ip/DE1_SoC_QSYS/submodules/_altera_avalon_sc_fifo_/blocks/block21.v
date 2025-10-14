            always @(posedge clk or posedge reset) begin
                if (reset) begin
                    curr_packet_len_less_one <= 0;
                end else begin
                    if (write) begin
                        curr_packet_len_less_one <= curr_packet_len_less_one + 1'b1;
                        if (in_endofpacket)
                            curr_packet_len_less_one <= 0;
                    end
                end
            end