/*
	仿真技巧
	

*/

module pulse(
	clk			,
	rst_n		,
	//其他信号
	en			,
	dout
);


//输入信号
input				clk			;
input				rst_n		;
input				en			;
output				dout		;
reg					dout		;

reg					flag_add	;

//计数器--cnt0
reg	[7:0]			cnt0		;	//计数器位宽
wire				add_cnt0	;	//计数开始条件
wire				end_cnt0	;	//计数结束条件
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
//计数器--cnt0 加1
assign	add_cnt0	=	flag_add	;
//计数器--cnt0 计数结束							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	10	-	1	;
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag_add	<=	0	;
	end
	else if(en)begin
		flag_add	<=	1	;
	end 
	else if(end_cnt0)begin
		flag_add	<=	0	;
	end 
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout	<=	0	;
	end
	else if(add_cnt0	&&	cnt0==9-1)begin
		dout	<=	1	;
	end 
	else if(end_cnt0)begin
		dout	<=	0	;
	end 
end

endmodule
