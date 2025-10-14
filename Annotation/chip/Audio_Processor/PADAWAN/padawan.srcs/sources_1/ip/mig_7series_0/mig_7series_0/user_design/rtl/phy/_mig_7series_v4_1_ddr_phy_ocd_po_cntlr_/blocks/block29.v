  always @(*) stg2_final_ns = stg2_target_r[8] == 1'b1
	                        ? 6'd0
	                        : stg2_target_r > 9'd63
	                          ? 6'd63
	                          : stg2_target_r[5:0];