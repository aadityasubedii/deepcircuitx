            if (ERROR_WIDTH > 0) begin : gen_blk6
                if (CHANNEL_WIDTH > 0) begin : gen_blk7
                    assign in_payload = {in_data, in_error, in_channel};
                    assign {out_data, out_error, out_channel} = out_payload;
                end