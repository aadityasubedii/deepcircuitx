always @(posedge clk_i)
begin
  if (current_address[7:0] >= end_boundary_addr[7:0])

   lower_end_matched <= 1'b1;
  else
   lower_end_matched <= 1'b0;
  
end   