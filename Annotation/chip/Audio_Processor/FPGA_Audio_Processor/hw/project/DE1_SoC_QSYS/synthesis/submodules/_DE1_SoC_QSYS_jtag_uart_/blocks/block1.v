  always @(fifo_EF)
    begin
      dataavailable = ~fifo_EF;
    end