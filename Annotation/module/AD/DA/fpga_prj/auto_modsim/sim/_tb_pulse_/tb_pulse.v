`timescale 1ns/1ns
module	tb_pulse;

reg				clk				;
reg				rst_n			;
reg				en				;

wire			dout			;
	
//时钟周期，单位 ns	可在这里修改周期
parameter	CYCLE		=	20	;	
parameter	RUN_TIME	=	10000;
//例化--TIME_1S强制数100个周期,减小仿真时间
//pluse#(.TIME_1S(100)) pluse_inst(
pulse pulse_inst(
	.clk			(clk)			,
	.rst_n			(rst_n)			,
	.en				(en)			,
	.dout			(dout)		
);
//时钟和复位
initial	begin
	clk	=	0	;
	forever#(CYCLE/2)begin
	clk	=	~clk	;
	end
end
//生成复位信号
initial	begin	
	#1;
	rst_n	=	0	;
	#(CYCLE*10)
	rst_n	=	1	;
end

integer		fp_w	;
reg			flag_get	;
initial	begin

end


initial begin
	#1;
	en	=		0	;
	#(CYCLE*100)	;
	en	=		1	;
	#(CYCLE*1)		;
	en	=		0	;
end


endmodule






