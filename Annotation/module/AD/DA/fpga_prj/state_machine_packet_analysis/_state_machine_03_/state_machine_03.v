
/*
报文检测器，支持检测数据报文和控制报文

数据报文格式：
10Bytes			1Bytes			2Bytes		1-65535Bytes	4Bytes
报文头			报文类型		长度		数据		校验码	
head			pkt_type		length		playload	fcs

控制报文格式：
10Bytes			1Bytes			64Bytes		4Bytes
报文头			报文类型		数据		校验码
head			pkt_type		playload	fcs

说明：
	复位后，如果输入信号是连续5个0X55D5	表示检测到报文头
	报文头，之后1个字节是报文类型，如果pkt_type=0是控制报文，！=0 则是数据报文
	如果是控制报文，则报文类型后的64个字节的数据和4字节的FCS。
	如果是数据报文，则报文类型后的2个字节是length，length是数据的长度，最后4个FCS
	报文结束后，继续检测报文头，在检测出报文头之前，数据都是无效。	
*/
parameter		IDLE	=	0	;
parameter		HEAD		=	1	;
parameter		TYPE		=	2	;
parameter		LEN			=	3	;
parameter		DATA		=	4	;
parameter		FCS			=	5	;

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
		HEAD:begin
			if(head2typ_start) begin
				state_n	=	TYPE	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		TYPE:begin
			if(type2data_start) begin
				state_n	=	DATA	;				
			end
			else begin
				state_n	=	LEN	;
			end
		end
		LEN:begin
			if(len2data_start) begin
				state_n	=	DATA	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		DATA:begin
			if(data2fcs_start) begin
				state_n	=	FCS	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		FCS:begin
			if(fcs2head_start) begin
				state_n	=	HEAD	;				
			end
			else begin
				state_n	=	state_c	;
			end
		end
		default:begin	///?
			state_n	=	state_c	;
		end
	endcase		
end
//第三段--设计转移条件
assign	head2typ_start	=	state_c==HEAD	&&	head_cnt==9 && din==8'hd5	;
assign	type2data_start	=	state_c==TYPE	&&	din==0	;
assign	len2data_start	=	state_c==LEN	&&	len_cnt==1	;
assign	data2fcs_start	=	state_c==DATA	&&	data_cnt==0	;
assign	fcs2head_start	=	state_c==FCS	&&	fcs_cnt==3	;



//第四段--同步时序always模块，格式化描述态寄存器输出（可多个输出）

always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		head_cnt	<=	1'b0	;
	end
	else if(state_c==HEAD) begin
		if(head_flag==0)begin
			if(din==8'h55)begin
				head_cnt	<=	head_cnt+1;
			end
			else begin
				head_cnt<=0;
			end
		end
		else if(head_flag==1)begin
			if(din==8'hd5)begin
				if(head_cnt==9) begin
					head_cnt	<=	0;
				end
				else begin
					head_cnt<=head_cnt+1;
				end
			end
			else if(din==8'h55) begin
				head_cnt <=1;
			end
			else begin
				head_cnt	<=	0;
			end
		end
	else 	
	else begin
		head_cnt	<=0	;
	end 
end

/////head_flag
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		head_flag	<=	1'b0	;
	end
	else if(state_c==HEAD) begin
		if(head_flag==1'b0)begin
			if(din==8'h55)begin
				head_flag	<=	1'b1;
			end			
		end
		else begin
			if(din==8'h55) begin
				head_flag <=1'b1;
			end
			else begin
				head_flag	<=	1'b0;
			end
		end
	else 	
	else begin
		head_flag	<=1'b0	;
	end 
end
///len_cnt
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		len_cnt	<=	1'b0	;
	end
	else if(state_c==LEN) begin
		len_cnt	<= ~len_cnt;
	end 
	else begin
		len_cnt	<=1'b0	;
	end 
end
//////////////data_cnt		用减1
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		data_cnt	<=	1'b0	;
	end
	else if(state_c==TYPE && din==0) begin
		data_cnt	<= ~CTRL_PKT_LEN-1	;		//CTRL_PKT_LEN ==64
	end
	else if(state_c==LEN)	begin
		if(len_cnt==0)begin
			data_cnt	<= {data_cnt[7:0],din};	//第一次来din位拼到低位
		end
		else begin
			data_cnt<={data_cnt[7:0],din}-1;	//第二次来时din位拼到低位，且总数-1
		end
	end
	else if(data_cnt!=0)begin	//其他时，做减1操作
		data_cnt	<=	data_cnt-1;
	end
end
/////FCS
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		fcs_cnt	<=	1'b0	;
	end
	else if(state_c==FCS) begin
		if(fcs_cnt==3)
			fcs_cnt	<= 0;
		else
			fcs_cnt<=fcs_cnt+1;
	end 	
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		dout	<=	1'b0	;
	end
	else  begin
		dout	<= din;
	end 	
end
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		dout_vld	<=	1'b0	;
	end
	else if(state_c!=HEAD) begin
		dout_vld	<=1'b1;
	end 	
	else begin
		dout_vld	<=1'b0;
	end
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		dout_sop	<=	1'b0	;
	end
	else if(state_c==TYPE) begin
		dout_sop	<=1'b1;
	end 	
	else begin
		dout_sop	<=1'b0;
	end
end
always @(posedge	clk	or	negedge	rst_n)	begin
	if(rst_n==1'b0)	begin
		dout_eop	<=	1'b0	;
	end
	else if(state_c==FCS && fcs_cnt==3) begin
		dout_eop	<=1'b1;
	end 	
	else begin
		dout_eop	<=1'b0;
	end
end















