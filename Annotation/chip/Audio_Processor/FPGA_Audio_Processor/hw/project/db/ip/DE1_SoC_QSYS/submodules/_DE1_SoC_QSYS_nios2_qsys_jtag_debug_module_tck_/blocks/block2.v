  always @(posedge tck or negedge jrst_n)
    begin
      if (jrst_n == 0)
          ir_out <= 2'b0;
      else 
        ir_out <= {debugack_sync, monitor_ready_sync};
    end