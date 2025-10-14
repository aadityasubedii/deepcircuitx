            always @(posedge clk) begin
                if (in_valid && in_ready)
                    mem[wr_ptr] <= in_payload;

                internal_out_payload <= mem[mem_rd_ptr];
            end