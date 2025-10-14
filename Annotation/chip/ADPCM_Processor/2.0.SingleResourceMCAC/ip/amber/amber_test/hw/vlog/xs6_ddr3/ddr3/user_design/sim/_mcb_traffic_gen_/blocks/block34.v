always @ (mcb_cmd_en_o,mcb_cmd_addr_o,mcb_cmd_bl_o,end_addr_i)

if (mcb_cmd_en_o && (mcb_cmd_addr_o + mcb_cmd_bl_o * (DWIDTH/8)) > end_addr_i[ADDR_WIDTH-1:0])
   begin
   $display("Error ! Data access beyond address range");
   error_access_range = 1'b1;
   $stop;
   end