`default_nettype none

module switch_synchronizers (
  input wire        i_clk,
  input wire  [3:0] i_switches,
  output wire [3:0] o_switches
);
  
  wire w_switch_1;
  synchronizer switch_1_sync (
    .i_clk(i_clk),
    .i_input(i_switches[0]),
    .o_input_sync(w_switch_1)
  );

  wire w_switch_2;
  synchronizer switch_2_sync (
    .i_clk(i_clk),
    .i_input(i_switches[1]),
    .o_input_sync(w_switch_2)
  );

  wire w_switch_3;
  synchronizer switch_3_sync (
    .i_clk(i_clk),
    .i_input(i_switches[2]),
    .o_input_sync(w_switch_3)
  );
  
  wire w_switch_4;
  synchronizer switch_4_sync (
    .i_clk(i_clk),
    .i_input(i_switches[3]),
    .o_input_sync(w_switch_4)
  );

  assign o_switches = {w_switch_4, w_switch_3, w_switch_2, w_switch_1};

endmodule