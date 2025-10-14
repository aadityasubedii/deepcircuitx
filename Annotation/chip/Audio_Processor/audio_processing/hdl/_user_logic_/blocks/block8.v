always @ (posedge Bus2IP_Clk) begin
		OUTPUT[0][0][xk_index] = OLED_OUT[7:0] ;	
		OUTPUT[0][1][xk_index] = OLED_OUT[15:8];	
		OUTPUT[0][2][xk_index] = OLED_OUT[23:16];	
		OUTPUT[0][3][xk_index] = OLED_OUT[31:24];
end