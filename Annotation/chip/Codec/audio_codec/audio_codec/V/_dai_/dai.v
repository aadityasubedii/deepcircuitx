module dai(
	input wire mclk,
	input wire clk_2048,
	output wire bclk,
	output wire lrclk,

	input wire reset,
	
	output wire clk_rom,
	output reg [17:0] rom_address,
	input wire [15:0] rom_data,
	
	output wire output_to_dac
);

reg [2:0] bclk_divider;
reg [7:0] lrclk_divider;
reg [15:0] shift_temp;
reg new_sample;

always@(posedge clk_2048) begin
	if (reset) begin
		bclk_divider <= 3'b111;
		lrclk_divider <= 8'hff;
	end
	else begin
		bclk_divider <= bclk_divider + 3'h1;
		lrclk_divider <= lrclk_divider + 6'h1;
	end
end

assign bclk = bclk_divider[2]; //256 khz
assign lrclk = ~lrclk_divider[7]; //8 khz
assign clk_rom = ~lrclk_divider[6]; //16 khz, double the sample rate. Two samples per sample clock cycle to feed both channels

always@(posedge clk_rom or posedge reset) begin //getting data from rom
	if (reset) begin
		rom_address <= 18'h0;
		new_sample <= 1'b0;
	end
	else begin
		if (rom_address < 18'd239988) begin
			rom_address <= rom_address + 18'h1;
		end
		new_sample <= ~new_sample;
	end
end

wire new_sample_pos, new_sample_neg;
reg new_sample_delay;

always@(posedge mclk) begin
	new_sample_delay <= new_sample;
end

assign new_sample_pos = new_sample & ~new_sample_delay;
assign new_sample_neg = ~new_sample & new_sample_delay;


always@(negedge bclk or posedge new_sample_pos or posedge new_sample_neg)  begin
	if (new_sample_pos || new_sample_neg) begin
		shift_temp <= rom_data;
	end
	else begin
		shift_temp <= shift_temp << 1;
		shift_temp[0] <= 1'b0;
	end
end

assign output_to_dac = shift_temp[15];

endmodule
