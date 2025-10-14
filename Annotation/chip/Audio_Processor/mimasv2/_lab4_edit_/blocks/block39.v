   always @(posedge clock) begin
      if (ready) index <= index+9'h1;
   end