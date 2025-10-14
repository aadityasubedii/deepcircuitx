always @ (posedge clk_i) begin
   if (rst_i[3])
        if (CMD_PATTERN == "CGEN_BRAM")
         addr_mode_reg  <= #TCQ    3'b000;
        else                                     
         addr_mode_reg  <= #TCQ    3'b011;
   else if (mode_load_pulse)
         addr_mode_reg  <= #TCQ    addr_mode_i;
end