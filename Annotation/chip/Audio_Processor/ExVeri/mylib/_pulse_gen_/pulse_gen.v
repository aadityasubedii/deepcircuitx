module pulse_gen(clk, trigger, pulse);

	input clk, trigger;
	output pulse;
	
	reg pre_trigger;
	reg pulse;
	
	initial pre_trigger = 1'b0;
	
	always @ (posedge clk)
	begin
		if(pre_trigger == 1'b0 && trigger == 1'b1)
		begin
			pulse <= 1'b1;
			pre_trigger <= 1'b1;
		end
		else
		begin
			pulse <= 1'b0;
			pre_trigger <= trigger;
		end
	end

endmodule
