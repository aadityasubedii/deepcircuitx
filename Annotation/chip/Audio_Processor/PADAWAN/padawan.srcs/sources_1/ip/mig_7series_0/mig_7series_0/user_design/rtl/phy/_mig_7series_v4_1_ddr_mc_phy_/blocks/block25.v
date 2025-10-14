   always @(posedge auxout_clk or posedge rst_auxout)  begin
     if (rst_auxout) begin
         aux_out[4]  <= #100 0;
         aux_out[6]  <= #100 0;
     end
     else begin
         aux_out[4]  <= #100 aux_out_[4];
         aux_out[6]  <= #100 aux_out_[6];
     end
   end