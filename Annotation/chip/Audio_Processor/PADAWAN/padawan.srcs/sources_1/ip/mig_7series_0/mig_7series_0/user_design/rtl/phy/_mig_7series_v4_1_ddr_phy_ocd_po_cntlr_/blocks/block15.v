  always @(*) begin
    left = lim2ocal_stg3_left_lim;
    right = lim2ocal_stg3_right_lim;
    ninety_offsets_final_ns = 2'd0;
    win_not_found = 1'b0;
    if (zero) begin
      left = fuzz2zero;
      right = zero2fuzz;
    end
    else if (noise) begin
      left = zero2fuzz;
      right = fuzz2oneeighty;
      ninety_offsets_final_ns = 2'd1;
    end
    else if (oneeighty) begin
      left = fuzz2oneeighty;
      right = oneeighty2fuzz;
      ninety_offsets_final_ns = 2'd2;
    end
    else if (z2f) begin
      right = zero2fuzz;
    end
    else if (f2o) begin
      left = fuzz2oneeighty;
      ninety_offsets_final_ns = 2'd2;
    end
    else if (f2z) begin
      left = fuzz2zero;
    end
    else win_not_found = 1'b1;
    current_edge = ocd_ktap_left_r ? left : right;
  end 