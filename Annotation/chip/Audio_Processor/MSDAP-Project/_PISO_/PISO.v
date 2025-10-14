module PISO (Frame,Sclk,clear,data_in,Output,p2s_enable,output_ready);
input wire Frame,Sclk,clear;
input p2s_enable;
input [39:0] data_in;
output reg Output,output_ready;
reg [3:0] bit_count;
reg frame_start;
reg out_rdy;
reg [39:0] temp;

always@(posedge Sclk or clear)
 begin
  if (clear ==1'b1)
   begin 
    Output = 1'bx;
	output_ready =0;
   end
  else if (p2s_enable == 1'b1)
   begin
	temp = data_in;
	out_rdy = 1'b1;
	frame_start = 1'b0;
   end
  else if(out_rdy == 1'b1 && frame_start == 1'b0)
   begin 
	    bit_count = 4'd15;
		Output=temp[bit_count];
		frame_start=1'b1;
   end
  else if(frame_start==1'b1)
	begin 
	    out_rdy=1'b0;
	    bit_count=bit_count-1;
		Output=temp[bit_count];
		if(bit_count ==0)
		  begin
		    frame_start=0;
		    output_ready=1'b1;
		  end
	end
  else
	begin
		bit_count = 6'd40;
		Output = 1'b0;
		output_ready=1'b0;
	end
 end
endmodule
