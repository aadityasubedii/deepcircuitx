        assign op_exit_req = (low_idle_cnt_r && op_active) ||
                             (op_wait_r && ~|op_cnt_r);