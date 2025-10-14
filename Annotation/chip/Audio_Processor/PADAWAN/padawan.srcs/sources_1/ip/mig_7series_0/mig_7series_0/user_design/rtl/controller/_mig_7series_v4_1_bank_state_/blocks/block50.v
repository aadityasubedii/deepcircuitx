        always @(posedge clk) op_cnt_r <= #TCQ op_cnt_ns;
        assign op_exit_req = (low_idle_cnt_r && op_active) ||
                             (op_wait_r && ~|op_cnt_r);
      end