                else begin : gen_blk7_else
                    assign out_channel = in_channel;
                    assign in_payload = {in_data, in_error};
                    assign {out_data, out_error} = out_payload;
                end