   always @(posedge clk) begin
     if (we) mem[addr] <= din;
     dout <= mem[addr];
   end