  always @(posedge clk) begin
    rdlvl_stg1_done_r1  <= #TCQ rdlvl_stg1_done;
    prbs_rdlvl_done_r1  <= #TCQ prbs_rdlvl_done;
    reset_if_r1         <= #TCQ reset_if;
    reset_if_r2         <= #TCQ reset_if_r1;
    reset_if_r3         <= #TCQ reset_if_r2;
    reset_if_r4         <= #TCQ reset_if_r3;
    reset_if_r5         <= #TCQ reset_if_r4;
    reset_if_r6         <= #TCQ reset_if_r5;
    reset_if_r7         <= #TCQ reset_if_r6;
    reset_if_r8         <= #TCQ reset_if_r7;
    reset_if_r9         <= #TCQ reset_if_r8;
  end