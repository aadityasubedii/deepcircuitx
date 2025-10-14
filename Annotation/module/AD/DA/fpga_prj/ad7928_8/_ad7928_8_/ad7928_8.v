/*
	ADC7928说明
	对8个模拟通道进行模数转换，且连续采集。
	工作时钟：50Mhz
	采样频率1MHz
*/


module ad7928_8(
	clk			,
	rst_n		,
	dout		,
	dout_vld	,
	adc_cs		,
	adc_sclk	,
	adc_din		,
	adc_dout

);
parameter				WRITE	=	1'b1	;
parameter				PM		=	2'b11	;
parameter				SEQ		=	1'b0	;
parameter				SHADOW	=	1'b0	;
parameter				RANGE	=	1'b0	;
parameter				CODING	=	1'b1	;

input								clk			;
input								rst_n		;
output	[15:0]						dout		;
output								dout_vld	;

input								adc_dout	;
output								adc_din		;
output								adc_sclk	;
output								adc_cs		;

reg	[15:0]							dout		;
reg									dout_vld	;
reg									adc_din		;
reg									adc_cs		;
reg									adc_sclk	;


//计数器--cnt0
reg[5:0]							cnt0		;	//计数器位宽
wire								add_cnt0	;	//计数开始条件
wire								end_cnt0	;	//计数结束条件


//计数器--cnt1
reg[4:0]							cnt1		;	//计数器位宽
wire								add_cnt1	;	//计数开始条件
wire								end_cnt1	;	//计数结束条件

//计数器--cnt2
reg[2:0]							cnt2		;	//计数器位宽
wire								add_cnt2	;	//计数开始条件
wire								end_cnt2	;	//计数结束条件

//计数器--cnt0
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
//计数器--cnt0 加1条件
assign	add_cnt0	=	1	;
//计数器--cnt0 计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	50	-	1	;//CLK50M, 采样1M

//计数器--cnt1
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
//计数器--cnt1 加1条件
assign	add_cnt1	=	end_cnt0	;
//计数器--cnt1 计数结束条件							
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	18	-	1	; //时序图看 16+2（CS 时间）



//计数器--cnt2
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt2	<=	0	;
	end
	else if(add_cnt2) begin
		if(end_cnt2)
			cnt2	<=	0	;
		else
			cnt2	<=	cnt2	+	1	;
	end
end
//计数器--cnt2 加1条件
assign	add_cnt2	=	end_cnt1	;
//计数器--cnt2 计数结束条件							
assign	end_cnt2	=	add_cnt2	&&	cnt2	==	8	-	1	;//ADC8个通道，循环采样

//add_cnt0 && cnt0==25-1，下面多次用到这个条件,
assign middle=add_cnt0 && cnt0==25-1;	//中间点
//SCLK信号
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		adc_sclk	<=	1	;	//默认高
	end
	else if(middle && cnt1>=1 && cnt1<17)begin //看时序图，50-1是一个时钟周期，25-1则半个周期，即中间点变化SCLK 信号;同时，cnt1>=1 && cnt1<17是排除这个两个点让SCLK变化。
		adc_sclk	<=	0	;
	end 
	else if(end_cnt0)begin//
		adc_sclk	<=	1	;
	end 
end



//CS信号
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		adc_cs	<=	1	;	//默认高
	end
	else if(middle && cnt1==1-1)begin //看时序图，50-1是一个时钟周期，25-1则半个周期，即中间点变化CS信号
		adc_cs	<=	0	;
	end 
	else if(middle && cnt1==18-1)begin//同上，
		adc_cs	<=	1	;
	end 
end


//时序逻辑
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		adc_din	<=	0	;
	end
	else if(end_cnt0 && cnt1<16)begin//看时序图，end_cnt0时，刚好发送1bits
		adc_din	<=data[15-cnt1]	;	//cnt1=0时，刚好发送data的第15位--即WRITE位
	end
end

//拼ADC 控制器功能位：
/*
	MSB																						LSB
	WRITE	SEQ	DON'TCARE	ADD2	ADD1	ADD0	PM1	PM0	SHADOW	DON'TCARE	RANGE CODING
	发数据时，是16bits共，所以末尾补4'b0
*/
assign data={WRITE,SEQ,1'b0,cnt2,PM,SHADOW,1'b0,RANGE,CODING,4'b0};

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout	<=	0	;
	end
	else if(middle && cnt1>=1 && cnt1<17)begin
		dout[16-cnt1]	<=	adc_dout	;	//adc_dout是1bit的信号，dout是16bit的。
	end 
	else if()begin
		;
	end 
end


//时序逻辑 dout_vld-告诉上游模块数据完成且有效
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout_vld	<=	0	;
	end
	else begin
		dout_vld	<= 	end_cnt2	;
	end
end
























endmodule