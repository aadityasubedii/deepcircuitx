            always @(posedge clk or posedge reset) begin
                if (reset) begin
                    fifo_fill_level <= 0;
                end else if (drop_on_error) begin
                    fifo_fill_level <= fifo_fill_level - curr_packet_len_less_one;
                    if (read)
                        fifo_fill_level <= fifo_fill_level - curr_packet_len_less_one - 1'b1;
                end else if (write && !read) begin
                    fifo_fill_level <= fifo_fill_level + 1'b1;
                end else if (read && !write) begin
                    fifo_fill_level <= fifo_fill_level - 1'b1;
                end
            end