            else begin : gen_blk6_else
                assign out_error = in_error;
                if (CHANNEL_WIDTH > 0) begin : gen_blk8
                    assign in_payload = {in_data, in_channel};
                    assign {out_data, out_channel} = out_payload;
                end