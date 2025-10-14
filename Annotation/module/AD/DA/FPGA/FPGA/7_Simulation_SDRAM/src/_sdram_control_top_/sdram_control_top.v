/***************************************************
*	Module Name		:	sdram_control_top		   
*	Engineer		   :	小梅哥
*	Target Device	:	EP4CE10F17C8
*	Tool versions	:	Quartus II 13.0
*	Create Date		:	2017-3-31
*	Revision		   :	v1.0
*	Description		:   加FIFO后的SDRAM控制器顶层文件
**************************************************/
module sdram_control_top(
	Clk,
	Rst_n,
	Sd_clk,

	Wr_data,
	Wr_en,
	Wr_addr,
	Wr_max_addr,
	Wr_load,
	Wr_clk,
	Wr_full,
	Wr_use,

	Rd_data,
	Rd_en,
	Rd_addr,
	Rd_max_addr,
	Rd_load,
	Rd_clk,
	Rd_empty,
	Rd_use,

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

`include        "../src/Sdram_Params.h"
	
	input               Clk;            //系统时钟
	input               Rst_n;          //复位信号，低电平有效
	input               Sd_clk;         //SDRAM时钟信号

   input[`DSIZE-1:0]   Wr_data;        //待写入数据
   input               Wr_en;          //写数据使能信号
   input	[23:0]        Wr_addr;        //写数据起始地址
   input	[23:0]        Wr_max_addr;    //写数据最大地址(SC_BL的整数倍)
   input               Wr_load;        //写FIFO清零信号
   input               Wr_clk;         //写FIFO数据时钟信号
   output              Wr_full;        //写FIFO数据满信号
   output[7:0]         Wr_use;         //写FIFO数据可用数据量

   output[`DSIZE-1:0]  Rd_data;        //读出的数据
   input					  Rd_en;			   //读数据使能信号
   input	[23:0]        Rd_addr;		   //读数据起始地址
   input	[23:0]        Rd_max_addr;	   //读数据最大地址(SC_BL的整数倍)
   input					  Rd_load;		   //读FIFO清零信号
   input					  Rd_clk;		   //读FIFO数据时钟信号
   output				  Rd_empty;		   //读FIFO数据空信号
   output[7:0]		     Rd_use;		   //读FIFO数据可用数据量

	output[`ASIZE-1:0]  Sa;             //SDRAM地址总线 
	output[`BSIZE-1:0]  Ba;             //SDRAMBank地址 
	output              Cs_n;           //SDRAM片选信号 
	output              Cke;            //SDRAM时钟使能
	output              Ras_n;          //SDRAM行地址选
	output              Cas_n;          //SDRAM列地址选
	output              We_n;           //SDRAM写使能
	inout [`DSIZE-1:0]  Dq;             //SDRAM数据总线 
	output[`DSIZE/8-1:0]Dqm;            //SDRAM数据掩码
	
	reg                 sd_wr;          //写SDRAM使能信号
	reg                 sd_rd;          //读SDRAM使能信号
	reg  [`ASIZE-1:0]   sd_caddr;       //写SDRAM时列地址
	reg  [`ASIZE-1:0]   sd_raddr;       //写SDRAM时行地址
	reg  [`BSIZE-1:0]   sd_baddr;       //写SDRAM时Bank地址
	wire [`DSIZE-1:0]   sd_wr_data;     //待写入SDRAM数据
	wire [`DSIZE-1:0]   sd_rd_data;     //读出SDRAM的数据
	wire                sd_rdata_vaild; //读SDRAM时数据有效区
	wire                sd_wdata_vaild; //写SDRAM时数据有效区
	wire                sd_wdata_done;  //一次写突发完成标识位
	wire                sd_rdata_done;  //一次读突发完成标识位
	wire [7:0]          fifo_rduse;     //写FIFO模块可读数据量
	wire [7:0]          fifo_wruse;     //读FIFO模块已写数据量
	reg [23:0]          wr_sdram_addr;  //写SDRAM的地址
	reg [23:0]          rd_sdram_addr;  //读SDRAM的地址
	wire                sd_wr_req;      //请求写数据到SDRAM      
	wire                sd_rd_req;      //请求向SDRAM读数据

	//SDRAM控制器模块例化
	sdram_control sdram_control(
		.Clk(Clk),
		.Rst_n(Rst_n),

		.Wr(sd_wr),
		.Rd(sd_rd),
		.Caddr(sd_caddr),
		.Raddr(sd_raddr),
		.Baddr(sd_baddr),
		.Wr_data(sd_wr_data),
		.Rd_data(sd_rd_data),
		.Rd_data_vaild(sd_rdata_vaild),
		.Wr_data_vaild(sd_wdata_vaild),
		.Wdata_done(sd_wdata_done),
		.Rdata_done(sd_rdata_done),

		.Sa(Sa),
		.Ba(Ba),
		.Cs_n(Cs_n),
		.Cke(Cke),
		.Ras_n(Ras_n),
		.Cas_n(Cas_n),
		.We_n(We_n),
		.Dq(Dq),
		.Dqm(Dqm)
	);

	//写FIFO模块例化
	fifo_wr sd_wr_fifo(
		.aclr(Wr_load),
		.data(Wr_data),
		.rdclk(Clk),
		.rdreq(sd_wdata_vaild),
		.wrclk(Wr_clk),
		.wrreq(Wr_en),
		.q(sd_wr_data),
		.rdempty(),
		.rdusedw(fifo_rduse),
		.wrfull(Wr_full),
		.wrusedw(Wr_use)
	);

   //读FIFO模块例化
	fifo_rd sd_rd_fifo(
		.aclr(Rd_load),
		.data(sd_rd_data),
		.rdclk(Rd_clk),
		.rdreq(Rd_en),
		.wrclk(Sd_clk),
		.wrreq(sd_rdata_vaild),
		.q(Rd_data),
		.rdempty(Rd_empty),
		.rdusedw(Rd_use),
		.wrfull(),
		.wrusedw(fifo_wruse)
	);

	//写SDRAM数据的地址，数据写完一次增加一次突发长度
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			wr_sdram_addr <= Wr_addr;
		else if(Wr_load == 1'b1)
			wr_sdram_addr <= Wr_addr;
		else if(sd_wdata_done)begin
			if(wr_sdram_addr == Wr_max_addr-SC_BL)
				wr_sdram_addr <= Wr_addr;
			else
				wr_sdram_addr <= wr_sdram_addr + SC_BL;
		end
		else
			wr_sdram_addr <= wr_sdram_addr;
	end

	//读SDRAM数据的地址，数据读完一次增加一次突发长度
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			rd_sdram_addr <= Rd_addr;
		else if(Rd_load == 1'b1)
			rd_sdram_addr <= Rd_addr;
		else if(sd_rdata_done)begin
			if(rd_sdram_addr == Rd_max_addr-SC_BL)
				rd_sdram_addr <= Rd_addr;
			else
				rd_sdram_addr <= rd_sdram_addr + SC_BL;
		end									
		else
			rd_sdram_addr <= rd_sdram_addr;
	end

	//写SDRAM请求信号
	assign sd_wr_req = (fifo_rduse >= SC_BL)?1'b1:1'b0;
	//读SDRAM请求信号
	assign sd_rd_req = (!Rd_load)&&(fifo_wruse[7]==1'b0)?1'b1:1'b0;
	
	//写SDRAM使能信号
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			sd_wr <= 1'b0;
		else if(sd_wr_req)
			sd_wr <= 1'b1;
		else
			sd_wr <= 1'b0;
	end
	//读SDRAM使能信号
	always@(posedge Clk or negedge Rst_n)
	begin
		if(!Rst_n)
			sd_rd <= 1'b0;
		else if(sd_rd_req)
			sd_rd <= 1'b1;
		else
			sd_rd <= 1'b0;
	end

	//SDRAM的列地址
	always@(*)
	begin
		if(!Rst_n)
			sd_caddr = 9'd0;
		else if(sd_wr_req)
			sd_caddr = wr_sdram_addr[8:0];
		else if(sd_rd_req)
			sd_caddr = rd_sdram_addr[8:0];
		else
			sd_caddr = sd_caddr;
	end

	//SDRAM的行地址
	always@(*)
	begin
		if(!Rst_n)
			sd_raddr = 13'd0;
		else if(sd_wr_req)
			sd_raddr = wr_sdram_addr[21:9];
		else if(sd_rd_req)
			sd_raddr = rd_sdram_addr[21:9];
		else
			sd_raddr = sd_raddr;
	end

	//SDRAM的bank地址
	always@(*)
	begin
		if(!Rst_n)
			sd_baddr = 2'd0;
		else if(sd_wr_req)
			sd_baddr = wr_sdram_addr[23:22];
		else if(sd_rd_req)
			sd_baddr = rd_sdram_addr[23:22];
		else
			sd_baddr = sd_baddr;	
	end

endmodule 