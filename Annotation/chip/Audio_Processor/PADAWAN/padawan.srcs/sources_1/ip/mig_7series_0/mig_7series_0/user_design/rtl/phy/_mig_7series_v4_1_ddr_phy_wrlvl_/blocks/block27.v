     always @(posedge clk) begin
       if (rst || (wrlvl_byte_redo && ~wrlvl_byte_redo_r) ||
         (wrlvl_final && ~wrlvl_final_r))
         done_dqs_dec <= #TCQ 1'b0;
       else if (~oclkdelay_calib_done)
         done_dqs_dec <= #TCQ wr_level_done_r;
       else if (wr_level_done_r3 && ~wr_level_done_r4)
         done_dqs_dec <= #TCQ 1'b1;
     end