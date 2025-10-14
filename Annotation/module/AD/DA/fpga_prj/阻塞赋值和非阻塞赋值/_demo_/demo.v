/*
阻塞赋值	“=”

非阻塞赋值	“<=”

规范：
	组合逻辑使用阻塞赋值
	时序逻辑使用非阻塞赋值

假设：	
	a=1
*/

//组合逻辑--always

always @(*)begin
	c=a			;
	d=c+a		;
end 
/*
结果：
	c	=	1
	d	=	1+1
*/
//时序逻辑
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
			;
	end
	else begin
		c	<=	a	;
		d	<=	c+a	;
	end
end
/*
结果：
	c	=	1
	d	=	0+1
*/

