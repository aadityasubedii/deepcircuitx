        always @(posedge clk) rd_buf_we_r1 <= #TCQ rd_buf_we;
        RAM32M
          #(.INIT_A(64'h0000000000000000),
            .INIT_B(64'h0000000000000000),
            .INIT_C(64'h0000000000000000),
            .INIT_D(64'h0000000000000000)
           ) RAM32M0 (
            .DOA(rd_status),
            .DOB(),
            .DOC(wr_status),
            .DOD(),
            .DIA(status_ram_wr_data_r),
            .DIB(2'b0),
            .DIC(status_ram_wr_data_r),
            .DID(status_ram_wr_data_r),
            .ADDRA(rd_buf_indx_r[4:0]),
            .ADDRB(5'b0),
            .ADDRC(status_ram_wr_addr_ns),
            .ADDRD(status_ram_wr_addr_r),
            .WE(rd_buf_we_r1),
            .WCLK(clk)
           );
      end 