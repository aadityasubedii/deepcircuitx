  always @(posedge clk) begin
    ck_addr_cmd_delay_done_r1 <= #TCQ ck_addr_cmd_delay_done;
    ck_addr_cmd_delay_done_r2 <= #TCQ ck_addr_cmd_delay_done_r1;
    ck_addr_cmd_delay_done_r3 <= #TCQ ck_addr_cmd_delay_done_r2;
    ck_addr_cmd_delay_done_r4 <= #TCQ ck_addr_cmd_delay_done_r3;
    ck_addr_cmd_delay_done_r5 <= #TCQ ck_addr_cmd_delay_done_r4;
    ck_addr_cmd_delay_done_r6 <= #TCQ ck_addr_cmd_delay_done_r5;
  end