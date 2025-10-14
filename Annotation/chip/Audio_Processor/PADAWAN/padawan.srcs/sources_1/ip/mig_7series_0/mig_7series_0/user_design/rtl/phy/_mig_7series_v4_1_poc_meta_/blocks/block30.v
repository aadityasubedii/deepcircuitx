  always @(*) begin
    run_ends_ns = run_ends_r;
    if (reset_run_ends) run_ends_ns = 2'b0;
    else case (run_ends_r) 
           2'b00 : run_ends_ns = run_ends_r + {1'b0, run_end_r3 && run_polarity_held_r};
	   2'b01, 2'b10 : run_ends_ns = run_ends_r + {1'b0, run_end_r3};
	  endcase 
  end 