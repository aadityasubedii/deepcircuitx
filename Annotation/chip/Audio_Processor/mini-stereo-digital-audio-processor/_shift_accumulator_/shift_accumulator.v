module shift_accumulator(
    input shift_en,
    input load,
    input clear,
    input sclk,
    input [39:0] in_bk,
    output [39:0] out_bk
    );

	reg [39:0] shift_reg;
	
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

	assign out_bk = shift_reg;
			
endmodule