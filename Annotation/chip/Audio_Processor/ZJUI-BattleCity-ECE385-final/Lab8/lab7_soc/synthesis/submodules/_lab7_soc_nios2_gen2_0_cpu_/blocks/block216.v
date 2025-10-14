  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
          readdata <= 0;
      else 
        readdata <= address[8] ? oci_reg_readdata : ociram_readdata;
    end