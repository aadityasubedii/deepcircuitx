	reg [8:0] coeff_pos_L = 9'd0;
	reg [3:0] u_count_L = 4'd0;
	reg compute_status_L = 1'b0, out_flag_L = 1'b0; 
	reg [7:0] k_L = 8'd0;
	reg [39:0] y_temp_L = 40'd0, add_temp_L = 40'd0, u_temp_L = 40'd0;
	reg [15:0] rj_temp_L = 16'd0, x_count_L = 16'hFFFF, h_val_L = 16'd0, x_index_L = 16'd0;
	reg [39:0] out_temp_L;
