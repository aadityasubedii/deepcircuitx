module seven_segment_LED
(
	input rst_n,
	input clk,
	input [19:0] num,
	///////// HEX0 /////////
   output reg     [6:0]  HEX0,

	///////// HEX1 /////////
	output reg     [6:0]  HEX1,

	///////// HEX2 /////////
	output reg     [6:0]  HEX2,

	///////// HEX3 /////////
	output reg     [6:0]  HEX3,

	///////// HEX4 /////////
	output reg     [6:0]  HEX4,

	///////// HEX5 /////////
	output reg     [6:0]  HEX5
);
reg [19:0]lnum;

parameter ctable={8'b1001_0000,//9
						8'b1000_0000,//8
						8'b1111_1000,//7
						8'b1000_0010,//6
						8'b1001_0010,//5
						8'b1001_1001,//4
						8'b1011_0000,//3
						8'b1010_0100,//2
						8'b1111_1001,//1
						8'b1100_0000};//0
						
always@(posedge clk or negedge rst_n)
begin
	lnum=num;
	if(~rst_n)
	begin
		HEX0	<=7'd0;
		HEX1	<=7'd0;
		HEX2	<=7'd0;
		HEX3	<=7'd0;
		HEX4	<=7'd0;
		HEX5	<=7'd0;
	end
	else
	begin
		HEX5	<=ctable[8*((lnum/100000)%10)+:7];
		HEX4	<=ctable[8*((lnum/10000)%10)+:7];
		HEX3	<=ctable[8*((lnum/1000)%10)+:7];
		HEX2	<=ctable[8*((lnum/100)%10)+:7];
		HEX1	<=ctable[8*((lnum/10)%10)+:7];
		HEX0	<=ctable[8*((lnum)%10)+:7];
	end
end

endmodule
