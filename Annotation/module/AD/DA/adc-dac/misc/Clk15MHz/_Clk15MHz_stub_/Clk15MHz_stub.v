// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (lin64) Build 3367213 Tue Oct 19 02:47:39 MDT 2021
// Date        : Wed Jun  8 22:18:11 2022
// Host        : laptop running 64-bit Ubuntu 20.04.4 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top Clk15MHz -prefix
//               Clk15MHz_ Clk15MHz_stub.v
// Design      : Clk15MHz
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module Clk15MHz(clk_15MHz, clk_125MHz)
/* synthesis syn_black_box black_box_pad_pin="clk_15MHz,clk_125MHz" */;
  output clk_15MHz;
  input clk_125MHz;
endmodule
