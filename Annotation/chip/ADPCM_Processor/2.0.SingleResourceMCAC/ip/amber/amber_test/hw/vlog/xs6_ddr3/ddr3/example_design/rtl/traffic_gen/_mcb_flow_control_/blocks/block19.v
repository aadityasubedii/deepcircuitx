always @ (posedge clk_i)
begin
if (rst_i[8])
    cmd_en_r1 <= #TCQ  1'b0;
else if ( xfer_cmd)
    cmd_en_r1 <= #TCQ  1'b1;
 else if (!mcb_cmd_full)
    cmd_en_r1 <= #TCQ  1'b0;
 
 end