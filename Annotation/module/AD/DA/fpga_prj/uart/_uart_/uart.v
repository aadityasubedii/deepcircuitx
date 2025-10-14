/*
串口接收数据，一帧8bits有效数据，对应LED1-8，
bit位 1时，LED暗
bit位 0时，LED亮
*/

module uart(
					clk								,
					rst_n							,
	//其他信号
					rx_uart							,
					led
);


//信号定义----------信号名-------------------------//
input				clk								;
input				rst_n							;

//信号类型----------信号名-------------------------//
input								rx_uart			;
output	[7:0]						led				;

//计数器--0
reg	[12:0]							cnt0			;
wire								add_cnt0		;
wire								end_cnt0		;
	
//计数器--1	
reg	[3:0]							cnt1			;
wire								add_cnt1		;
wire								end_cnt1		;
reg									rx_uart_ff0		;
reg									rx_uart_ff1		;
reg									rx_uart_ff2		;
reg									flag_add		;
reg	[7:0]							led				;


///////////////////////////////////////////////////////////////////////
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt0	<=	0	;
	end
	else if(add_cnt0) begin
		if(end_cnt0)
			cnt0	<=	0	;
		else
			cnt0	<=	cnt0	+	1	;
	end
end
//计数器0加1条件
assign	add_cnt0	=	flag_add	;
//计数器0计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	5208	-	1	;
///////////////////////////////////////////////////////////////////////
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt1	<=	0	;
	end
	else if(add_cnt1) begin
		if(end_cnt1)
			cnt1	<=	0	;
		else
			cnt1	<=	cnt1	+	1	;
	end
end
//计数器1加1条件
assign	add_cnt1	=	end_cnt0	;
//计数器1计数结束条件							
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	9	-	1	;
///////////////////////////////////////////////////////////////////////

//时序逻辑
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		rx_uart_ff0	<=	1	;
		rx_uart_ff1	<=	1	;	//两拍同步,rx_uart_ff1可用
		rx_uart_ff2	<=	1	;	//3拍，rx_uart_ff2做边沿检测信号用 
	end
	else begin
		rx_uart_ff0	<=	rx_uart	;
		rx_uart_ff1	<=	rx_uart_ff0	;
		rx_uart_ff2	<=	rx_uart_ff1	;
	end
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag_add	<=	0	;
	end
	else if(rx_uart_ff1==0 && rx_uart_ff2==1)begin//下降沿
		flag_add	<=	1	;
	end 
	else if(end_cnt1)begin	//9bits数完拉低
		flag_add	<=	0	;
	end 
end
///////////////////////////////////////////////////////////////////
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led	<=8'hff	;
	end
	else if(add_cnt0 && cnt0==5208/2-1 && cnt1>0)begin
		led[cnt1-1]	<=	rx_uart_ff1	;
	end 
end
endmodule
