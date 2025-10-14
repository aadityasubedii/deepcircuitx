   always @(posedge auxout_clk or posedge rst_auxout)  begin
     if (rst_auxout) begin
         aux_out[8]  <= #100 0;
         aux_out[10] <= #100 0;
     end
     else begin
         aux_out[8]  <= #100 aux_out_[8];
         aux_out[10] <= #100 aux_out_[10];
     end
   end