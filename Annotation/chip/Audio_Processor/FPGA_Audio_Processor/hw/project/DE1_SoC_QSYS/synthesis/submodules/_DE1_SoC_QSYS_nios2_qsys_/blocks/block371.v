  always @(posedge clk or negedge reset_n)
    begin
      if (reset_n == 0)
        begin
          dbrk_trigout <= 0;
          dbrk_break_pulse <= 0;
          dbrk_traceoff <= 0;
          dbrk_traceon <= 0;
          dbrk_traceme <= 0;
          dbrk_goto0 <= 0;
          dbrk_goto1 <= 0;
        end
      else 
        begin
          dbrk_trigout <= dbrk0_trigout | dbrk1_trigout | dbrk2_trigout | dbrk3_trigout;
          dbrk_break_pulse <= dbrk0_break_pulse | dbrk1_break_pulse | dbrk2_break_pulse | dbrk3_break_pulse;
          dbrk_traceoff <= dbrk0_traceoff | dbrk1_traceoff | dbrk2_traceoff | dbrk3_traceoff;
          dbrk_traceon <= dbrk0_traceon | dbrk1_traceon | dbrk2_traceon | dbrk3_traceon;
          dbrk_traceme <= dbrk0_traceme | dbrk1_traceme | dbrk2_traceme | dbrk3_traceme;
          dbrk_goto0 <= dbrk0_goto0 | dbrk1_goto0 | dbrk2_goto0 | dbrk3_goto0;
          dbrk_goto1 <= dbrk0_goto1 | dbrk1_goto1 | dbrk2_goto1 | dbrk3_goto1;
        end
    end