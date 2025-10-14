`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/17/2021 04:05:13 PM
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module alu 
#(parameter data_width = 4 ,
 parameter  data_out = 5 
) 
(
 a_in,
 b_in ,
 ci,
 bi, 
 opcode , 
 reg_Y_out , 
 clk,
 c_out , 
 sign_b , 
 zero_b,
 parity_b,
 overflow,
 result_out, 
 rst_n);
 
 input [data_width-1:0] a_in ;
 input [data_width-1:0] b_in ;
 input clk ;
 input ci ;
 input bi;
 input rst_n ;
 input [data_width-1:0] opcode ;
 output sign_b ;
 output zero_b ;
 output parity_b ;
 output overflow;
 output  reg c_out ;

 output reg [data_out-1:0] result_out ;
 output reg [data_out-1:0] reg_Y_out ;
 reg [data_width-1:0] a_reg ;
 reg [data_width-1:0] b_reg ;
 reg [data_width-1:0] opcode_reg ;
 
 
 always @ (posedge clk)
 begin
 if (~rst_n)
 begin
 {a_reg , b_reg , opcode_reg } <= 12'b0000_0000_0000;
 end
 else
 begin
 a_reg <= a_in ;
 b_reg <= b_in ;
 opcode_reg <= opcode ;
 end
 end
 
 ///logical and arithmetic unit///
 always @ (*)
  begin
   if (~opcode_reg[3])
    begin
 case(opcode_reg[2:0])
 3'b000 : {c_out , reg_Y_out} = a_reg & b_reg ;  //logical and ///
 3'b001 : {c_out ,reg_Y_out} = a_reg | b_reg ;  ///logical or ///
 3'b010 : {c_out , reg_Y_out} = a_reg ^ b_reg ;  ///logical xor //
 3'b011 : {c_out , reg_Y_out} = ~a_reg ;      ////logical Not///
 3'b100 : {c_out , reg_Y_out} = a_reg + b_reg ; ///addition without carry_in//
 3'b101 : {c_out, reg_Y_out} = a_reg + b_reg + ci ; ///addition with carry_in//
 3'b110 : {c_out, reg_Y_out} = a_reg - b_reg;  ///subtraction without borrow_in//
 3'b111 : {c_out , reg_Y_out} = a_reg - b_reg - bi ; //subttraction with borrrow_in//
 default : {c_out ,  reg_Y_out} = 5'b00000;
 endcase
 end
     else
 begin
   case(opcode_reg[2:0])
 3'b000 : {c_out , reg_Y_out} = a_reg + 1 ;   ///increment a //
 3'b001 : {c_out , reg_Y_out} = b_reg + 1;  ///increment b //
 3'b010 : {c_out , reg_Y_out} = b_reg - 1 ; ////decrement b //
 3'b011 : {c_out , reg_Y_out} = a_reg - 1 ; //decrement a //
 default : {c_out , reg_Y_out} = 5'b00000 ;
 endcase
 end
 end
 
 ///flags ///
 assign sign_b = result_out[4] ;
 assign zero_b = ~|result_out ;
 assign parity_b = ~^result_out ;
 assign overflow = (a_reg[3]&b_reg[3]&result_out[4]| (~a_reg[3] & ~b_reg[3] & result_out[4]));
 
 ////output  block///
 always @(posedge clk)
 begin 
 if (~rst_n)
  begin
 result_out <= 5'b00000 ;
      end 
  else  
     begin   
 result_out  <= {c_out , reg_Y_out} ;
  end
   end
 endmodule
 
 
   

