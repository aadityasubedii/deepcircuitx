always @(posedge clk_i)
begin
  if (mcb_cmd_en_i)
   mcb_cmd_bl_r <= mcb_cmd_bl_i;
end   