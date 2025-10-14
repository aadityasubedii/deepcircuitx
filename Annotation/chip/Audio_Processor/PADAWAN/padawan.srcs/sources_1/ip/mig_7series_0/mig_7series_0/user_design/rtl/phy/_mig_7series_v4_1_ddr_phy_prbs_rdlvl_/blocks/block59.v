          always @(posedge clk) begin
            if (mux_rd_valid_r) begin
              mux_rd_rise0_r2[muxr2_i] <= #TCQ mux_rd_rise0_r1[muxr2_i];
              mux_rd_fall0_r2[muxr2_i] <= #TCQ mux_rd_fall0_r1[muxr2_i];
              mux_rd_rise1_r2[muxr2_i] <= #TCQ mux_rd_rise1_r1[muxr2_i];
              mux_rd_fall1_r2[muxr2_i] <= #TCQ mux_rd_fall1_r1[muxr2_i];      
              mux_rd_rise2_r2[muxr2_i] <= 'h0;
              mux_rd_fall2_r2[muxr2_i] <= 'h0;
              mux_rd_rise3_r2[muxr2_i] <= 'h0;
              mux_rd_fall3_r2[muxr2_i] <= 'h0;
            end
            mux_rd_rise0_r3[muxr2_i] <= #TCQ mux_rd_rise0_r2[muxr2_i];
            mux_rd_fall0_r3[muxr2_i] <= #TCQ mux_rd_fall0_r2[muxr2_i];
            mux_rd_rise1_r3[muxr2_i] <= #TCQ mux_rd_rise1_r2[muxr2_i];
            mux_rd_fall1_r3[muxr2_i] <= #TCQ mux_rd_fall1_r2[muxr2_i];
            mux_rd_rise2_r3[muxr2_i] <= 'h0;
            mux_rd_fall2_r3[muxr2_i] <= 'h0;
            mux_rd_rise3_r3[muxr2_i] <= 'h0;
            mux_rd_fall3_r3[muxr2_i] <= 'h0;

            
            mux_rd_rise0_r4[muxr2_i] <= #TCQ mux_rd_rise0_r3[muxr2_i];
            mux_rd_fall0_r4[muxr2_i] <= #TCQ mux_rd_fall0_r3[muxr2_i];
            mux_rd_rise1_r4[muxr2_i] <= #TCQ mux_rd_rise1_r3[muxr2_i];
            mux_rd_fall1_r4[muxr2_i] <= #TCQ mux_rd_fall1_r3[muxr2_i];
            mux_rd_rise2_r4[muxr2_i] <= 'h0;
            mux_rd_fall2_r4[muxr2_i] <= 'h0;
            mux_rd_rise3_r4[muxr2_i] <= 'h0;
            mux_rd_fall3_r4[muxr2_i] <= 'h0;
          end
        end