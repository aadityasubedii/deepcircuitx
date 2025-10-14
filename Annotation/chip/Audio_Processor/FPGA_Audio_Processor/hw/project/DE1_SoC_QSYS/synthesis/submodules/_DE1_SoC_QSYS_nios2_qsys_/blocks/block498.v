  always @(posedge clk or negedge jrst_n)
    begin
      if (jrst_n == 0)
        begin
          break_on_reset <= 1'b0;
          resetrequest <= 1'b0;
          jtag_break <= 1'b0;
        end
      else if (take_action_ocimem_a)
        begin
          resetrequest <= jdo[22];
          jtag_break <= jdo[21]     ? 1 
                    : jdo[20]  ? 0 
                    : jtag_break;

          break_on_reset <= jdo[19]     ? 1
                    : jdo[18]  ? 0
                    :  break_on_reset;

          resetlatch <= jdo[24] ? 0 : resetlatch;
        end
      else if (reset_sync)
        begin
          jtag_break <= break_on_reset;
          resetlatch <= 1;
        end
      else if (debugreq & ~debugack & break_on_reset)
          jtag_break <= 1'b1;
    end