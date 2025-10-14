always @ (posedge ui_clk)
begin 
if (sys_rst)   
   normal_operation_window <= 1'b1;
else if (selfrefresh_enter_r2 || selfrefresh_mode)
   normal_operation_window <= 1'b0;
else if (~selfrefresh_enter_r2 && ~selfrefresh_mode)
   normal_operation_window <= 1'b1;
else
   normal_operation_window <= normal_operation_window;

end   