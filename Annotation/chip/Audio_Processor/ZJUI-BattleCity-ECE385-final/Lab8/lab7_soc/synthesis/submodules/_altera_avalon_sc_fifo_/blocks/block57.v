    generate
        if (USE_PACKETS) begin : gen_blk2
            if (ERROR_WIDTH > 0) begin : gen_blk3
                if (CHANNEL_WIDTH > 0) begin : gen_blk4
                    assign in_payload = {in_packet_signals, in_data, in_error, in_channel};
                    assign {out_packet_signals, out_data, out_error, out_channel} = out_payload;
                end
                else begin : gen_blk4_else
                    assign out_channel = in_channel;
                    assign in_payload = {in_packet_signals, in_data, in_error};
                    assign {out_packet_signals, out_data, out_error} = out_payload;
                end
            end
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
        end
        else begin : gen_blk2_else
            assign out_packet_signals = 0;
            if (ERROR_WIDTH > 0) begin : gen_blk6
                if (CHANNEL_WIDTH > 0) begin : gen_blk7
                    assign in_payload = {in_data, in_error, in_channel};
                    assign {out_data, out_error, out_channel} = out_payload;
                end
                else begin : gen_blk7_else
                    assign out_channel = in_channel;
                    assign in_payload = {in_data, in_error};
                    assign {out_data, out_error} = out_payload;
                end
            end
            else begin : gen_blk6_else
                assign out_error = in_error;
                if (CHANNEL_WIDTH > 0) begin : gen_blk8
                    assign in_payload = {in_data, in_channel};
                    assign {out_data, out_channel} = out_payload;
                end
                else begin : gen_blk8_else
                    assign out_channel = in_channel;
                    assign in_payload = in_data;
                    assign out_data = out_payload;
                end
            end
        end
    endgenerate