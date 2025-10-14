`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:23:09 12/18/2023
// Design Name:   top_module
// Module Name:   E:/IC_design/Verilog/FPGA_S6/dig_volt/sim/tb_top_module.v
// Project Name:  dig_volt
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top_module;

	// Inputs
	reg sys_clk;
	reg sys_rst_n;
	reg [7:0] ad_data;

	// Outputs
	wire [5:0] sel;
	wire [7:0] seg;
	wire ad_clk;

	// Internal signals
	reg clk_sample;
	reg data_en;
	reg [7:0] ad_data_reg;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.sys_clk(sys_clk), 
		.sys_rst_n(sys_rst_n), 
		.ad_data(ad_data), 
		.sel(sel), 
		.seg(seg), 
		.ad_clk(ad_clk)
	);

	initial begin
		// Initialize Inputs
		sys_clk = 1'b1;
		clk_sample = 1'b1;
		sys_rst_n = 1'b0;
		#200;
		sys_rst_n = 1'b1;
		data_en = 1'b0;
		#499990;
		data_en = 1'b1;
	end

	always #10 sys_clk = ~sys_clk;
	always #40 clk_sample = ~clk_sample;

	always @(posedge clk_sample or negedge sys_rst_n) begin
		if (sys_rst_n == 1'b0)
			ad_data_reg <= 8'd0;
		else if (data_en == 1'b1)
			ad_data_reg <= ad_data_reg + 1'b1;
		else 
			ad_data_reg <= 8'd0;
	end

	always @(posedge clk_sample or negedge sys_rst_n) begin
		if (sys_rst_n == 1'b0)
			ad_data <= 8'd0;
		else if (data_en == 1'b0)
			ad_data <= 8'd125;
		else if (data_en == 1'b1)
			ad_data <= ad_data_reg;
	end
      
endmodule

