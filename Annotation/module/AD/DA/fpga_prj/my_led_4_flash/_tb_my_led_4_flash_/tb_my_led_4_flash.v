
module tb_my_led_4_flash;

//信号定义----------信号名-------------------------//
reg				clk									;
reg				rst_n								;

//信号类型----------信号名-------------------------//
wire			led0								;
wire			led1								;
wire			led2								;
wire			led3								;
parameter		CYCLE	=	20						;


my_led_4_flash uut(
					.clk	(clk		)			,
					.rst_n	(rst_n		)			,
					.led0   (led0		)			,
					.led1   (led1		)			,
					.led2   (led2		)			,
					.led3   (led3		)
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
