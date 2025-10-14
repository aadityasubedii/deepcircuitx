
module tb_my_led;

//信号定义----------信号名-------------------------//
reg				clk								;
reg				rst_n							;

//信号类型----------信号名-------------------------//
wire			led								;

parameter		CYCLE	=	20					;






my_led uut(
					.clk	(clk)						,
					.rst_n	(rst_n)						,
					.led    (led)
);

initial begin	
	clk		=	0		;
	forever#(CYCLE/2)begin
		clk	=	~clk	;
	end
end
initial begin
	#1;
	rst_n		=	0		;
	#(CYCLE*10);
	rst_n		=	1		;
	
end


endmodule
