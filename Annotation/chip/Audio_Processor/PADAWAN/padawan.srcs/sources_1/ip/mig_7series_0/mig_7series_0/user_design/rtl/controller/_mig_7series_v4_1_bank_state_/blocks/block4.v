  assign rts_col = ~sending_col && (demand_ok || override_demand_r) &&
                   col_cmd_rts && ofs_rdy_r;