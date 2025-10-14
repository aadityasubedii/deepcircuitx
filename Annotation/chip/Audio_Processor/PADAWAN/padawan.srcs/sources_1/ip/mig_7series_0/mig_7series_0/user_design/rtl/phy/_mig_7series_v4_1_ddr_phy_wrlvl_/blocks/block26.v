   always @(posedge clk)
     if (rst || (wrlvl_byte_redo && ~wrlvl_byte_redo_r))
       wrlvl_byte_done <= #TCQ 1'b0;
     else if (wrlvl_byte_redo && wr_level_done_r3 && ~wr_level_done_r4)
       wrlvl_byte_done <= #TCQ 1'b1;
  