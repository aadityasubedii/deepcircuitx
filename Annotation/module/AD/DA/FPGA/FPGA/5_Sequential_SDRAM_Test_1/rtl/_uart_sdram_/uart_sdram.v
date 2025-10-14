`timescale  1ns/1ns
////////////////////////////////////////////////////////////////////////
// Author        : EmbedFire
// Create Date   : 2019/08/25
// Module Name   : uart_sdram
// Project Name  : uart_sdram
// Target Devices: Altera EP4CE10F17C8N
// Tool Versions : Quartus 13.0
// Description   : uart_sdram顶层模块
// 
// Revision      : V1.0
// Additional Comments:
// 
// 实验平台: 野火_征途Pro_FPGA开发板
// 公司    : http://www.embedfire.com
// 论坛    : http://www.firebbs.cn
// 淘宝    : https://fire-stm32.taobao.com
////////////////////////////////////////////////////////////////////////

module  uart_sdram
(
    input   wire            sys_clk     ,   //时钟信号
    input   wire            sys_rst_n   ,   //复位信号


    output  wire            sdram_clk   ,   //SDRAM 芯片时钟
    output  wire            sdram_cke   ,   //SDRAM 时钟有效
    output  wire            sdram_cs_n  ,   //SDRAM 片选
    output  wire            sdram_cas_n ,   //SDRAM 行有效
    output  wire            sdram_ras_n ,   //SDRAM 列有效
    output  wire            sdram_we_n  ,   //SDRAM 写有效
    output  wire    [1:0]   sdram_ba    ,   //SDRAM Bank地址
    (* keep *)output  wire    [12:0]  sdram_addr  ,   //SDRAM 行/列地址
    output  wire    [1:0]   sdram_dqm   ,   //SDRAM 数据掩码
    inout   wire    [15:0]  sdram_dq    ,    //SDRAM 数据
	 
	 //add
	 input	wire				clk_Key_1	,
	 (* noprune *)output 				[41:0] segs,		
	 (* keep *)output 		 				sys_clk_dup
);

(* keep *)wire [15:0]	address	;
(* noprune *)reg			rx_flag_set	;
(* keep *)wire[15:0]			rx_flag_count	;
(* noprune *)reg			rx_flag_count_clr	;

//********************************************************************//
//****************** Parameter and Internal Signal *******************//
//********************************************************************//
//parameter define
parameter   DATA_NUM    =   24'd1          ;   //写入SDRAM数据个数
parameter   WAIT_MAX    =   16'd7         ;   //等待计数最大值
parameter   UART_BPS    =   14'd9600        ,   //比特率
            CLK_FREQ    =   26'd50_000_000  ;   //时钟频率

// wire define
//uart_rx
(* keep *)wire    [ 7:0]  rx_data         ;   //串口接收模块拼接后的8位数据
(* noprune *)reg            rx_flag         ;   //数据标志信号

//fifo_read
(* keep *)wire    [ 7:0]  rfifo_wr_data   ;   //读fifo发热写入数据
(* keep *)wire            rfifo_wr_en     ;   //读fifo的写使能
(* keep *)wire    [7:0]  rfifo_rd_data   ;   //读fifo的读数据
wire            rfifo_rd_en     ;   //读fifo的读使能
wire    [9:0]   rd_fifo_num     ;   //读fifo中的数据量

//clk_gen
(* keep *)wire            clk_50m         ;
(* keep *)wire            clk_100m        ;
(* keep *)wire            clk_100m_shift  ;   //pll产生时钟
wire            locked          ;   //pll锁定信号
wire            rst_n           ;   //复位信号

//sdram_top_inst
reg     [23:0]  data_num        ;   //写入SDRAM数据个数计数
reg             read_valid      ;   //数据读使能
reg     [15:0]  cnt_wait        ;   //等待计数器

//********************************************************************//
//***************************** Main Code ****************************//
//********************************************************************//
//rst_n:复位信号
assign  rst_n = sys_rst_n & locked;

//data_num:写入SDRAM数据个数计数
always@(posedge clk_50m or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        data_num    <=  24'd0;
    else    if(read_valid == 1'b1)
        data_num    <=  24'd0;
    else    if(rx_flag == 1'b1)
        data_num    <=  data_num + 1'b1;
    else
        data_num    <=  data_num;

//cnt_wait:等待计数器
always@(posedge clk_50m or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt_wait    <=  16'd0;
    else    if(cnt_wait == WAIT_MAX)
        cnt_wait    <=  16'd0;
    else    if(data_num == DATA_NUM)
        cnt_wait    <=  cnt_wait + 1'b1;

//read_valid:数据读使能
always@(posedge clk_50m or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        read_valid  <=  1'b0;
    else    if(cnt_wait == WAIT_MAX)
        read_valid  <=  1'b1;
    else    if(rd_fifo_num == DATA_NUM)
        read_valid  <=  1'b0;

//********************************************************************//
//*************************** Instantiation **************************//
//********************************************************************//
//------------- clk_gen_inst -------------
clk_gen clk_gen_inst (
    .inclk0     (sys_clk        ),
    .areset     (~sys_rst_n     ),
    .c0         (clk_50m        ),
    .c1         (clk_100m       ),
    .c2         (clk_100m_shift ),
	 .c3			 (sys_clk_dup	  ),
	 
    .locked     (locked         )
);

//-------------uart_rx_inst-------------


//------------- sdram_top_inst -------------
sdram_top   sdram_top_inst
(
    .sys_clk            (clk_100m       ),  //sdram 控制器参考时钟
    .clk_out            (clk_100m_shift ),  //用于输出的相位偏移时钟
    .sys_rst_n          (rst_n          ),  //系统复位
//用户写端口
    .wr_fifo_wr_clk     (clk_50m        ),  //写端口FIFO: 写时钟
    .wr_fifo_wr_req     (rx_flag        ),  //写端口FIFO: 写使能
    .wr_fifo_wr_data    ({8'b0,rx_data} ),  //写端口FIFO: 写数据
    .sdram_wr_b_addr    ({8'd0,address} ),  //写SDRAM的起始地址
    .sdram_wr_e_addr    (DATA_NUM       ),  //写SDRAM的结束地址
    .wr_burst_len       (DATA_NUM       ),  //写SDRAM时的数据突发长度
    .wr_rst             (               ),  //写复位
//用户读端口
    .rd_fifo_rd_clk     (clk_50m        ),  //读端口FIFO: 读时钟
    .rd_fifo_rd_req     (rfifo_wr_en    ),  //读端口FIFO: 读使能
    .rd_fifo_rd_data    (rfifo_wr_data  ),  //读端口FIFO: 读数据
    .sdram_rd_b_addr    ({8'd0,address} ),  //读SDRAM的起始地址
    .sdram_rd_e_addr    (DATA_NUM       ),  //读SDRAM的结束地址
    .rd_burst_len       (DATA_NUM       ),  //从SDRAM中读数据时的突发长度
    .rd_rst             (               ),  //读复位
    .rd_fifo_num        (rd_fifo_num    ),   //读fifo中的数据量
//用户控制端口
    .read_valid         (read_valid     ),  //SDRAM 读使能
    .init_end           (               ),  //SDRAM 初始化完成标志
//SDRAM 芯片接口
    .sdram_clk          (sdram_clk      ),  //SDRAM 芯片时钟
    .sdram_cke          (sdram_cke      ),  //SDRAM 时钟有效
    .sdram_cs_n         (sdram_cs_n     ),  //SDRAM 片选
    .sdram_ras_n        (sdram_ras_n    ),  //SDRAM 行有效
    .sdram_cas_n        (sdram_cas_n    ),  //SDRAM 列有效
    .sdram_we_n         (sdram_we_n     ),  //SDRAM 写有效
    .sdram_ba           (sdram_ba       ),  //SDRAM Bank地址
    .sdram_addr         (sdram_addr     ),  //SDRAM 行/列地址
    .sdram_dq           (sdram_dq       ),  //SDRAM 数据
    .sdram_dqm          (sdram_dqm      )   //SDRAM 数据掩码
);

//------------- fifo_read_inst --------------
/*
fifo_read   fifo_read_inst
(
    .sys_clk     (clk_50m       ),   //input             sys_clk
    .sys_rst_n   (sys_rst_n     ),   //input             sys_rst_n
    .rd_fifo_num (rd_fifo_num   ),
    .pi_data     (rfifo_wr_data ),   //input     [7:0]   pi_data
    .burst_num   (DATA_NUM      ),
    
    .read_en     (rfifo_wr_en   ),   //input             pi_flag
    .tx_data     (rfifo_rd_data ),   //output    [7:0]   tx_data
    .tx_flag     (rfifo_rd_en   )    //output            tx_flag

);
*/
//-------------uart_tx_inst-------------



//-------------------ROM Read----------------
rom	rom_inst
(
	.address	(address),
	.clock	(sys_clk),
	.q			(rx_data)
);
//--------------provide address for rom-----
counter counter_inst_0
(
	.aclr(1'b0),//~sys_rst_n
	.clock(~clk_Key_1),
	.cnt_en(1'b1),
	.q(address)
);
counter counter_inst_1
(
	.aclr(rx_flag_count_clr),
	.clock(sys_clk),
	.cnt_en(rx_flag_set),
	.q(rx_flag_count)
);
//----------rx_flag 1 clock period----------------
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(sys_rst_n == 1'b0)
	begin
        rx_flag <= 1'b0;
		  rx_flag_set <= 0;
		  rx_flag_count_clr <= 1'd1;
	end
   else if((rx_flag_count <= 16'd14)&&(~clk_Key_1))
	begin
		rx_flag_count_clr <= 1'd0;
		rx_flag_set <= 1'b1;
	end
	else if((rx_flag_count == 16'd15)&&(~clk_Key_1))
		rx_flag <= 1'b1;
	else if((rx_flag_count > 16'd15)&&(~clk_Key_1))
	begin
		rx_flag <= 1'b0;
		rx_flag_set <= 0;
	end
	else
	begin
		rx_flag <= 1'b0;
		rx_flag_set <= 0;
		rx_flag_count_clr <= 1'd1;
	end
end
//--------show data-----------
seven_segment_LED seven_segment_LED_inst
(
	.rst_n(sys_rst_n),
	.clk(sys_clk),
	.num(rfifo_wr_data),//rfifo_rd_data
	.segs(segs)
);

// test --------------------------
/*
always@(sys_clk)
begin
	sys_clk_dup <= sys_clk;
end
*/
endmodule
