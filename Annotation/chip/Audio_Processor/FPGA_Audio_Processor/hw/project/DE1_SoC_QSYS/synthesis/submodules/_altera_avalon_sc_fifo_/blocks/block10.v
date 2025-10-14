      always @(posedge clk or posedge reset) begin
          if (reset) begin
              almost_full_threshold  <= max_fifo_size[23 : 0];
              almost_empty_threshold <= 0;
              csr_readdata           <= 0;
          end
          else begin
             if (csr_read) begin
                csr_readdata <= 32'b0;
                if (csr_address == 3)
                    csr_readdata <= {8'b0, almost_empty_threshold};
                else if (csr_address == 2)
                    csr_readdata <= {8'b0, almost_full_threshold};
                else if (csr_address == 0)
                    csr_readdata <= {{(31 - ADDR_WIDTH){1'b0}}, fill_level};
             end
             else if (csr_write) begin
               if(csr_address == 3'b011)
                   almost_empty_threshold <= csr_writedata[23:0];
               else if(csr_address == 3'b010)
                  almost_full_threshold  <= csr_writedata[23:0];
             end       
          end
      end
    end