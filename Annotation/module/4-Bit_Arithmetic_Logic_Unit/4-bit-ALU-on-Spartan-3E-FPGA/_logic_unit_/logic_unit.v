`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:39:56 05/27/2023 
// Design Name: 
// Module Name:    logic_unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module logic_unit(clk, data, clr_common, O, but_A, but_B, but_op);

input clk, clr_common, but_A, but_B, but_op;
input [3:0] data;
//input but_A, but_B, but_op;
reg [3:0] A, B = 0;
reg [3:0] opcode = 0;
wire [3:0] out1, out2;
wire [3:0] out3;
output reg [7:0] O;
parameter 	add_op = 4'b0000,
            sub_op = 4'b0001,
            mul_op = 4'b0010,
            div_op = 4'b0011,
            and_op = 4'b0100,
            or_op = 4'b0101,
            xor_op = 4'b0110,
            xnor_op = 4'b0111;


register_mem r1(clk, clr_common, but_A, data, out1);
register_mem r2(clk, clr_common, but_B, data, out2);
register_mem r3(clk, clr_common, but_op, data, out3);

always@(*) begin
	A <= out1;
	
	B <= out2;
	
	opcode <= out3;
end
	
always@(posedge clk) begin
	
	if(clr_common) begin
	O <= 8'b0;
	end else begin
	case(opcode)
	add_op: O <= A + B;
	sub_op: O <= A - B;
	mul_op: O <= A * B;
	div_op: O <= ~(A & B);
	and_op: O <= A & B;
	or_op: O <= A | B;
	xor_op: O <= A ^ B;
	xnor_op: O <= A ^~ B;
	default: O <= 8'b11111111;
endcase
end
end

endmodule 
