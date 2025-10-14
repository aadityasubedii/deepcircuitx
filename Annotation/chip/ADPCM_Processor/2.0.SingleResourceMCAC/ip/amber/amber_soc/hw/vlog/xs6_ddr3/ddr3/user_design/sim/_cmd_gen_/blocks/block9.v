always @ (posedge clk_i) begin
   case(instr_mode_i)
         0: instr_out <= #TCQ    bram_instr_i;
         1: instr_out <= #TCQ    fixed_instr_i;
         2: instr_out <= #TCQ    {2'b00,(prbs_instr_a[0] | force_rd)};
         3: instr_out <= #TCQ    {2'b0,prbs_instr_a[0]};  
         4: instr_out <= #TCQ    {1'b0,prbs_instr_b[0], prbs_instr_a[0]};  
         

         5: instr_out <= #TCQ    {refresh_prbs ,prbs_instr_b[0], prbs_instr_a[0]};  


         default : instr_out <= #TCQ    {2'b00,prbs_instr_a[0]};
   endcase
end