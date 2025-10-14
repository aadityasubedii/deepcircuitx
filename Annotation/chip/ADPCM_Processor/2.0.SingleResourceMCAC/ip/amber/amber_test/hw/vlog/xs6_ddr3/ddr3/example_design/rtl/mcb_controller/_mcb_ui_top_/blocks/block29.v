function [17:0] rr (
  input [5:0] port_enable,
  input integer port_config,
  input integer slot_num
);
begin : func_rr
  integer i;
  integer max_ports;
  integer num_ports;
  integer port_cnt;

  case (port_config)
    1: max_ports = 6;
    2: max_ports = 4;
    3: max_ports = 3;
    4: max_ports = 2;
    5: max_ports = 1;

    default : $display("ERROR: Port Config can't be %d", port_config);

  endcase

  num_ports = 0;
  for (i = 0; i < max_ports; i = i + 1) begin
    if (port_enable[i] == 1'b1) begin
      num_ports = num_ports + 1;
    end
  end

  rr = 18'o000000;
  port_cnt = 0;

  for (i = (num_ports-1); i >= 0; i = i - 1) begin
    while (port_enable[port_cnt] != 1'b1) begin
      port_cnt = port_cnt + 1;
    end
    rr[i*3 +: 3] = port_cnt[2:0];
    port_cnt = port_cnt +1;
  end


  rr = blso(rr, slot_num, num_ports);
end
endfunction