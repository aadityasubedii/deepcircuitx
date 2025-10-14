  generate begin : pointer_ram
      wire pointer_we = new_rd_data || ~ram_init_done_r;
      wire [3:0] pointer_wr_data = ram_init_done_r
                                    ? wr_data_addr_r
                                    : ram_init_addr;
      wire [3:0] pointer_wr_addr = ram_init_done_r
                                    ? rd_data_indx_r
                                    : ram_init_addr;
      genvar i;
      for (i=0; i<PNTR_RAM_CNT; i=i+1) begin : rams
        RAM32M
          #(.INIT_A(64'h0000000000000000),
            .INIT_B(64'h0000000000000000),
            .INIT_C(64'h0000000000000000),
            .INIT_D(64'h0000000000000000)
          ) RAM32M0 (
            .DOA(),
            .DOB(wr_data_buf_addr[i*2+:2]),
            .DOC(wr_data_pntr[i*2+:2]),
            .DOD(),
            .DIA(2'b0),
            .DIB(pointer_wr_data[i*2+:2]),
            .DIC(pointer_wr_data[i*2+:2]),
            .DID(2'b0),
            .ADDRA(5'b0),
            .ADDRB({1'b0, data_buf_addr_cnt_r}),
            .ADDRC({1'b0, wr_data_indx_r}),
            .ADDRD({1'b0, pointer_wr_addr}),
            .WE(pointer_we),
            .WCLK(clk)
           );
      end 
    end 
  endgenerate