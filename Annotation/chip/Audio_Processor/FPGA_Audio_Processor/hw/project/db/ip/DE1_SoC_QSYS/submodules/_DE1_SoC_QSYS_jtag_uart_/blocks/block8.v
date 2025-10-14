  always @(posedge clk or negedge rst_n)
    begin
      if (rst_n == 0)
        begin
          fifo_AE <= 1'b0;
          fifo_AF <= 1'b0;
          fifo_wr <= 1'b0;
          rvalid <= 1'b0;
          read_0 <= 1'b0;
          ien_AE <= 1'b0;
          ien_AF <= 1'b0;
          ac <= 1'b0;
          woverflow <= 1'b0;
          av_waitrequest <= 1'b1;
        end
      else 
        begin
          fifo_AE <= {fifo_FF,wfifo_used} <= 8;
          fifo_AF <= (7'h40 - {rfifo_full,rfifo_used}) <= 8;
          fifo_wr <= 1'b0;
          read_0 <= 1'b0;
          av_waitrequest <= ~(av_chipselect & (~av_write_n | ~av_read_n) & av_waitrequest);
          if (activity)
              ac <= 1'b1;
          
          if (av_chipselect & ~av_write_n & av_waitrequest)
              
              if (av_address)
                begin
                  ien_AF <= av_writedata[0];
                  ien_AE <= av_writedata[1];
                  if (av_writedata[10] & ~activity)
                      ac <= 1'b0;
                end
              else 
                begin
                  fifo_wr <= ~fifo_FF;
                  woverflow <= fifo_FF;
                end
          
          if (av_chipselect & ~av_read_n & av_waitrequest)
            begin
              
              if (~av_address)
                  rvalid <= ~fifo_EF;
              read_0 <= ~av_address;
            end
        end
    end