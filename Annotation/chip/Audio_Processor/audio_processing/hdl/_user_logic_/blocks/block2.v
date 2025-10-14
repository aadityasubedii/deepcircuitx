always @(*)
begin
  
  case (mem_select) 
    1 : mem_ip2bus_data <= mem_data_out[0];
    default : mem_ip2bus_data <= 0;
  endcase
end