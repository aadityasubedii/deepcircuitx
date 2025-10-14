
/*在IDLE状态，如果EN=1,跳转到S1状态，否则保持不变；
在S1状态时，保持5个时钟周期，跳转到S2状态；
在S2状态时，保持7个时钟周期，调回到IDLE状态
*/
parameter		IDLE	=	0	;
parameter		S1		=	1	;
parameter		S2		=	2	;
//第一段--同步时序always模块，格式化描述次态寄存器迁移到现态寄存器（固定-不需要更改）
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		state_c	<=	IDLE	;
	end
	else begin
		state_c	<=	state_n	;
	end
end
//第二段--组合逻辑模块，描述状态转移条件判断
always @(*) begin
	case(state_c)
		IDLE:begin
			if(idl2s1_start) begin
				state_n	=	S1	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		S1:begin
			if(s12s2_start) begin
				state_n	=	S2	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		S2:begin
			if(s22s3_start) begin
				state_n	=	IDLE	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		default:begin
			state_n	=	state_c	;
		end
	endcase		
end
//第三段--设计转移条件
assign	idl2s1_start	=	state_c==IDLE	&&	en==1'b1	;
assign	s12s2_start		=	state_c==S1		&&	count==4	;
assign	s22s3_start		=	state_c==S2		&&	count==6	;

//第四段--同步时序always模块，格式化描述态寄存器输出（可多个输出）

always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		count	<=	1'b0	;
	end
	else if(state_c==S1) begin
		if(count==4)
			count=0;
		else
			count<=count+1;
	end
	else if(state_c==S2) begin
		if(count==6)
			count=0;
		else
			count<=count+1;
	end
	else begin
		count<=0;
	end
end

















