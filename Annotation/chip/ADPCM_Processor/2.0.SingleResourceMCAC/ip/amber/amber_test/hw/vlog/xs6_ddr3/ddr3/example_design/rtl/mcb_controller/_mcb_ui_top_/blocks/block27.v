function integer calc_num_time_slots (
  input [5:0]   port_enable,
  input integer port_config
);
begin : func_calc_num_tim_slots
  integer num_ports;
  integer i;
  num_ports = 0;
  for (i = 0; i < 6; i = i + 1) begin
    if (port_enable[i] == 1'b1) begin
      num_ports = num_ports + 1;
    end
  end
  calc_num_time_slots = (port_config == 1 && num_ports == 5) ? 10 : 12;
end
endfunction