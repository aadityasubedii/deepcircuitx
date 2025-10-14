      always @(posedge clk or posedge reset) begin
          if (reset) begin
              csr_readdata <= 0;
          end
          else if (csr_read) begin
              csr_readdata <= 0;

              if (csr_address == 0) 
                  csr_readdata <= {{(31 - ADDR_WIDTH){1'b0}}, fill_level};
          end
      end