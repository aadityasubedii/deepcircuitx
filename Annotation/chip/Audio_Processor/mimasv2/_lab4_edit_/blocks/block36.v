   always @(posedge clock) begin
      if (ready) index <= index + step;
   end