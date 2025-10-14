        genvar i;
        for (i=0; i<RAM_CNT; i=i+1) begin : rd_buffer_ram
          RAM32M
            #(.INIT_A(64'h0000000000000000),
              .INIT_B(64'h0000000000000000),
              .INIT_C(64'h0000000000000000),
              .INIT_D(64'h0000000000000000)
          ) RAM32M0 (
              .DOA(rd_buf_out_data[((i*6)+4)+:2]),
              .DOB(rd_buf_out_data[((i*6)+2)+:2]),
              .DOC(rd_buf_out_data[((i*6)+0)+:2]),
              .DOD(),
              .DIA(rd_buf_in_data[((i*6)+4)+:2]),
              .DIB(rd_buf_in_data[((i*6)+2)+:2]),
              .DIC(rd_buf_in_data[((i*6)+0)+:2]),
              .DID(2'b0),
              .ADDRA(rd_buf_indx_copy_r[4:0]),
              .ADDRB(rd_buf_indx_copy_r[4:0]),
              .ADDRC(rd_buf_indx_copy_r[4:0]),
              .ADDRD(rd_buf_wr_addr),
              .WE(rd_buf_we),
              .WCLK(clk)
             );
        end 
      end