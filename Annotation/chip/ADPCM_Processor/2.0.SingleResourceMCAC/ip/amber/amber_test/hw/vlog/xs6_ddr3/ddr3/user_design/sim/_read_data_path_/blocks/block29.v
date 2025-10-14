      always @ (posedge clk_i) begin
             wait_bl_end_r1 <= #TCQ wait_bl_end;
             rd_data_r <= #TCQ data_i;
             rd_data_r2 <= #TCQ rd_data_r;
             rd_data_r3 <= #TCQ rd_data_r2;
             rd_data_r4 <= #TCQ rd_data_r3;
      end