            else begin : gen_blk3_else
                assign out_error = in_error;
                if (CHANNEL_WIDTH > 0) begin : gen_blk5
                    assign in_payload = {in_packet_signals, in_data, in_channel};
                    assign {out_packet_signals, out_data, out_channel} = out_payload;
                end
                else begin : gen_blk5_else
                    assign out_channel = in_channel;
                    assign in_payload = {in_packet_signals, in_data};
                    assign {out_packet_signals, out_data} = out_payload;
                end
            end