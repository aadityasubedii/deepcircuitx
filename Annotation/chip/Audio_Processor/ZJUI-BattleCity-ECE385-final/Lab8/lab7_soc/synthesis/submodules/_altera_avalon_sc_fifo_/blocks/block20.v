        always @* begin
            fill_level = fifo_fill_level;

            if (EMPTY_LATENCY == 3)
                fill_level = fifo_fill_level + {{ADDR_WIDTH{1'b0}}, out_valid};
        end