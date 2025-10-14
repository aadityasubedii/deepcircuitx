`timescale 1ns / 1ps

module Controller(Sclk,Dclk,Frame,S2P_status,rj_status,coeff_status,in_status,InReady,Start,
			address_rj,address_coeff,address_in,alu_status,cont_address,set,sleep_status,col,Reset_n,clear);

input Sclk, Dclk,Frame, S2P_status,sleep_status,Reset_n;
input [31:0] col;

output reg InReady,rj_status,clear,Start;
output reg coeff_status,in_status,alu_status;
output reg [3:0] address_rj;
output reg [8:0] address_coeff;
output reg [9:0] address_in;
output reg [12:0] cont_address;
output reg [12:0] set;

reg [3:0] state;

integer i;

initial begin
	state = 1;
	cont_address=-1;
	set=0;
end

always @(Frame)
begin
	case (state)
	
	2:
	begin
		coeff_status=0;
		in_status=0;
		clear=0;
		rj_status=0;
		
		if(S2P_status==0)
		begin
			rj_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			rj_status=1;
			address_rj = address_rj + 1;
			if(address_rj==15)
				state=3;
		end
	end
	
	4:
	begin
		if(S2P_status==0)
		begin
			coeff_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			coeff_status=1;
			address_coeff = address_coeff + 1;
			if(address_coeff==511)
				state=5;
		end
	end
	
	6:
	begin
		if(S2P_status==0)
		begin
			in_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			in_status=1;
			alu_status=1;
			address_in = address_in + 1;
			cont_address=cont_address+1;
			
			if(cont_address<7000)
			begin
				if(address_in==512)
				begin
					set=set+512;				
					address_in=0;
				end
			end
			else
			begin
				if(address_in==512)
					state=9;
			end
			
		end
	end
	
	endcase
end

always @(posedge Sclk)
begin
	if(Start==1)
		state=0;
	
	case (state)
	
	0:
	begin
		InReady=0;
		rj_status=1;
		coeff_status=1;
		in_status=1;
		clear=1;
		state=1;
	end
	
	1:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_rj=-1;
			state=2;
		end		
	end
	
	3:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_coeff=-1;
			state=4;
		end		
	end
	
	5:
	begin
		InReady=1;
		if(Frame==1)
		begin
			address_in=-1;
			state=6;
		end
		if(Reset_n==0)
			state=7;
	end
	
	6:
	begin
		
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
			alu_status=0;
		end	
		
		if(sleep_status==1)
		begin	
			alu_status=0;
			if(col==-1)
			begin			
				state=8;
			end
			
		end
	end
	
	7:
	begin
		InReady = 0;
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
		end
		else
		begin
			state=5;
			cont_address=set-1;
			InReady = 1;
		end
		alu_status=0;
		in_status=1;
	end
	
	8:
	begin
	
		if(Reset_n==1'b0)
		begin
			state=7;
			InReady=0;
		end
	
		if(S2P_status==0)
		begin
			in_status=0;
		end
		
		if(S2P_status==1 && Frame ==1)
		begin
			if(sleep_status==1)
			begin
				in_status=1;			
			end
			else
			begin
				state=6;
				alu_status=1;
			end
		end
		
	end
	
	
	endcase

end

always @(Sclk)
begin
	if(Reset_n==1'b0)
	begin
		InReady=1'b0;
		state=7;
		alu_status=0;
	end
end

endmodule
