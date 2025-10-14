always @(posedge clk_i)
begin
if (rst_i)
     upper_end_matched <= 1'b0;
 
 else if (mcb_cmd_en_i)
     upper_end_matched <= AC3_G_E3 & AC2_G_E2 & AC1_G_E1;
end   