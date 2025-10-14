      always @(posedge auxout_clk or posedge rst_auxout)  begin
        if (rst_auxout) begin
            aux_out[1]  <= #100 0;
            aux_out[3]  <= #100 0;
        end
        else begin
            aux_out[1]  <= #100 aux_out_[1];
            aux_out[3]  <= #100 aux_out_[3];
        end
      end