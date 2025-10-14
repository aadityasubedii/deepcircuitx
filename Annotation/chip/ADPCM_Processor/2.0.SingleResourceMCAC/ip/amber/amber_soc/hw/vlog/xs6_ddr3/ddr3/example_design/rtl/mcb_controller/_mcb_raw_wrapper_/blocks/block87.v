always @ (posedge ui_clk)
if (sys_rst)
   begin
      selfrefresh_enter_r1 <= 1'b0;
      selfrefresh_enter_r2 <= 1'b0;
      selfrefresh_enter_r3 <= 1'b0;
   end
else
   begin
      selfrefresh_enter_r1 <= selfrefresh_enter;
      selfrefresh_enter_r2 <= selfrefresh_enter_r1;
      selfrefresh_enter_r3 <= selfrefresh_enter_r2;
   end