  always @(*) begin
    z2f_ns = z2f_r;
    f2z_ns = f2z_r;
    o2f_ns = o2f_r;
    f2o_ns = f2o_r;
    zero2fuzz_ns = zero2fuzz_r;
    fuzz2zero_ns = fuzz2zero_r;
    oneeighty2fuzz_ns = oneeighty2fuzz_r;
    fuzz2oneeighty_ns = fuzz2oneeighty_r;
    scan_right_ns = 1'b0;
    
    if (reset_scan) begin
      z2f_ns = 1'b0;
      f2z_ns = 1'b0;
      o2f_ns = 1'b0;
      f2o_ns = 1'b0;
    end  
    else if (samp_valid && prev_samp_valid_r)
      case (prev_samp_r)
	FUZZ :
	  if (scanning_right) begin
            if (samp_result == ZERO) begin
	      fuzz2zero_ns = stg3;
	      f2z_ns = 1'b1;
	    end
            if (samp_result == ONEEIGHTY) begin
	      fuzz2oneeighty_ns = stg3;
	      f2o_ns = 1'b1;
	    end
	  end
	ZERO : begin
          if (samp_result == FUZZ || samp_result == ONEEIGHTY) scan_right_ns = !scanning_right;
          if (scanning_right) begin
	    if (samp_result == FUZZ) begin
	      zero2fuzz_ns = stg3 - 6'b1;
	      z2f_ns = 1'b1;
	    end
	    if (samp_result == ONEEIGHTY) begin
	      zero2fuzz_ns = stg3 - 6'b1;
	      z2f_ns = 1'b1;
	      fuzz2oneeighty_ns = stg3;
	      f2o_ns = 1'b1;
	    end
	  end
	end
        ONEEIGHTY :
          if (scanning_right) begin
	    if (samp_result == FUZZ) begin
	      oneeighty2fuzz_ns = stg3 - 6'b1;
	      o2f_ns = 1'b1;
	    end 
            if (samp_result == ZERO)
              if (f2o_r) begin
		oneeighty2fuzz_ns = stg3 - 6'b1;
	        o2f_ns = 1'b1;
              end else begin
	        fuzz2zero_ns = stg3;
	        f2z_ns = 1'b1;
	      end

	  end 

      endcase	 
  end