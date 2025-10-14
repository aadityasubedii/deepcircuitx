      always @(posedge clk) begin
        if (rst)
          final_val[wr_i] <= #TCQ 'b0;
        else if (wr_level_done_r2 && ~wr_level_done_r3) begin
          if (~oclkdelay_calib_done)
            final_val[wr_i] <= #TCQ (smallest[wr_i] + add_smallest[wr_i]); 
          else if ((smallest[wr_i] + add_smallest[wr_i]) < 
                   (largest[wr_i] + add_largest[wr_i]))
            final_val[wr_i] <= #TCQ ((smallest[wr_i] + add_smallest[wr_i]) +
                                     (((largest[wr_i] + add_largest[wr_i]) -
                                     (smallest[wr_i] + add_smallest[wr_i]))/2));
          else if ((smallest[wr_i] + add_smallest[wr_i]) >
                   (largest[wr_i] + add_largest[wr_i]))
            final_val[wr_i] <= #TCQ ((largest[wr_i] + add_largest[wr_i]) +
                                     (((smallest[wr_i] + add_smallest[wr_i]) -
                                     (largest[wr_i] + add_largest[wr_i]))/2));
          else if ((smallest[wr_i] + add_smallest[wr_i]) ==
                   (largest[wr_i] + add_largest[wr_i]))
            final_val[wr_i] <= #TCQ (largest[wr_i] + add_largest[wr_i]);
        end
      end