/*
	LED功能描述：
		暗1秒，亮N秒，其中N为：1，2，3 。。。9秒
		然后再次从1秒开始循环
*/


module my_led(
					clk								,
					rst_n							,
	//其他信号
					led
);

//信号定义----------信号名-------------------------//
input				clk								;
input				rst_n							;

//信号类型----------信号名-------------------------//
output				led								;




//计数器--cnt0
reg[28:0]							cnt0		;	//计数器位宽
wire								add_cnt0	;	//计数开始条件
wire								end_cnt0	;	//计数结束条件


//计数器--cnt1
reg[3:0]							cnt1		;	//计数器位宽
wire								add_cnt1	;	//计数开始条件
wire								end_cnt1	;	//计数结束条件
reg									led			;

reg	[28:0]							x			;


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
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	x	-	1	;

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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	9	-	1	;

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led <=1;
	end
	else if(add_cnt0 && cnt0==50_000_000-1)begin
		led	<=	0;
	end 
	else if(end_cnt0)begin
		led	<=	1	;
	end 
end

//组合逻辑--always

always @(*)begin
	if(cnt1==0)	begin
		x	=	100_000_000	;
	end
	else if(cnt1==1)	begin
		x	=	150_000_000	;
	end
	else if(cnt1==2)	begin
		x	=	200_000_000	;
	end
	else if(cnt1==3)	begin
		x	=	250_000_000	;
	end
	else if(cnt1==4)	begin
		x	=	300_000_000	;
	end
	else if(cnt1==5)	begin
		x	=	350_000_000	;
	end
	else if(cnt1==6)	begin
		x	=	400_000_000	;
	end
	else if(cnt1==7)	begin
		x	=	450_000_000	;
	end
	else begin
		x	=	500_000_000	;
	end
			
end 

endmodule
