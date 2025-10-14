  generate
    begin : ram_buf
      wire [RAM_WIDTH-1:0] buf_in_data;
      if (REMAINDER == 0)
        assign buf_in_data = payload;
      else
        assign buf_in_data = {{6-REMAINDER{1'b0}}, payload};

      genvar i;
      for (i=0; i<RAM_CNT; i=i+1) begin : rd_buffer_ram
        RAM32M
          #(.INIT_A(64'h0000000000000000),
            .INIT_B(64'h0000000000000000),
            .INIT_C(64'h0000000000000000),
            .INIT_D(64'h0000000000000000)
          ) RAM32M0 (
            .DOA(buf_out_data[((i*6)+4)+:2]),
            .DOB(buf_out_data[((i*6)+2)+:2]),
            .DOC(buf_out_data[((i*6)+0)+:2]),
            .DOD(),
            .DIA(buf_in_data[((i*6)+4)+:2]),
            .DIB(buf_in_data[((i*6)+2)+:2]),
            .DIC(buf_in_data[((i*6)+0)+:2]),
            .DID(2'b0),
            .ADDRA(buf_rd_addr_r),
            .ADDRB(buf_rd_addr_r),
            .ADDRC(buf_rd_addr_r),
            .ADDRD(buf_wr_addr),
            .WE(wr_ecc_buf),
            .WCLK(clk)
           );
      end 
    end
  endgenerate