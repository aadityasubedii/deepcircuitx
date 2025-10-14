/*
	说明：
	当EN=1时，间隔1个时钟周期后，dout产生一个宽度为2的高电平脉冲，并重复3次。
*/

//计数器--cnt0
reg[2:0]							cnt0		;	//计数器位宽
wire								add_cnt0	;	//计数开始条件
wire								end_cnt0	;	//计数结束条件
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
assign	add_cnt0	=	flag==1	;	//flag为新加的中间信号
//计数器--cnt0 计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	3	-	1	;


//计数器--cnt1
reg[2:0]							cnt1		;	//计数器位宽
wire								add_cnt1	;	//计数开始条件
wire								end_cnt1	;	//计数结束条件
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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	3	-	1	;

//flag 新加的中间信号 
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag	<=	0	;
	end
	else if(en)begin
		flag	<=	1	;
	end 
	else if(end_cnt1)begin
		flag 	<=	0	;
	end 
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout <=0;
	end
	else if(add_cnt0 && cnt0==1-1)begin
		dout <=1;
	end 
	else if(end_cnt0)begin
		dout <=0;;
	end 
end


































