          always @(posedge clk) begin
            if (mux_rd_valid_r) begin
              sr_rise0_r[rd_i] <= #TCQ {mux_rd_rise0_r[rd_i]};
              sr_fall0_r[rd_i] <= #TCQ {mux_rd_fall0_r[rd_i]};
              sr_rise1_r[rd_i] <= #TCQ {mux_rd_rise1_r[rd_i]};
              sr_fall1_r[rd_i] <= #TCQ {mux_rd_fall1_r[rd_i]};
            end
          end