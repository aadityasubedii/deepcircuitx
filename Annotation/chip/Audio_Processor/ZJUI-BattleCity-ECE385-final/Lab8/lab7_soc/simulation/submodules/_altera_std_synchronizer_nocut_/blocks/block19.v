   initial begin
      if (depth <2) begin
         $display("%m: Error: synchronizer length: %0d less than 2.", depth);
      end
   end