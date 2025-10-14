generate 
if(nCK_PER_CLK == 4) begin
  

   
   assign {ra2, mc_bank[3*BANK_WIDTH-1:2*BANK_WIDTH], mc_address[3*ROW_WIDTH-1:2*ROW_WIDTH], mc_ras_n[2], mc_cas_n[2], mc_we_n[2]} = cmd2;
   
  

   
   assign {ra3, mc_bank[4*BANK_WIDTH-1:3*BANK_WIDTH], mc_address[4*ROW_WIDTH-1:3*ROW_WIDTH], mc_ras_n[3], mc_cas_n[3], mc_we_n[3]} =
     cmd3;
     
end
endgenerate