always@(posedge clk)
    if (reset)
        begin
        br_rgb_data_0 <= 0;
		  br_rgb_data_1 <= 0;
        end
    else if (decode_state)
		  get_data <= 1;
	 else if (get_data)
		begin
		get_data <= 0;
        if (buff_num)
            br_rgb_data_0 <= br_memdata_out; 
        else
            br_rgb_data_1 <= br_memdata_out;
		end