always @ (posedge clk_i) begin
if (rst_i[4])
   refresh_timer <= #TCQ  'b0;
else
   refresh_timer <= #TCQ  refresh_timer + 1'b1;

end