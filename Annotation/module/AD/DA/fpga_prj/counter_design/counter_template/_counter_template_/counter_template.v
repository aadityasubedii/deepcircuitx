/*
键盘输入：jsq+TAB键，即可调出模板
在光标闪烁状态下，可以同步修改变量名。
接着模板需要修改三处，光标默认到位宽处，修改完毕按TAB键自动跳转...
计数器位宽
加1条件
计数结束条件
*/
//计数器--cnt
reg[ :0]							cnt		;	//计数器位宽
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
assign	add_cnt	=		;
//计数器--cnt 计数结束条件							
assign	end_cnt	=	add_cnt	&&	cnt	==		-	1	;

//特殊情况下，比如：加1条件不满足时，要变为0的情况
//计数器--cnt
reg[:0]							cnt		;	//计数器位宽
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
	//   加1条件不满足时，要变为0的情况
	else
		cnt	<=	0	;
end
//计数器--cnt 加1条件
assign	add_cnt	=		;
//计数器--cnt 计数结束条件							
assign	end_cnt	=	add_cnt	&&	cnt	==		-	1	;

