`timescale 1ns / 1ps
module PCM_to_Alaw(
	input [15:0] data_i,
	output [7:0] data_o
    );

reg [15:0] fstep;
reg [7:0] sstep;




always @(*)
		begin
			if (data_i[15] == 0)
			begin
				sstep[7] = 1'b1;
				fstep = data_i;
			end
			else 
			begin
				sstep[7] = 1'b0;
				fstep = ~data_i[14:0];
			end
					
			if (fstep[14] == 1'b1)
				begin
					sstep[6:4] = 3'b111;
					sstep[3:0] = fstep[13:10];
				end
			else
			if (fstep[13] == 1'b1)
				begin
					sstep[6:4] = 3'b110;
					sstep[3:0] = fstep[12:9];
				end
			else
			if (fstep[12] == 1'b1)
				begin
					sstep[6:4] = 3'b101;
					sstep[3:0] = fstep[11:8];
				end
			else
			if (fstep[11] == 1'b1)
				begin
					sstep[6:4] = 3'b100;
					sstep[3:0] = fstep[10:7];
				end
			else
			if (fstep[10] == 1'b1)
				begin
					sstep[6:4] = 3'b011;
					sstep[3:0] = fstep[9:6];
				end
			else
			if (fstep[9] == 1'b1)
				begin
					sstep[6:4] = 3'b010;
					sstep[3:0] = fstep[8:5];
				end
			else
			if (fstep[8] == 1'b1)
				begin
					sstep[6:4] = 3'b001;
					sstep[3:0] = fstep[7:4];
				end
			else
			if (fstep[14:8] == 7'b0000000)
				begin
					sstep[6:4] = 3'b000;
					sstep[3:0] = fstep[7:4];
				end
		end

assign data_o = sstep ^ 8'h55;

endmodule
