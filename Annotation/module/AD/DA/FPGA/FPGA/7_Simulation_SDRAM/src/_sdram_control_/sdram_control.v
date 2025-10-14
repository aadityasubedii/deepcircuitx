/***************************************************
*	Module Name		:	sdram_control		   
*	Engineer		   :	小梅哥
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2017-3-31
*	Revision		   :	v1.0
*	Description		:  SDRAM控制器模块
**************************************************/
module sdram_control(
	Clk,
	Rst_n,
	
	Wr,
	Rd,
	Caddr,
	Raddr,
	Baddr,
	Wr_data,
	Rd_data,
	Rd_data_vaild,
	Wr_data_vaild,
	Wdata_done,
	Rdata_done,	

	Sa,
	Ba,
	Cs_n,
	Cke,
	Ras_n,
	Cas_n,
	We_n,
	Dq,
	Dqm
);

`include        "Sdram_Params.h"

	input             Clk;           //系统时钟信号
	input             Rst_n;         //复位信号，低电平有效 
	input             Wr;            //写SDRAM使能信号
	input             Rd;            //读SDRAM使能信号
	input [`ASIZE-1:0]Caddr;         //写SDRAM时列地址
	input [`ASIZE-1:0]Raddr;         //写SDRAM时行地址
	input [`BSIZE-1:0]Baddr;         //写SDRAM时Bank地址
	input [`DSIZE-1:0]Wr_data;       //待写入SDRAM数据
	output[`DSIZE-1:0]Rd_data;       //读出SDRAM的数据
	output reg        Rd_data_vaild; //读SDRAM时数据有效区
	output reg        Wr_data_vaild; //写SDRAM时数据有效区
	output	         Wdata_done;    //一次写突发完成标识位
	output            Rdata_done;    //一次读突发完成标识位

	//	SDRAM Side
	output reg[`ASIZE-1:0]Sa;        //SDRAM地址总线
	output reg[`BSIZE-1:0]Ba;        //SDRAMBank地址
	output                Cs_n;      //SDRAM片选信号
	output                Cke;       //SDRAM时钟使能
	output                Ras_n;     //SDRAM行地址选通
	output                Cas_n;     //SDRAM列地址选通
	output                We_n;      //SDRAM写使能
	inout [`DSIZE-1:0]    Dq;        //SDRAM数据总线
	output[`DSIZE/8-1:0]  Dqm;       //SDRAM数据掩码
	
	//---------------------------------
	wire [3:0]      init_cmd;        //SDRAM初始化命令输出
	wire[`ASIZE-1:0]init_addr;       //SDRAM初始化地址输出
	wire            init_done;       //SDRAM初始化完成标志位
	reg [31:0]      ref_time_cnt;    //刷新定时计数器	
	wire            ref_time_flag;   //刷新定时时间标志位，定时到达时置1
	reg [3:0]       main_state;      //主状态寄存器
	reg             ref_req;         //刷新操作请求
	reg             ref_opt_done;    //一次刷新操作完成标志位
	reg             wr_opt_done;     //一次突发写操作完成标志位
	reg             rd_opt_done;     //一次突发读操作完成标志位
	reg             wr_req;          //写操作请求
	reg             rd_req;          //读操作请求	
	reg             FF;              //标记寄存器
   reg [3:0]       Command;	      //操作命令，等于{CS_N,RAS_N,CAS_N,WE}
	reg [15:0]      ref_cnt;         //自动刷新过程时间计数器	
	reg [`ASIZE-1:0]raddr_r;         //读写行地址寄存器
	reg [`ASIZE-1:0]caddr_r;         //读写列地址寄存器
	reg [`BSIZE-1:0]baddr_r;         //读写bank地址寄存器	
	reg [15:0]      rd_cnt;          //一次突发读操作过程时间计数器	
	reg [15:0]      wr_cnt;          //一次突发写操作过程时间计数器
	
	wire            ref_break_wr;    //写操作过程中，刷新定时到来到此次写操作结束有效区间
	wire            ref_break_rd;    //读操作过程中，刷新定时到来到此次读操作结束有效区间
	wire            wr_break_ref;    //刷新过程中，写操作到来到此次刷新结束有效区间
	wire            rd_break_ref;    //刷新过程中，读操作到来到此次刷新结束有效区间

	//时钟使能信号
	assign Cke = Rst_n;
	
   //SDRAM命令信号组合
	assign {Cs_n,Ras_n,Cas_n,We_n} = Command;
	
	//SDRAM数据线，采用三态输出
	assign Dq = Wr_data_vaild ? Wr_data:16'bz;
	
	//数据掩码，采用16位数据，掩码为全零
	assign Dqm = 2'b00;	
	//---------------------------------
	//主状态机状态
	localparam 
		IDLE   = 4'b0001,  //空闲
	   AREF   = 4'b0010,  //刷新
		WRITE  = 4'b0100,  //写
		READ   = 4'b1000;  //读
	//---------------------------------	
	//SDRAM前期初始化模块例化	
	sdram_init sdram_init(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.Command(init_cmd),
		.Saddr(init_addr),
		.Init_done(init_done)
	);	
	
	//刷新定时计数器
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			ref_time_cnt <= 0;
		else if(ref_time_cnt == AUTO_REF)
			ref_time_cnt <= 1;
		else if(init_done || ref_time_cnt > 0)
			ref_time_cnt <= ref_time_cnt + 10'd1;
		else
			ref_time_cnt <= ref_time_cnt;
	end

	//刷新定时时间标志位，定时到达时置1
	assign ref_time_flag = (ref_time_cnt == AUTO_REF);	
	
	//---------------------------------		
   //主状态机
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)begin
			main_state <= IDLE;
			FF <= 1'b1;
		end
		else begin
			case(main_state)
				IDLE:begin
					Command <= init_cmd;
					Sa <= init_addr;
					if(init_done)
						main_state <= AREF;
					else
						main_state <= IDLE;
				end

				AREF:begin
					if(FF == 1'b0)
						auto_ref;
					else begin
						if(ref_req)begin
							main_state <= AREF;
							FF <= 1'b0;
						end
						else if(wr_req)begin
							main_state <= WRITE;
							FF <= 1'b0;
						end
						else if(rd_req)begin
							main_state <= READ;
							FF <= 1'b0;
						end
						else
							main_state <= AREF;
					end
				end

				WRITE:begin
					if(FF == 1'b0)
						write_data;
					else begin
						if(ref_req == 1'b1)begin
							main_state <= AREF;
							FF <= 1'b0;
						end
						else if(wr_opt_done & wr_req)begin
							main_state <= WRITE;
							FF <= 1'b0;
						end
						else if(wr_opt_done & rd_req)begin
							main_state <= READ;
							FF <= 1'b0;
						end
						else if(wr_opt_done&!wr_req&!rd_req)
							main_state <= AREF;
						else
							main_state <= WRITE;
					end
				end

				READ:begin
					if(FF == 1'b0)
						read_data;
					else begin
						if(ref_req == 1'b1)begin
							main_state <= AREF;
							FF <= 1'b0;
						end
						else if(rd_opt_done & wr_req)begin
							main_state <= WRITE;
							FF <= 1'b0;
						end
						else if(rd_opt_done & rd_req)begin
							main_state <= READ;
							FF <= 1'b0;
						end
						else if( rd_opt_done&!wr_req&!rd_req)
							main_state <= AREF;
						else
							main_state <= READ;
					end
				end
			endcase
		end
	end
	//---------------------------------	
	
	//---------------------------------	
	//读写行列地址寄存器
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
		begin
			raddr_r <= 0;
			caddr_r <= 0;
			baddr_r <= 0;
		end
		else if(rd_req || wr_req)
		begin
			raddr_r <= Raddr;
			caddr_r <= Caddr;
			baddr_r <= Baddr;
		end
		else
			;
	end	
	//---------------------------------
	
	//---------------------------------	
	//自动刷新操作任务,采用线性序列机方法	
   localparam 
      ref_PRE_TIME = 1'b1,              //预充电时刻
      ref_REF1_TIME = REF_PRE+1,        //第一次自动刷新时刻
      ref_REF2_TIME = REF_PRE+REF_REF+1,//第二次自动刷新时刻
      ref_END = REF_PRE+REF_REF*2;      //自动刷新结束时刻

	//自动刷新过程时间计数器
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			ref_cnt <= 16'd0;
		else if(ref_cnt == ref_END)
			ref_cnt <= 16'd0;
		else if(ref_req || ref_cnt>1'b0)
			ref_cnt <= ref_cnt + 16'd1;
		else
			ref_cnt <= ref_cnt;
	end	

	//一次刷新操作完成标志位
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			ref_opt_done <= 1'b0;
		else if(ref_cnt == ref_END)
			ref_opt_done <= 1'b1;
		else
			ref_opt_done <= 1'b0;
	end

	//一次突发写操作过程状态标识信号
	reg ref_opt;
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			ref_opt <= 1'b0;
		else if(ref_req == 1'b1)
			ref_opt <= 1'b1;
		else if(ref_opt_done == 1'b1)
			ref_opt <= 1'b0;
		else
			ref_opt <= ref_opt;
	end

	//自动刷新操作,线性序列机
	task auto_ref;   
	begin
		case(ref_cnt)
			ref_PRE_TIME:begin
				Command <= C_PRE;     //预充电
				Sa[10] <= 1'b1;					
			end				
			
			ref_REF1_TIME:begin
				Command <= C_AREF;    //自动刷新
			end
			
			ref_REF2_TIME:begin
				Command <= C_AREF;    //自动刷新
			end
			
			ref_END:begin
				FF <= 1'b1;
				Command <= C_NOP;
			end

			default:
				Command <= C_NOP;			
		endcase		
	end
	endtask	
	//---------------------------------

	//---------------------------------
	//一次突发写操作任务,线性序列机方法
	localparam 
      wr_ACT_TIME = 1'b1,                       //激活行时刻
      wr_WRITE_TIME = SC_RCD+1,                 //写命令时刻
      wr_PRE_TIME = SC_RCD+SC_BL+WR_PRE+1,      //预充电时刻
      wr_END_TIME = SC_RCD+SC_BL+WR_PRE+REF_PRE;//写操作结束时刻
				  
	//一次突发写操作过程时间计数器
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)	
			wr_cnt <= 16'd0;
		else if(wr_cnt == wr_END_TIME)
			wr_cnt <= 16'd0;
		else if(wr_req||wr_cnt>1'b0)
			wr_cnt <= wr_cnt + 16'd1;
		else
			wr_cnt <= 16'd0;
	end

	//一次写操作过程完成标志位
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			wr_opt_done <= 1'b0;
		else if(wr_cnt == wr_END_TIME)
			wr_opt_done <= 1'b1;
		else
			wr_opt_done <= 1'b0;
	end

	//一次突发写操作过程状态标识信号
	reg wr_opt;
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			wr_opt <= 1'b0;
		else if(wr_req == 1'b1)
			wr_opt <= 1'b1;
		else if(wr_opt_done == 1'b1)
			wr_opt <= 1'b0;
		else
			wr_opt <= wr_opt;
	end

	//写数据操作，数据写入(改变)时刻有效区间
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			Wr_data_vaild <= 1'b0;
		else if((wr_cnt > SC_RCD)&&(wr_cnt <= SC_RCD+SC_BL))
			Wr_data_vaild <= 1'b1; 
		else
			Wr_data_vaild <= 1'b0;
	end

	//一次突发写操作数据写完成标志位
	assign Wdata_done = (wr_cnt == SC_RCD+SC_BL+1)?1'b1:1'b0;
	
	//一次突发写操作任务,类似线性序列机方法
	task write_data;
	begin
		case(wr_cnt)
			wr_ACT_TIME:begin
				Command <= C_ACT;
				Sa <= raddr_r;             //激活行	
				Ba <= baddr_r;
			end

			wr_WRITE_TIME:begin
				Command <= C_WR;
				Sa <= {1'b0,caddr_r[8:0]}; //激活列
				Ba <= baddr_r;
			end

			wr_PRE_TIME:begin				
				Command <= C_PRE;          //预充电
				Sa[10] <= 1'b1;
			end

			wr_END_TIME:begin
				Command <= C_NOP;
				FF <= 1'b1;
			end

			default:
				Command <= C_NOP;
		endcase
	end	
	endtask
	//---------------------------------	
	
	//---------------------------------
	//一次突发读操作任务,线性序列机方法	
	localparam
		rd_ACT_TIME  = 1'b1,              //激活行时刻
		rd_READ_TIME = SC_RCD+1,          //读命令时刻
		rd_PRE_TIME  = SC_RCD+SC_BL+1,    //预充电时刻
		rd_END_TIME  = SC_RCD+SC_CL+SC_BL;//读操作结束时刻
 
	//一次突发读操作过程时间计数器
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			rd_cnt <= 16'd0;
		else if(rd_cnt == rd_END_TIME)
			rd_cnt <= 16'd0;
		else if(rd_req ||rd_cnt>1'b0)
			rd_cnt <= rd_cnt + 16'd1;
		else
			rd_cnt <= 16'd0;
	end

	//一次突发读操作过程完成标志位	
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			rd_opt_done <= 1'b0;
		else if(rd_cnt == rd_END_TIME)
			rd_opt_done <= 1'b1;
		else
			rd_opt_done <= 1'b0;
	end

	//一次突发读操作过程状态标识信号	
	reg rd_opt;
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			rd_opt <= 1'b0;
		else if(rd_req == 1'b1)
			rd_opt <= 1'b1;
		else if(rd_opt_done == 1'b1)
			rd_opt <= 1'b0;
		else
			rd_opt <= rd_opt;
	end

   //一次突发读操作过程中数据读完标志位
	assign Rdata_done = (rd_cnt == rd_END_TIME)?1'b1:1'b0;

	//读数据操作，数据有效区
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			Rd_data_vaild <= 1'b0;
		else if((rd_cnt > SC_RCD+SC_CL)
		        &&(rd_cnt <= SC_RCD+SC_CL+SC_BL))
			Rd_data_vaild <= 1'b1;
		else
			Rd_data_vaild <= 1'b0;
	end

	//读数据
	assign Rd_data = Dq;
	
	//一次突发读操作任务,类似线性序列机方法
	task read_data;
	begin
		case(rd_cnt)
			rd_ACT_TIME:begin			     //激活命令
				Command <= C_ACT;
				Sa <= raddr_r; 
				Ba <= baddr_r;
			end

			rd_READ_TIME:begin			  //读命令
				Command <= C_RD;
				Sa <= {1'b0,caddr_r[8:0]};
				Ba <= baddr_r;
			end

			rd_PRE_TIME:begin
				Command <= C_PRE;         //预充电
				Sa[10] <= 1'b1;
			end
			
			rd_END_TIME:begin
				FF <= 1'b1;
				Command <= C_NOP;
			end
			
			default:
				Command <= C_NOP;
		endcase
	end
	endtask
	//---------------------------------

	//---------------------------------	
	//写操作过程刷新到记住刷新信号ref_break_wr
	assign ref_break_wr = (ref_time_flag && wr_opt)?1'b1:
	                      ((!wr_opt)?1'b0:ref_break_wr);

	//读操作过程刷新到记住刷新信号ref_break_rd
	assign ref_break_rd = (ref_time_flag&&rd_opt)?1'b1:
	                      ((!rd_opt)?1'b0:ref_break_rd);
								 
	//刷新过程外部写使能到记住写使能信号wr_break_ref
	assign wr_break_ref = ((Wr && ref_opt)?1'b1:
	                      ((!ref_opt)?1'b0:wr_break_ref));	
	
	//刷新过程外部读使能到记住读使能信号rd_break_ref信号
	assign rd_break_ref = ((Rd && ref_opt)?1'b1: 
	                      ((!ref_opt)?1'b0:rd_break_ref));
	//---------------------------------
	
	//---------------------------------
	//刷新请求信号
	always@(*)
	begin
		case(main_state)
			AREF:begin
				if(ref_time_flag)
					ref_req = 1'b1;
				else
					ref_req = 1'b0;
			end

			WRITE:begin
				if(ref_break_wr && wr_opt_done)
					ref_req = 1'b1;
				else
					ref_req = 1'b0;
			end

			READ:begin
				if(ref_break_rd && rd_opt_done)
					ref_req = 1'b1;
				else
					ref_req = 1'b0;
			end

			default:
				ref_req = 1'b0;
		endcase
	end	
	//---------------------------------
	
	//---------------------------------
	//写操作请求信号
	always@(*)
	begin
		case(main_state)
			AREF:begin
				if((!wr_break_ref)&& Wr &&!ref_time_flag)
					wr_req = 1'b1;
				else if(wr_break_ref && ref_opt_done)
					wr_req = 1'b1;
				else
					wr_req = 1'b0;
			end

			WRITE:begin
				if(wr_opt_done && Wr && !ref_break_wr)
					wr_req = 1'b1;
				else
					wr_req = 1'b0;
			end

			READ:begin
				if(rd_opt_done && Wr && !ref_break_rd)
					wr_req = 1'b1;
				else
					wr_req = 1'b0;
			end

			default:
				wr_req = 1'b0;
		endcase		
	end	
	//---------------------------------
	
	//---------------------------------
	//读操作请求信号
	always@(*)
	begin
		case(main_state)
			AREF:begin
				if((!rd_break_ref)&&(!wr_break_ref)&&
			      (!ref_time_flag)&& !Wr && Rd )
					rd_req = 1'b1;
				else if(ref_opt_done &&!wr_break_ref&&
				        rd_break_ref)
					rd_req = 1'b1;
				else
					rd_req = 1'b0;
			end

			WRITE:begin
				if(wr_opt_done &&(!ref_break_wr)&&
				   !Wr && Rd)
					rd_req = 1'b1;
				else
					rd_req = 1'b0;
			end

			READ:begin
				if(rd_opt_done &&(!ref_break_rd)&&
				   !Wr && Rd)
					rd_req = 1'b1;
				else
					rd_req = 1'b0;
			end

			default:
				rd_req = 1'b0;	
		endcase
	end
	//---------------------------------
	
endmodule 