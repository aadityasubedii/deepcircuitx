/*
	说明：
	当EN时，DOUT产生一个宽度为10的高电平脉冲。
*/


//计数器--cnt
reg[3:0]							cnt		;	//计数器位宽
wire								add_cnt	;	//计数开始条件
wire								end_cnt	;	//计数结束条件
//计数器--cnt
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt	<=	0	;
	end
	else if(add_cnt) begin
		if(end_cnt)
			cnt	<=	0	;
		else
			cnt	<=	cnt	+	1	;
	end
end
//计数器--cnt 加1条件
assign	add_cnt	=	dout==1	;
//计数器--cnt 计数结束条件							
assign	end_cnt	=	add_cnt	&&	cnt	==	10	-	1	;

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout	<=	0	;
	end
	else if(en==1)begin
		dout	<=	1	;
	end 
	else if(end_cnt)begin
		dout	<=	0	;
	end 
end

