  always @(posedge clk)
    if (rst || (mpr_rdlvl_done_r && ~rdlvl_stg1_start)) begin
      cnt_shift_r <= #TCQ 'b1;
      sr_valid_r  <= #TCQ 1'b0;
      mpr_valid_r <= #TCQ 1'b0;
    end else begin
      if (mux_rd_valid_r && mpr_rdlvl_start && ~mpr_rdlvl_done_r) begin
        if (cnt_shift_r == 'b0)
          mpr_valid_r <= #TCQ 1'b1;
        else begin
          mpr_valid_r <= #TCQ 1'b0;
          cnt_shift_r <= #TCQ cnt_shift_r + 1;
        end
      end else
        mpr_valid_r <= #TCQ 1'b0;

      if (mux_rd_valid_r && rdlvl_stg1_start) begin
        if (cnt_shift_r == RD_SHIFT_LEN-1) begin
          sr_valid_r <= #TCQ 1'b1;
          cnt_shift_r <= #TCQ 'b0;
        end else begin
          sr_valid_r <= #TCQ 1'b0;
          cnt_shift_r <= #TCQ cnt_shift_r + 1;
        end
      end else
        
        
        
        
        sr_valid_r <= #TCQ 1'b0;
    end