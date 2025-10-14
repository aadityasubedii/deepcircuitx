//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
//Date        : Mon Feb 26 12:16:53 2024
//Host        : Sudheer-Akula running 64-bit major release  (build 9200)
//Command     : generate_target Ripple_adder_design_wrapper.bd
//Design      : Ripple_adder_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module Ripple_adder_design_wrapper
   (A,
    B,
    Cin,
    Cout,
    s0,
    s1,
    s2,
    s3);
  input [3:0]A;
  input [3:0]B;
  input Cin;
  output Cout;
  output s0;
  output s1;
  output s2;
  output s3;

  wire [3:0]A;
  wire [3:0]B;
  wire Cin;
  wire Cout;
  wire s0;
  wire s1;
  wire s2;
  wire s3;

  Ripple_adder_design Ripple_adder_design_i
       (.A(A),
        .B(B),
        .Cin(Cin),
        .Cout(Cout),
        .s0(s0),
        .s1(s1),
        .s2(s2),
        .s3(s3));
endmodule
