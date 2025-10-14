/*
	LED功能描述：
		4个LED灯，
		LED1隔1秒后，亮1秒
		LED2隔1秒后，亮2秒
		LED3隔1秒后，亮3秒
		LED4隔1秒后，亮4秒
		循环....
*/


module my_led_4_flash(
					clk								,
					rst_n							,
	//其他信号
					led0							,
					led1							,
					led2							,
					led3							
);

//信号定义----------信号名-------------------------//
input				clk								;
input				rst_n							;

//信号类型----------信号名-------------------------//
output				led0								;
output				led1								;
output				led2								;
output				led3								;





//计数器--cnt0
reg[25:0]							cnt0		;	//计数器位宽
wire								add_cnt0	;	//计数开始条件
wire								end_cnt0	;	//计数结束条件


//计数器--cnt1
reg[3:0]							cnt1		;	//计数器位宽
wire								add_cnt1	;	//计数开始条件
wire								end_cnt1	;	//计数结束条件
reg									led0		;
reg									led1		;
reg									led2		;
reg									led3		;

/*
两个计数器
cnt0 :数1秒时间
cnt1 :数14个1秒
*/

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
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	50_000_000	-	1	;

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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	14	-	1	;

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led0 <=1;
	end
	else if(add_cnt1 && cnt1==1-1)begin
		led0	<=	0;
	end 
	else if(add_cnt1 && cnt1==2-1)begin
		led0	<=	1	;
	end 
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led1 <=1;
	end
	else if(add_cnt1 && cnt1==3-1)begin
		led1	<=	0;
	end 
	else if(add_cnt1 && cnt1==5-1)begin
		led1	<=	1	;
	end 
end
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led2 <=1;
	end
	else if(add_cnt1 && cnt1==6-1)begin
		led2	<=	0;
	end 
	else if(add_cnt1 && cnt1==9-1)begin
		led2	<=	1	;
	end 
end
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		led3 <=1;
	end
	else if(add_cnt1 && cnt1==10-1)begin
		led3	<=	0;
	end 
	else if(add_cnt1 && cnt1==14-1)begin
		led3	<=	1	;
	end 
end
endmodule
