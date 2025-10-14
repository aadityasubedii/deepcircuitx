//altpll bandwidth_type="AUTO" CBX_DECLARE_ALL_CONNECTED_PORTS="OFF" clk0_divide_by=1 clk0_duty_cycle=50 clk0_multiply_by=1 clk0_phase_shift="0" clk1_divide_by=1 clk1_duty_cycle=50 clk1_multiply_by=2 clk1_phase_shift="0" clk2_divide_by=1 clk2_duty_cycle=50 clk2_multiply_by=2 clk2_phase_shift="-833" clk3_divide_by=1 clk3_duty_cycle=50 clk3_multiply_by=4 clk3_phase_shift="0" compensate_clock="CLK0" device_family="Cyclone V" inclk0_input_frequency=20000 intended_device_family="Cyclone IV E" lpm_hint="CBX_MODULE_PREFIX=clk_gen" operation_mode="normal" pll_type="AUTO" port_clk0="PORT_USED" port_clk1="PORT_USED" port_clk2="PORT_USED" port_clk3="PORT_USED" port_clk4="PORT_UNUSED" port_clk5="PORT_UNUSED" port_extclk0="PORT_UNUSED" port_extclk1="PORT_UNUSED" port_extclk2="PORT_UNUSED" port_extclk3="PORT_UNUSED" port_inclk1="PORT_UNUSED" port_phasecounterselect="PORT_UNUSED" port_phasedone="PORT_UNUSED" port_scandata="PORT_UNUSED" port_scandataout="PORT_UNUSED" self_reset_on_loss_lock="OFF" width_clock=5 areset clk inclk locked CARRY_CHAIN="MANUAL" CARRY_CHAIN_LENGTH=48
//VERSION_BEGIN 13.0 cbx_altclkbuf 2013:04:24:18:08:47:SJ cbx_altiobuf_bidir 2013:04:24:18:08:47:SJ cbx_altiobuf_in 2013:04:24:18:08:47:SJ cbx_altiobuf_out 2013:04:24:18:08:47:SJ cbx_altpll 2013:04:24:18:08:47:SJ cbx_cycloneii 2013:04:24:18:08:47:SJ cbx_lpm_add_sub 2013:04:24:18:08:47:SJ cbx_lpm_compare 2013:04:24:18:08:47:SJ cbx_lpm_counter 2013:04:24:18:08:47:SJ cbx_lpm_decode 2013:04:24:18:08:47:SJ cbx_lpm_mux 2013:04:24:18:08:47:SJ cbx_mgl 2013:04:24:18:11:10:SJ cbx_stratix 2013:04:24:18:08:47:SJ cbx_stratixii 2013:04:24:18:08:47:SJ cbx_stratixiii 2013:04:24:18:08:47:SJ cbx_stratixv 2013:04:24:18:08:47:SJ cbx_util_mgl 2013:04:24:18:08:47:SJ  VERSION_END
//CBXI_INSTANCE_NAME="uart_sdram_clk_gen_clk_gen_inst_altpll_altpll_component"
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 1991-2013 Altera Corporation
//  Your use of Altera Corporation's design tools, logic functions 
//  and other software and tools, and its AMPP partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Altera Program License 
//  Subscription Agreement, Altera MegaCore Function License 
//  Agreement, or other applicable license agreement, including, 
//  without limitation, that your use is for the sole purpose of 
//  programming logic devices manufactured by Altera and sold by 
//  Altera or its authorized distributors.  Please refer to the 
//  applicable agreement for further details.



//synthesis_resources = generic_pll 4 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  clk_gen_altpll
	( 
	areset,
	clk,
	fbout,
	inclk,
	locked) /* synthesis synthesis_clearbox=1 */;
	input   areset;
	output   [4:0]  clk;
	output   fbout;
	input   [1:0]  inclk;
	output   locked;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   areset;
	tri0   [1:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_generic_pll1_fboutclk;
	wire  wire_generic_pll1_locked;
	wire  wire_generic_pll1_outclk;
	wire  wire_generic_pll2_outclk;
	wire  wire_generic_pll3_outclk;
	wire  wire_generic_pll4_outclk;
	wire  fb_clkin;

	generic_pll   generic_pll1
	( 
	.fbclk(fb_clkin),
	.fboutclk(wire_generic_pll1_fboutclk),
	.locked(wire_generic_pll1_locked),
	.outclk(wire_generic_pll1_outclk),
	.refclk(inclk[0]),
	.rst(areset));
	defparam
		generic_pll1.duty_cycle = 50,
		generic_pll1.output_clock_frequency = "20000 ps",
		generic_pll1.phase_shift = "0 ps",
		generic_pll1.reference_clock_frequency = "20000 ps",
		generic_pll1.lpm_type = "generic_pll";
	generic_pll   generic_pll2
	( 
	.fbclk(fb_clkin),
	.fboutclk(),
	.locked(),
	.outclk(wire_generic_pll2_outclk),
	.refclk(inclk[0]),
	.rst(areset));
	defparam
		generic_pll2.duty_cycle = 50,
		generic_pll2.output_clock_frequency = "10000 ps",
		generic_pll2.phase_shift = "0 ps",
		generic_pll2.reference_clock_frequency = "20000 ps",
		generic_pll2.lpm_type = "generic_pll";
	generic_pll   generic_pll3
	( 
	.fbclk(fb_clkin),
	.fboutclk(),
	.locked(),
	.outclk(wire_generic_pll3_outclk),
	.refclk(inclk[0]),
	.rst(areset));
	defparam
		generic_pll3.duty_cycle = 50,
		generic_pll3.output_clock_frequency = "10000 ps",
		generic_pll3.phase_shift = "9167 ps",
		generic_pll3.reference_clock_frequency = "20000 ps",
		generic_pll3.lpm_type = "generic_pll";
	generic_pll   generic_pll4
	( 
	.fbclk(fb_clkin),
	.fboutclk(),
	.locked(),
	.outclk(wire_generic_pll4_outclk),
	.refclk(inclk[0]),
	.rst(areset));
	defparam
		generic_pll4.duty_cycle = 50,
		generic_pll4.output_clock_frequency = "5000 ps",
		generic_pll4.phase_shift = "0 ps",
		generic_pll4.reference_clock_frequency = "20000 ps",
		generic_pll4.lpm_type = "generic_pll";
	assign
		clk = {1'b0, wire_generic_pll4_outclk, wire_generic_pll3_outclk, wire_generic_pll2_outclk, wire_generic_pll1_outclk},
		fb_clkin = wire_generic_pll1_fboutclk,
		fbout = fb_clkin,
		locked = wire_generic_pll1_locked;
endmodule //clk_gen_altpll
//VALID FILE
