always @ (posedge clk_i)
begin
if (rst_i[8])
   wait_done <= #TCQ  1'b1;
else if (push_cmd_r)
   wait_done <=  #TCQ 1'b1;
else if (cmd_rdy_o && cmd_valid_i && FAMILY == "SPARTAN6")
   wait_done <=  #TCQ 1'b0;


end