/*
模块工作时钟：100M
sio_c 和 sio_d 是输出信号
当EN=1时，产生波形

en       _____	    
    ____|     |___________________________________________________________________________________________

sio_c
 _____________	     _____	     _____	     _____	     _____	     _____	     _____	     _____	
              |_____|     |_____|     |_____|     |_____|     |_____|     |_____|     |_____|     |_____

sio_d
_______________            __________  __________  __________  __________  __________  __________  __________  ______
     1         \    0     /   D7     \/   ..     \/   D0     \/   X      \/   D7     \/   ..     \/   D0     \/    X
                \________/\__________/\__________/\__________/\__________/\__________/\__________/\__________/\_______
						   |<---------PHASE1----------------------------->|



其中：
	SIO_C 的周期为 1M
	sio_d 的输出为 3组PHASE 每phase 数据8位+X（1位）
	X 的值均为0
	sio 的结束为 0到1
	
*/

//计数器--cnt0
reg[6:0]							cnt0		;	//计数器位宽
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
assign	add_cnt0	=flag==1		;		//新加中间信号
//计数器--cnt0 计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	100	-	1	;	//系统100M，工作1M

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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	30	-	1	;	//数30个100时钟


always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag<=0;
	end
	else if(en)begin
		flag<=1;
	end 
	else if(end_cnt1)begin
		flag<=0;
	end 
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_c <=1;
	end
	else if(add_cnt0 && cnt0==1-1 && cnt1>=1 && cnt1<30)begin	//数到第一个时 sio_c 变高，同时排除两个点
		sio_c <=0;
	end 
	else if(add_cnt0 && cnt0==50-1 )begin	//数50个时钟，即中间点时变高。
		sio_c <=1;
	end 
end

//构造数据      
//起始位：由1变0 start
//结束位：由0变1 end 
//				start	 									end 		
assign tx_data={1'b0,data0,1'b1,data1,1'b1,data2,1'b1,1'b0,1'b1}

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_d <=0;
	end
	else if(add_cnt0 && cnt0==25-1)begin	//低电平的中间点， 50-1是周期中间点，则25-1是低电平的中间点
		sio_d <=tx_data[29-cnt1];	//先高位
	end 
end

///////////////////////////////////////////////////////////////////////////////////////
//读操作
//上游模块发命令给本模块，本模块通过SCCB接口，读取外部模块数据，并通过dout返回
/*
ID Address    sub-address      ID Address    sub-address   
phase1			phase2         phase1			phase2
				第一阶段						第二阶段
第一阶段=phase1+phase2=起始位（1bit）+2*(8+1)+0(1bit)+ 停止位（1bit）=21位
*/

//计数器--cnt0
reg[6:0]							cnt0		;	//计数器位宽
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
assign	add_cnt0	=flag==1		;		//新加中间信号
//计数器--cnt0 计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	100	-	1	;	//系统100M，工作1M

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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	21	-	1	;	//数30个100时钟

//计数器--cnt2
reg[1:0]							cnt2		;	//计数器位宽
wire								add_cnt2	;	//计数开始条件
wire								end_cnt2	;	//计数结束条件
//计数器--cnt2
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt2	<=	0	;
	end
	else if(add_cnt2) begin
		if(end_cnt2)
			cnt2	<=	0	;
		else
			cnt2	<=	cnt2	+	1	;
	end
end
//计数器--cnt2 加1条件
assign	add_cnt2	=	end_cnt1	;
//计数器--cnt2 计数结束条件							
assign	end_cnt2	=	add_cnt2	&&	cnt2	==	2	-	1	;	//要计数2个阶段

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag<=0;
	end
	else if(en)begin
		flag<=1;
	end 
	else if(end_cnt2)begin
		flag<=0;
	end 
end


always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_c <=1;
	end
	else if(add_cnt0 && cnt0==1-1 && cnt1>=1 && cnt1<21)begin	//数到第一个时 sio_c 变0，同时排除两个点
		sio_c <=0;
	end 
	else if(add_cnt0 && cnt0==50-1 )begin	//数50个时钟，即中间点时变高。
		sio_c <=1;
	end 
end

//构造数据--要发2组    
//起始位：由1变0 start
//结束位：由0变1 end 	
//data0 设备地址	，data1寄存器地址
assign tx_data0={1'b0,data0,1'b1,data1,1'b1,1'b0,1'b1}
assign tx_data1={1'b0,data0,1'b1,8'b0 ,1'b1,1'b0,1'b1}

//下面两种方式，结果一样，建议使用方法2
//方法1
/*
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_d <=0;
	end
	else if(add_cnt0 && cnt0==25-1)begin	//低电平的中间点， 50-1是周期中间点，则25-1是低电平的中间点
		if(cnt2==1-1)
			sio_d <=tx_data0[20-cnt1];	//先高位
		else
			sio_d <=tx_data1[20-cnt1];	//先高位
	end 
end
*/
//方法2
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_d <=0;
	end
	else if(add_cnt0 && cnt0==25-1)begin	//低电平的中间点， 50-1是周期中间点，则25-1是低电平的中间点
		sio_d <=tx_data[20-cnt1];	//先高位
	end 
end
always @(*)begin
	if(cnt2==1-1)
		tx_data <=tx_data0;	
	else
		tx_data <=tx_data1;		
end 


//时序逻辑
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout<=0	;
	end
	else if(add_cnt0 && cnt0==50-1 && cnt2==2-1 && cnt1>=11 && cnt1<20) begin
		dout[8-cnt1]<=sio_din	;		// 8?buqueding
	end
end
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		dout_vld<=0	;
	end
	else begin
		dout_vld<=end_cnt2	;
	end
end


///////////////////////////////////////////////////////////////////////////////////////////////////
//读写摄像头时序

//计数器--cnt0
reg[6:0]							cnt0		;	//计数器位宽
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
assign	add_cnt0	=flag==1		;		//新加中间信号
//计数器--cnt0 计数结束条件							
assign	end_cnt0	=	add_cnt0	&&	cnt0	==	100	-	1	;	//系统100M，工作1M

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
assign	end_cnt1	=	add_cnt1	&&	cnt1	==	x	-	1	;	//x 读时30，写时21

//计数器--cnt2
reg[1:0]							cnt2		;	//计数器位宽
wire								add_cnt2	;	//计数开始条件
wire								end_cnt2	;	//计数结束条件
//计数器--cnt2
always @(posedge	clk	or	negedge	rst_n) begin
	if(!rst_n) begin
		cnt2	<=	0	;
	end
	else if(add_cnt2) begin
		if(end_cnt2)
			cnt2	<=	0	;
		else
			cnt2	<=	cnt2	+	1	;
	end
end
//计数器--cnt2 加1条件
assign	add_cnt2	=	end_cnt1	;
//计数器--cnt2 计数结束条件							
assign	end_cnt2	=	add_cnt2	&&	cnt2	==	y	-	1	;	//要计数2个阶段读and写


always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag<=0;
	end
	else if(wr_en|rd_en)begin
		flag<=1;
	end 
	else if(end_cnt2)begin
		flag<=0;
	end 
end
//新加区分读写的信号-flag_wr,高读，低写
always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		flag_wr<=0;
	end
	else if(rd_en)begin
		flag_wr<=1;
	end 
	else if(wr_en)begin
		flag_wr<=0;
	end 
end

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_c <=1;
	end
	else if(add_cnt0 && cnt0==1-1 && cnt1>=1 && cnt1<x)begin	//数到第一个时 sio_c 变0，同时排除两个点
		sio_c <=0;
	end 
	else if(add_cnt0 && cnt0==50-1 )begin	//数50个时钟，即中间点时变高。
		sio_c <=1;
	end 
end

assign tx_wdata={1'b0,data0,1'b1,data1,1'b1,data2,1'b1,1'b0,1'b1}
assign tx_rdata0={1'b0,data0,1'b1,data1,1'b1,1'b0,1'b1}
assign tx_rdata1={1'b0,data0,1'b1,8'b0 ,1'b1,1'b0,1'b1}

always @(posedge	clk	or	negedge	rst_n)	begin
	if(!rst_n)	begin
		sio_d <=0;
	end
	else if(add_cnt0 && cnt0==25-1)begin	//低电平的中间点， 50-1是周期中间点，则25-1是低电平的中间点
		sio_d <=tx_data[x-1-cnt1];	//先高位
	end 
end
always @(*)begin
	if(flag_wr==0) begin
		tx_data	=tx_wdata	;
	end 
	else begin 
		if(cnt2==1-1) begin
			tx_data <=tx_data0;	
		end 
		else begin
			tx_data <=tx_data1;		
		end 
	end 
end 
//组合逻辑--always,,区分 x  y

always @(*)begin
	if(flag_wr==0) begin
		x =	30;
		y	=	1	;
	end 
	else begin
		x=21	;
		y=2	;
	end 
end 

















































































