      always @(posedge auxout_clk or posedge rst_auxout)  begin
        if (rst_auxout) begin
            aux_out[5]  <= #100 0;
            aux_out[7]  <= #100 0;
        end
        else begin
            aux_out[5]  <= #100 aux_out_[5];
            aux_out[7]  <= #100 aux_out_[7];
        end
      end