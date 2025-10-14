always@ (AnBnMAG) begin

	casez (AnBnMAG)	
		13'b1????????????:
			begin
				AnBnEXP <= 4'hD;
			end
		13'b01???????????:
			begin
				AnBnEXP <= 4'hC;
			end
		13'b001??????????:
			begin
				AnBnEXP <= 4'hB;
			end
		13'b0001?????????:
			begin
				AnBnEXP <= 4'hA;
			end
		13'b00001????????:
			begin
				AnBnEXP <= 4'h9;
			end
		13'b000001???????:
			begin
				AnBnEXP <= 4'h8;
			end
		13'b0000001??????:
			begin
				AnBnEXP <= 4'h7;
			end
		13'b00000001?????:
			begin
				AnBnEXP <= 4'h6;
			end
		13'b000000001????:
			begin
				AnBnEXP <= 4'h5;
			end
		13'b0000000001???:
			begin
				AnBnEXP <= 4'h4;
			end
		13'b00000000001??:
			begin
				AnBnEXP <= 4'h3;
			end
		13'b000000000001?:
			begin
				AnBnEXP <= 4'h2;
			end
		13'b0000000000001:
			begin
				AnBnEXP <= 4'h1;
			end
		default:
			begin
				AnBnEXP <= 4'h0;
			end
	endcase
end