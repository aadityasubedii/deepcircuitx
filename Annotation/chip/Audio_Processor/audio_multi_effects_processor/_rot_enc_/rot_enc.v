`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:10:29 09/04/2022 
// Design Name: 
// Module Name:    rot_enc 
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
module rot_enc(clk, rot_A, rot_B, rlrot);

input clk, rot_A, rot_B;
output [1:0] rlrot;

reg rot_A_in;
reg rot_B_in;
reg [1:0] rot_in;

reg rot_q1;
reg delay_rot_q1;
reg rot_q2;

reg rot_event;
reg rot_left;

always@(posedge clk)
begin
	rot_A_in <= rot_A;
	rot_B_in <= rot_B;
	rot_in <= {rot_B_in, rot_A_in};
	case(rot_in)
		2'b00: begin
					rot_q1 <= 0; rot_q2 <= rot_q2;
				 end
		2'b01: begin
					rot_q1 <= rot_q1; rot_q2 <= 0;
				 end
		2'b10: begin
					rot_q1 <= rot_q1; rot_q2 <= 1;
				 end
		2'b11: begin
					rot_q1 <= 1; rot_q2 <= rot_q2;
				 end
		default: begin
						rot_q1 <= rot_q1; rot_q2 <= rot_q2;
					end
	endcase
end

/*direction*/
always@(posedge clk)
begin
	delay_rot_q1 <= rot_q1;
	if((rot_q1 == 1) && (delay_rot_q1 == 0))
	begin
		rot_event <= 1; rot_left <= rot_q2;
	end
	else begin
		rot_event <= 0; rot_left <= rot_left;
	end
end

assign rlrot = {rot_event, rot_left};
endmodule
