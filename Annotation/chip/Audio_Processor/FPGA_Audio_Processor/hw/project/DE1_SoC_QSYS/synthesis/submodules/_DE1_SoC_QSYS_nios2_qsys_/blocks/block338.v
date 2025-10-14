  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          atm <= 0;
          dtm <= 0;
        end
      else if (0)
        begin
          if (cpu_d_write & ~cpu_d_wait & record_store_addr)
              atm <= {4'b0101, cpu_d_address_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_addr)
              atm <= {4'b0100, cpu_d_address_0_padded};
          else 
            atm <= {4'b0000, cpu_d_address_0_padded};
          if (cpu_d_write & ~cpu_d_wait & record_store_data)
              dtm <= {4'b0111, cpu_d_writedata_0_padded};
          else if (cpu_d_read & ~cpu_d_wait & record_load_data)
              dtm <= {4'b0110, cpu_d_readdata_0_padded};
          else 
            dtm <= {4'b0000, cpu_d_readdata_0_padded};
        end
      else 
        begin
          atm <= 0;
          dtm <= 0;
        end
    end