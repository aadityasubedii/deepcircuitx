always @ (posedge clk_i) begin
if (rst_i[4])
   refresh_cmd_en <= #TCQ  'b0;

else if (refresh_timer == 10'h3ff)

   refresh_cmd_en <= #TCQ  'b1;
else if (cmd_clk_en && refresh_cmd_en)
   refresh_cmd_en <= #TCQ  'b0;

end   