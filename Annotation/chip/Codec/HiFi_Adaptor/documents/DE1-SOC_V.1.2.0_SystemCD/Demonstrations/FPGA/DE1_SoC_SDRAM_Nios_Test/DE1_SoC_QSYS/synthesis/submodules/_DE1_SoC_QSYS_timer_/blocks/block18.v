  assign read_mux_out = ({16 {(address == 2)}} & period_l_register) |
    ({16 {(address == 3)}} & period_h_register) |
    ({16 {(address == 4)}} & snap_read_value[15 : 0]) |
    ({16 {(address == 5)}} & snap_read_value[31 : 16]) |
    ({16 {(address == 1)}} & control_register) |
    ({16 {(address == 0)}} & {counter_is_running,
    timeout_occurred});