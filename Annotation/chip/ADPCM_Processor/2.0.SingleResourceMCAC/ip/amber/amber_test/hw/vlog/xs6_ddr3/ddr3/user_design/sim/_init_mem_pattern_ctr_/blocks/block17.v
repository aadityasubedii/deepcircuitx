always @(posedge clk_i)
begin

     end_boundary_addr <= (END_ADDRESS[31:0] - (DWIDTH/8) +1) ;

end   