`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:09:33 09/01/2022 
// Design Name: 
// Module Name:    fredivider 
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
module fredivider(clk, clk_out);

//(69*(2*(8+1)/(50*10^6)))^(-1) ---> Fs ~40,3[kHz]
//brojaè--->8 Zamijenite taj broj za druge F-ove

/*reg [23:0] counter=0;
initial begin
	clk_out<=0;
end

always @(posedge clk)
begin
	if(counter==16'd0) begin
		counter<=16'd0;
		clk_out <= ~clk_out;
	end
	else begin
		counter<=counter+1;
	end
end*/


input clk; // input clock on FPGA
output reg clk_out; // output clock after dividing the input clock by divisor
reg[27:0] counter=28'd0;
parameter DIVISOR = 28'd2;
// The frequency of the output clk_out
//  = The frequency of the input clk_in divided by DIVISOR
// For example: Fclk_in = 50Mhz, if you want to get 1Hz signal to blink LEDs
// You will modify the DIVISOR parameter value to 28'd50.000.000
// Then the frequency of the output clk_out = 50Mhz/50.000.000 = 1Hz
always @(posedge clk)
begin
	counter <= counter + 28'd1;
 if(counter>=DIVISOR)
		counter <= 28'd0;
	
	clk_out <= (counter<DIVISOR/2)? 1'b1 : 1'b0;
end


endmodule
