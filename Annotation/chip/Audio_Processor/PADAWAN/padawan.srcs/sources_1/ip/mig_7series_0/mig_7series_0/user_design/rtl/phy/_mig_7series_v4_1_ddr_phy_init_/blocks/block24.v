      always @(posedge clk) begin
        if (rst) begin
          mr2_r[rnk_i]  <= #TCQ 2'b00;
          mr1_r[rnk_i]  <= #TCQ 3'b000;
        end else begin
          mr2_r[rnk_i]  <= #TCQ tmp_mr2_r[rnk_i];
          mr1_r[rnk_i]  <= #TCQ tmp_mr1_r[rnk_i];
        end
      end
    end