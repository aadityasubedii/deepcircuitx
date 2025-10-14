      genvar i;
      for (i=0; i<RAM_CNT; i=i+1) begin : fifo_ram
        RAM32M
          #(.INIT_A(64'h0000000000000000),
            .INIT_B(64'h0000000000000000),
            .INIT_C(64'h0000000000000000),
            .INIT_D(64'h0000000000000000)
          ) RAM32M0 (
            .DOA(fifo_out_data_ns[((i*6)+4)+:2]),
            .DOB(fifo_out_data_ns[((i*6)+2)+:2]),
            .DOC(fifo_out_data_ns[((i*6)+0)+:2]),
            .DOD(),
            .DIA(fifo_in_data[((i*6)+4)+:2]),
            .DIB(fifo_in_data[((i*6)+2)+:2]),
            .DIC(fifo_in_data[((i*6)+0)+:2]),
            .DID(2'b0),
            .ADDRA(tail_ns),
            .ADDRB(tail_ns),
            .ADDRC(tail_ns),
            .ADDRD(head_r),
            .WE(1'b1),
            .WCLK(clk)
           );
      end 