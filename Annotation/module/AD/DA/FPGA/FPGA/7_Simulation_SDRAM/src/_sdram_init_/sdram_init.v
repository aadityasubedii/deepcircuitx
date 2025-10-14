/***************************************************
*	Module Name		:	sdram_init		   
*	Engineer		   :	小梅哥
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2017-3-31
*	Revision		   :	v1.0
*	Description		:  SDRAM初始化模块
**************************************************/
module sdram_init(
	Clk,
	Rst_n,
	Command,
	Saddr,
	Init_done
);

`include        "Sdram_Params.h"

	input                   Clk;       //系统时钟信号
	input                   Rst_n;     //系统复位信号
	output reg [3:0]        Command;   //SDRAM命令信号
	output reg [`ASIZE-1:0] Saddr;     //SDRAM地址信号
	output                  Init_done; //初始化完成标识位

	localparam init_PRE_TIME   = INIT_PRE,
	           init_AREF1_TIME = INIT_PRE+REF_PRE,
				  init_AREF2_TIME = INIT_PRE+REF_PRE+REF_REF,
				  init_LMR_TIME   = INIT_PRE+REF_PRE+REF_REF*2,
				  init_END_TIME   = INIT_PRE+REF_PRE+REF_REF*2+LMR_ACT;
	
	//SDRAM初始化过程时间计数器
	reg [15:0]init_cnt;
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			init_cnt <= 16'd0;
		else if(init_cnt < init_END_TIME)
			init_cnt <= init_cnt + 16'd1;
		else
			init_cnt <= 16'd0;
	end
	
	//SDRAM初始化完成结束标志位
	assign Init_done = (init_cnt == init_END_TIME);	

	//SDRAM初始化过程，类似线性序列机
	//相应时刻发出对应的命令和操作
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)begin
			Command   <= C_NOP;
			Saddr     <= 0;
		end
		else begin		
			case(init_cnt)
				init_PRE_TIME:begin
					Command   <= C_PRE;
					Saddr[10] <= 1'b1;
				end
				
				init_AREF1_TIME:begin
					Command <= C_AREF;
				end
				
				init_AREF2_TIME:begin
					Command <= C_AREF;
				end
				
				init_LMR_TIME:begin
					Command <= C_MSET;
					Saddr   <= {OP_CODE,2'b00,SDR_CL,SDR_BT,SDR_BL};
				end
				
				default:begin
					Command <= C_NOP;
					Saddr   <= 0;
				end	
			endcase
		end
	end

endmodule 