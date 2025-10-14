always @ (posedge clk_i) begin
if (rst_i[3])
  addr_out <= #TCQ    start_addr_i;
else
   case({addr_mode_reg})
         3'b000: addr_out <= #TCQ    bram_addr_i;
         3'b001: addr_out <= #TCQ    fixed_addr;
         3'b010: addr_out <= #TCQ    prbs_addr;
         3'b011: addr_out <= #TCQ    {2'b0,seq_addr[29:0]};
         3'b100: addr_out <= #TCQ    {2'b00,seq_addr[6:2],seq_addr[23:0]};
         3'b101: addr_out <= #TCQ    {prbs_addr[31:20],seq_addr[19:0]} ;

         default : addr_out <= #TCQ    'b0;
   endcase
end