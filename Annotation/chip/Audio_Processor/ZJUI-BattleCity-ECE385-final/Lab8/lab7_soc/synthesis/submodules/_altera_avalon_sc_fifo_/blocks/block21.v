            always @(posedge clk or posedge reset) begin
                if (reset) 
                    fifo_fill_level <= 0;
                else if (next_full & !drop_on_error)
                    fifo_fill_level <= depth32[ADDR_WIDTH:0];
                else begin
                    fifo_fill_level[ADDR_WIDTH]     <= 1'b0;
                    fifo_fill_level[ADDR_WIDTH-1 : 0] <= next_wr_ptr - next_rd_ptr;
                end
            end