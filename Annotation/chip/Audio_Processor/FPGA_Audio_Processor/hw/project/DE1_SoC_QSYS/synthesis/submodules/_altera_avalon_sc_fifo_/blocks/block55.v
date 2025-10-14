                else begin : gen_blk8_else
                    assign out_channel = in_channel;
                    assign in_payload = in_data;
                    assign out_data = out_payload;