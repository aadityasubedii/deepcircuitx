always @ (posedge clk_i)
begin
  if (current_address[29:24] >= end_boundary_addr[29:24])
      AC3_G_E3 <= 1'b1;
  else
      AC3_G_E3 <= 1'b0;
  
  
    if (current_address[23:16] >= end_boundary_addr[23:16])
      AC2_G_E2 <= 1'b1;
  else
      AC2_G_E2 <= 1'b0;
  
  if (current_address[15:8] >= end_boundary_addr[15:8])
      AC1_G_E1 <= 1'b1;
else
      AC1_G_E1 <= 1'b0;
  
  
end