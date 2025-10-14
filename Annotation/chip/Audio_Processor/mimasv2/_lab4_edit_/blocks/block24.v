  always @(posedge clock) begin   
     if (ready) begin
         offset <= offset + 5'h1;
     end			
  
end