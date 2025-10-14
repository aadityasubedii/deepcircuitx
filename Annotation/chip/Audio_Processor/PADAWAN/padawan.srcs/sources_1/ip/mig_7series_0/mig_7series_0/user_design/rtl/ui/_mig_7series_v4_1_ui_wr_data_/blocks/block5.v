      for (i=0; i<RAM_CNT; i=i+1) begin : wr_buffer_ram
        RAM32M
          #(.INIT_A(64'h0000000000000000),
            .INIT_B(64'h0000000000000000),
            .INIT_C(64'h0000000000000000),
            .INIT_D(64'h0000000000000000)
          ) RAM32M0 (
            .DOA(wr_buf_out_data_w[((i*6)+4)+:2]),
            .DOB(wr_buf_out_data_w[((i*6)+2)+:2]),
            .DOC(wr_buf_out_data_w[((i*6)+0)+:2]),
            .DOD(),
            .DIA(wr_buf_in_data[((i*6)+4)+:2]),
            .DIB(wr_buf_in_data[((i*6)+2)+:2]),
            .DIC(wr_buf_in_data[((i*6)+0)+:2]),
            .DID(2'b0),
            .ADDRA(rd_addr_w),
            .ADDRB(rd_addr_w),
            .ADDRC(rd_addr_w),
            .ADDRD(wb_wr_data_addr_w),
            .WE(wdf_rdy_ns),
            .WCLK(clk)
           );
      end 