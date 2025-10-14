always@(xk_index,dv) begin
	if (dv ==1'b1) begin
	temp_re = (xk_re[15]==1'b1)?-xk_re:xk_re;
	temp_im =(xk_im[15]==1'b1)?-xk_im:xk_im;
	mag_out=(temp_re*temp_re)+(temp_im*temp_im);
	end
end