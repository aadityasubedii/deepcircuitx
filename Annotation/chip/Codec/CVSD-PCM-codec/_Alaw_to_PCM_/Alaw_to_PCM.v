`timescale 1ns / 1ps

module Alaw_to_PCM(
	input [7:0] data_i,
	output [15:0] data_o
    );

wire [7:0] fstep;
reg [15:0] sstep;

assign fstep = data_i ^ 8'h55;

always @(*)
	begin
		if (fstep[7] == 0)
			sstep[15] = 1'b1;
		else 
			sstep[15] = 1'b0;
			
		if (fstep[6:4] == 3'b111)
			begin
				sstep[14] = 1'b1;
				sstep[13:10] = fstep[3:0];
				sstep[9:0] = 10'b0;
			end
		else
		if (fstep[6:4] == 3'b110)
			begin
				sstep[14:13] = 2'b01;
				sstep[12:9] = fstep[3:0];
				sstep[8:0] = 9'b0;
			end
		else
		if (fstep[6:4] == 3'b101)
			begin
				sstep[14:12] = 3'b001;
				sstep[11:8] = fstep[3:0];
				sstep[7:0] = 8'b0;
			end
		else
		if (fstep[6:4] == 3'b100)
			begin
				sstep[14:11] = 4'b0001;
				sstep[10:7] = fstep[3:0];
				sstep[6:0] = 7'b0;
			end
		else
		if (fstep[6:4] == 3'b011)
			begin
				sstep[14:10] = 5'b00001;
				sstep[9:6] = fstep[3:0];
				sstep[5:0] = 6'b0;
			end
		else
		if (fstep[6:4] == 3'b010)
			begin
				sstep[14:9] = 6'b000001;
				sstep[8:5] = fstep[3:0];
				sstep[4:0] = 5'b0;
			end
		else
		if (fstep[6:4] == 3'b001)
			begin
				sstep[14:8] = 7'b0000001;
				sstep[7:4] = fstep[3:0];
				sstep[3:0] = 4'b0;
			end
		else
		if (fstep[6:4] == 3'b000)
			begin
				sstep[14:8] = 7'b0000000;
				sstep[7:4] = fstep[3:0];
				sstep[3:0] = 4'b0;
			end
	end

assign data_o = (sstep[15]) ? {0, sstep[14:0]} : ~sstep;

endmodule
