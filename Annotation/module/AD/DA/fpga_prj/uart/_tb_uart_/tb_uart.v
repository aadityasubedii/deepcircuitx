
module tb_uart;

//信号定义----------信号名-------------------------//
reg				clk									;
reg				rst_n								;

//信号类型----------信号名-------------------------//
reg				rx_uart								;
wire	[7:0]	led									;
parameter		CYCLE	=	20						;


uart uut(
					.clk		(clk		)			,
					.rst_n		(rst_n		)			,
					.rx_uart   	(rx_uart	)			,
					.led   		(led		)
);

//时钟
initial begin	
	clk		=	0		;
	forever#(CYCLE/2)begin
		clk	=	~clk	;
	end
end
//复位
initial begin
	#1;
	rst_n		=	0		;
	#(CYCLE*10);
	rst_n		=	1		;
	
end
//产生rx_uart信号
/*
104166 由 1秒/9600波特率而来
下面构造出来的数据为：8'h00110001
*/
initial begin
	#1;
	rx_uart	=	1;
	#(CYCLE*100);
	rx_uart	=	0;	//起始位
	#104166;
	rx_uart	=	1;	//最低位1
	#104166;
	rx_uart	=	0;	//低位的3个0
	#(3*104166);
	rx_uart	=	1;	//高4位的低2位的1
	#(2*104166);
	rx_uart	=	0;	//高4位的高2位的0
	#(2*104166);
	rx_uart	=	1;	//停止位
end

endmodule
