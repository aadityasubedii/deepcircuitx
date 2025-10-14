always @ (posedge clk_i)
begin
if (rst_i[9]) begin
    addr_o <= #TCQ  'b0;
    cmd_o  <= #TCQ  'b0;
    bl_o   <= #TCQ  'b0;
end
else if (xfer_cmd ) begin
    addr_o <= #TCQ  addr_reg;           
    if (FAMILY == "SPARTAN6")
        cmd_o <= #TCQ  cmd_reg;
    else
        cmd_o  <= #TCQ  {2'b00,cmd_reg[0]};
    bl_o   <= #TCQ  bl_reg;
end

end