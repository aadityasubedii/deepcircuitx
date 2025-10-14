function [17:0] convert_arb_slot (
  input [5:0]   port_enable,
  input integer port_config,
  input [17:0]  mig_arb_slot
);
begin : func_convert_arb_slot
  integer i;
  integer num_ports;
  integer mig_port_num;
  reg [17:0] port_map;
  num_ports = 0;

  
  case (port_config)
    1: port_map = 18'o543210;
    2: port_map = 18'o774210;
    3: port_map = 18'o777420;
    4: port_map = 18'o777720;
    5: port_map = 18'o777770;

    default : $display ("ERROR: Invalid Port Configuration.");

  endcase

  
  for (i = 0; i < 6; i = i + 1) begin
    if (port_enable[i] == 1'b1) begin
      num_ports = num_ports + 1;
    end
  end

  
  for (i = 0; i < 6; i = i + 1) begin
    if (i < num_ports) begin
      mig_port_num = mig_arb_slot[3*(num_ports-i-1) +: 3];
      convert_arb_slot[3*i +: 3] = port_map[3*mig_port_num +: 3];
    end else begin
      convert_arb_slot[3*i +: 3] = 3'b111;
    end
  end
end
endfunction