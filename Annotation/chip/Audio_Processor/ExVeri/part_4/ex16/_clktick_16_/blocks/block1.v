	always @ (posedge clkin)  
		if (enable == 1'b1)
			if (count == 0)	begin
				tick <= 1'b1;
				count <= N;
				end
			else	begin
				tick <= 1'b0;
				count <= count - 1'b1;
				end
		
endmodule 