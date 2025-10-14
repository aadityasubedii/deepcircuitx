  always @(posedge clk or negedge rst_n)
    begin
      if (rst_n == 0)
        begin
          bytes_left <= 32'h0;
          fifo_rd_d <= 1'b0;
        end
      else 
        begin
          fifo_rd_d <= fifo_rd;
          
          if (fifo_rd_d)
              bytes_left <= bytes_left - 1'b1;
          
          if (new_rom)
              bytes_left <= num_bytes;
        end
    end