  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          monitor_ready <= 1'b0;
          monitor_error <= 1'b0;
          monitor_go <= 1'b0;
        end
      else 
        begin
          if (take_action_ocimem_a && jdo[25])
              monitor_ready <= 1'b0;
          else if (take_action_ocireg && ocireg_mrs)
              monitor_ready <= 1'b1;
          if (take_action_ocimem_a && jdo[25])
              monitor_error <= 1'b0;
          else if (take_action_ocireg && ocireg_ers)
              monitor_error <= 1'b1;
          if (take_action_ocimem_a && jdo[23])
              monitor_go <= 1'b1;
          else if (st_ready_test_idle)
              monitor_go <= 1'b0;
        end
    end