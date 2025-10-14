always @(negedge sclk)
   begin
     if (clear)
	 shift_reg = 40'd0;
     if (load && shift_en)
	 shift_reg = {in_bk[39], in_bk[39:1]};
     else if (load && !shift_en)
	 shift_reg = in_bk;
     else
	 shift_reg = shift_reg;
   end