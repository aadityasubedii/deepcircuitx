   always @(posedge auxout_clk or posedge rst_auxout)  begin
     if (rst_auxout) begin
         aux_out[0]  <= #100 0;
         aux_out[2]  <= #100 0;
     end
     else begin
         aux_out[0]  <= #100 aux_out_[0];
         aux_out[2]  <= #100 aux_out_[2];
     end
   end