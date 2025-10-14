      always @(posedge auxout_clk or posedge rst_auxout)  begin
        if (rst_auxout) begin
            aux_out[9]  <= #100 0;
            aux_out[11] <= #100 0;
        end
        else begin
            aux_out[9]  <= #100 aux_out_[9];
            aux_out[11] <= #100 aux_out_[11];
        end
      end