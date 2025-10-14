module seven_segment_LED
(
	input rst_n,
	input clk,
	output reg[41:0] segs
);
parameter [19:0] num=20'd123456;
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
		segs[41:0]<=42'd0;
	end
	else
	begin
		segs[41:35]<=ctable[8*((lnum/100000)%10)+:7];
		segs[34:28]<=ctable[8*((lnum/10000)%10)+:7];
		segs[27:21]<=ctable[8*((lnum/1000)%10)+:7];
		segs[20:14]<=ctable[8*((lnum/100)%10)+:7];
		segs[13:7]<=ctable[8*((lnum/10)%10)+:7];
		segs[6:0]<=ctable[8*((lnum)%10)+:7];
	end
end

endmodule
