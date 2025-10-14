`timescale 1ns / 1ps
module meandr(
	input clk_i,
	input rst_i,
	input [7:0] data_i,
	input DR_i,
	output clk_o,
	output FST_o,
	output DT_o,
	output valid_o,
	output [7:0] DR_o
    );

reg [5:0] cnt_clk = 0;
reg [8:0] cnt_FST = 0;
reg [3:0] cnt_DT = 0;
reg flag_clk = 0;
reg flag_DR = 0;
reg DT;
reg [7:0] DR;
reg [7:0] DR_z;
reg valid = 0;
reg valid_stop;

//clk
always @(posedge clk_i)
if (rst_i)
	begin
		flag_clk <= 0;
		flag_DR <= 0;
	end
else
begin
	if (cnt_clk > 6'd49)
		begin
			cnt_clk <= 0;
			flag_clk <= !flag_clk;
		end
	else
		cnt_clk <= cnt_clk + 1'b1;
	
	if ((cnt_clk >= 10) & (FST_o))
		flag_DR <= 1;
	else if (!FST_o & valid)
		flag_DR <= 0;
end
//FST
always @(posedge clk_i)
if (rst_i)
begin
	valid <= 0;
end
else
begin
	valid_stop <= valid;
	if ((cnt_clk == 50) & (!clk_o))
		begin
			valid <= 0;
			if (cnt_FST >= 9'd255)
			begin
				cnt_FST <= 0;
			end
			else
				cnt_FST <= cnt_FST + 1'b1;
			if (cnt_FST == 6'd7)
				begin
					valid <= 1;
				end
		end
end
//DT
always @(posedge clk_i)
begin
	if (rst_i)
		cnt_DT <= 0;
	else
		if ((cnt_clk == 50) & (!clk_o))
			begin
				if ((cnt_DT >= 4'd9) || (!FST_o))
				begin
					cnt_DT <= 0;
					DT <= 0;
				end
				else if (FST_o)
				begin
					cnt_DT <= cnt_DT + 1;
				end
			end
end
//DR
always @(posedge clk_i)
begin
	if (rst_i)
		DR <= 0;
	else
		if (((cnt_clk == 24) & (clk_o)) & (flag_DR))
			DR <= {DR[6:0], DR_i};
		else if (((cnt_clk == 24) & (clk_o)) & (!flag_DR))
			DR_z <= DR;
end


assign clk_o = ((cnt_clk >= 0) & (cnt_clk <= 24)) ? 1 : 0;
assign FST_o = ((cnt_FST >= 0) & (cnt_FST < 8)) ? 1 : 0;
assign DT_o = (FST_o) ? data_i[7	- cnt_DT] : 0;
assign valid_o = ({valid, valid_stop} == 2'b10) ? 1 : 0;
assign DR_o = DR_z;

endmodule