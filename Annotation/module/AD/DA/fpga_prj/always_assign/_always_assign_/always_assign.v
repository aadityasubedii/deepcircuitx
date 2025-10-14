
/*
下面两段代码，描述的电路功能是一模一样的。
优缺点
1 仿真时，代码2，可以看到中间结果C，代码1则看不到C的结果
2 当q<=a+d+x+x+x+....; 一行的太长时，可以使用代码2的方式。
*/

////////////////////代码1 //////////////////////////////
//时序逻辑
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		q<=0	;
	end
	else begin
		q<=a+d	;
	end
end

////////////////////代码2///////////////////////////////

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		q<=0	;
	end
	else begin
		q<=c	;
	end
end
assign	c	=a+d;






