module data_memory (input write_enable, read_enable, Sclk, in_flag,
					input [15:0] in_data,
input [7:0] datawrite, dataread,
					output [15:0] input_data,
					output reg flag_zero);

	reg [15:0] datamem [0:255];
	reg [11:0] count_zero;
	
	always @(posedge Sclk)
	begin
		if(write_enable == 1'b1)
			datamem[datawrite] = in_data;
		else
			datamem[datawrite] = datamem[datawrite];
	end
	always @(posedge in_flag)
	begin
		if (in_data == 16'd0)
		begin
			count_zero = count_zero + 1'b1;
			if (count_zero == 12'd800)
				flag_zero = 1'b1;
			else if (count_zero > 12'd800)
			begin
				count_zero = 12'd800;
				flag_zero = 1'b1;
			end
		end		
		else if (in_data != 16'd0)
		begin
			count_zero = 12'd0;
			flag_zero = 1'b0;
		end
	end

	assign input_data = (read_enable) ? datamem[dataread] : 16'd0;
endmodule