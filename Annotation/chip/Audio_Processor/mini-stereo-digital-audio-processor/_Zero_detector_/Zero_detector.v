`timescale 1ns / 1ps

module Zero_detector(in_status,sleep_status,InputL,InputR,OutReady,col,Reset_n);

input in_status,Reset_n;
input [15:0] InputL,InputR;
input OutReady;
input [31:0] col;

reg [9:0]sleep_count=0;

output reg sleep_status;

always @(posedge in_status)
begin

	if(Reset_n==0)
	begin
		sleep_count = 0;
		sleep_status=0;
	end
	
	if(InputL == 16'b0 && InputR == 16'b0)
	begin
		sleep_count = sleep_count + 1;
		sleep_status=0;
	end
	else
	begin
		sleep_count = 0;
		sleep_status=0;
	end
	
	if(sleep_count>=800)
	begin
		sleep_count=800;
			sleep_status=1;
	end
	
end


endmodule
