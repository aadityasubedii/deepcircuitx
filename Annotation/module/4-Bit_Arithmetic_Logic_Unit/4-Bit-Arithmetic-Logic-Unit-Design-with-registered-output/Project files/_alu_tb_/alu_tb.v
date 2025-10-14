`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2021 10:05:05 PM
// Design Name: 
// Module Name: alu_tb
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
`define data_width 4
`define data_out 5 
`define DELAY 5 
module alu_tb();
reg clk ;
reg rst_n ;
reg [`data_width-1:0] test_a ;
reg [`data_width-1:0] test_b ;
reg [`data_width-1:0]opcode ;
wire [`data_width-1:0] reg_Y_out ;
wire [`data_out-1:0] result_out ;
wire c_out ;
reg test_c ;
reg test_bi ;
wire  sign_b ;
 wire zero_b ;
 wire parity_b ;
 wire overflow;

alu ALU_DUT(
 .a_in(test_a),
 .b_in(test_b) ,
 .ci(test_c),
 .bi(test_bi), 
 .opcode(opcode) , 
 .reg_Y_out(reg_Y_out) , 
 .clk(clk),
 .c_out(c_out) , 
 .sign_b(sign_b), 
 .zero_b(zero_b),
 .parity_b(parity_b),
 .overflow(overflow),
 .result_out(result_out), 
 .rst_n(rst_n));
 
 integer i ;
 
initial 
begin
clk = 1'b0 ;
 rst_n = 1'b0;
end


always #`DELAY clk = ~clk ;


initial begin
test_a = 4'b0000 ;
test_b = 4'b0000 ;
test_c = 1'b0 ;
test_bi = 1'b0 ;
 end
 
initial
  begin
  rst_n = 1'b1 ;
  for (i = 0 ; i<50 ; i = i + 1 )
  begin
  test_a = $random() ;
  test_b= $random();
  test_c = $random() ;
  test_bi = $random();
  opcode = $random() ;
  #`DELAY ;
  $display("Time = %t , test_a = %b , test_b = %b ,test_c = %b , test_bi = %b, reg_Y_out = %b" , $time , test_a , test_b, test_c , test_bi , reg_Y_out ) ;  
  end
end


endmodule
