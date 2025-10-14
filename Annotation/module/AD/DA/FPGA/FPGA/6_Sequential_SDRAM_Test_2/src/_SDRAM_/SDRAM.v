`timescale 1ns/1ns
`define CLK100_PERIOD 10
`define WCLK_PERIOD   40
`define RCLK_PERIOD   40

module SDRAM
(
	input		          input_clk     ,   //时钟信号
   input       		 sys_rst_n   ,   //复位信号
	
	output[`ASIZE-1:0]  Sa,             //SDRAM地址总线 
	output[`BSIZE-1:0]  Ba,             //SDRAMBank地址 
	output              Cs_n,           //SDRAM片选信号 
	output              Cke,           //SDRAM时钟使能
	output              Ras_n,          //SDRAM行地址选
	output              Cas_n,          //SDRAM列地址选
	output              We_n,           //SDRAM写使能
	inout [`DSIZE-1:0]  Dq,             //SDRAM数据总线 
	output[`DSIZE/8-1:0]Dqm,            //SDRAM数据掩码
	
	//add
	//input	wire				clk_Key_1	,
	input	wire				clk_Key_2	,
	(* noprune *)output 				[41:0] segs,
	(* keep *)output			clk_400M,
	(* keep *)output 			sdram_clk
);
`include        "../src/Sdram_Params.h"


	reg               sys_clk;

   (* keep *)wire [`DSIZE-1:0]  Wr_data;
   reg               Wr_en;
   reg               Wr_load;
   reg               Wr_clk;

   (* keep *)wire[`DSIZE-1:0]  Rd_data;
   reg					Rd_en;
   reg					Rd_load;
   wire					Rd_clk;

	
	
	wire            locked          ;   //pll锁定信号
	(* keep *)wire    [ 7:0]  rx_data         ;   //串口接收模块拼接后的8位数据
	(* noprune *)reg            rx_flag         ;   //数据标志信号
	(* keep *)wire [15:0]	address	;
				wire	[15:0]	address_rd;
	(* noprune *)reg			rx_flag_set	;
	(* keep *)wire[15:0]			rx_flag_count	;
	(* noprune *)reg			rx_flag_count_clr	;
	wire				clk_5M;

	sdram_control_top sdram_control_top(
		.Clk(sys_clk),
		.Rst_n(sys_rst_n),
		.Sd_clk(sdram_clk),

		.Wr_data(Wr_data),
		.Wr_en(1'b1),
		.Wr_addr({2'b0,address[12:0],address[8:0]}),
		.Wr_max_addr(24'hFFFFFF),
		.Wr_load(~sys_rst_n),
		.Wr_clk(Wr_clk),
		.Wr_full(),
		.Wr_use(),

		.Rd_data(Rd_data),
		.Rd_en(1'b1),
		.Rd_addr({2'b0,address_rd[12:0],address_rd[8:0]}),
		.Rd_max_addr(24'hFFFFFF),
		.Rd_load(~sys_rst_n),
		.Rd_clk(Rd_clk),
		.Rd_empty(),
		.Rd_use(),

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
	
//------------PLL-------------------------
pll	pll_inst
(
	.refclk     		(input_clk        ),
   .rst     			(~sys_rst_n     	),
   .outclk_0         (sys_clk      		),
   .outclk_1         (sdram_clk   		),	//SDRAM控制器时钟
   .outclk_2         ( 						),	//写数据到SDRAM时钟
	.outclk_3			(	  					),	//读数据到SDRAM时钟
	.outclk_4			(clk_400M			),
	.outclk_5			(clk_5M				),
	
   .locked     (locked         	)
);
assign	clk_Key_1 = clk_5M&&(address < 16'd10);
assign	Rd_clk = clk_Key_2;
//-------------------ROM Read----------------
rom	rom_inst
(
	.address	(address),
	.clock	(sys_clk),
	.q			(Wr_data)
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

counter counter_inst_2
(
	.aclr(~sys_rst_n),//~sys_rst_n
	.clock(~clk_Key_2),
	.cnt_en(1'b1),
	.q(address_rd)
);
//----------rx_flag 1 clock period----------------
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(sys_rst_n == 1'b0)
	begin
        Wr_clk <= 1'b0;
		  rx_flag_set <= 0;
		  rx_flag_count_clr <= 1'd1;
	end
   else if((rx_flag_count <= 16'd14)&&(~clk_Key_1))
	begin
		rx_flag_count_clr <= 1'd0;
		rx_flag_set <= 1'b1;
	end
	else if((rx_flag_count == 16'd15)&&(~clk_Key_1))
		Wr_clk <= 1'b1;
	else if((rx_flag_count > 16'd16)&&(~clk_Key_1))
	begin
		Wr_clk <= 1'b0;
		rx_flag_set <= 0;
	end
	else
	begin
		Wr_clk <= 1'b0;
		rx_flag_set <= 0;
		rx_flag_count_clr <= 1'd1;
	end
end
//--------show data-----------
seven_segment_LED seven_segment_LED_inst
(
	.rst_n(sys_rst_n),
	.clk(clk_5M),
	.num(Rd_data),//rfifo_rd_data
	.segs(segs)
);

endmodule
