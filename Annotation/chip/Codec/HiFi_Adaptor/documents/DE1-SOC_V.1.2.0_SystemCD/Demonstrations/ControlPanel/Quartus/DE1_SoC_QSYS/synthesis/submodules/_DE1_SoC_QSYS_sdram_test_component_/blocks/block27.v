  always @(posedge wrclock)
    begin
      
      if (wren)
          mem_array[wraddress] <= data;
    end