`timescale 1ns/1ns
`define CLK100_PERIOD 10

module sdram_init_tb;

`include        "../src/Sdram_Params.h"

	reg              Clk;
	reg              Rst_n;
	wire [3:0]       Command;
	wire [`ASIZE-1:0]Saddr;
	wire             Init_done;

	wire             sd_clk;
	wire             Cs_n;
	wire             Ras_n;
	wire             Cas_n;
	wire             We_n;	

	//SDRAM初始化模块例化
	sdram_init sdram_init(
		.Clk(Clk),
		.Rst_n(Rst_n),
		.Command(Command),
		.Saddr(Saddr),
		.Init_done(Init_done)
	);

	assign {Cs_n,Ras_n,Cas_n,We_n} = Command;
	assign sd_clk = ~Clk;

	//SDRAM模型例化
	sdr sdram_model(
		.Dq(), 
		.Addr(Saddr),
		.Ba(), 
		.Clk(sd_clk), 
		.Cke(Rst_n), 
		.Cs_n(Cs_n), 
		.Ras_n(Ras_n),
		.Cas_n(Cas_n),
		.We_n(We_n), 
		.Dqm()
	);	
	
	//系统时钟产生
	initial Clk = 1'b1;
	always #(`CLK100_PERIOD/2) Clk = ~Clk;
	
	initial
	begin
		Rst_n = 1'b0;
		#(`CLK100_PERIOD*200+1);
		Rst_n = 1'b1;
		
		@(posedge Init_done)
		#2000;
		$stop;	
	end

endmodule 