`timescale 1ns / 1ps

module SignextL(Sclk,sign_statusL,signinL,signoutL);

input Sclk,sign_statusL;
input [15:0]signinL;

output reg [39:0] signoutL;

reg [39:0]padL;

always @(posedge Sclk)
begin
	if(sign_statusL==1)
	begin
		if(signinL[15]==1)
		begin
			padL=40'hFF00000000;
			padL[31:16]=signinL;
		end
		else
		begin
			padL=40'h0000000000;
			padL[31:16]=signinL;		
		end
	end
	
	signoutL=padL;
end

endmodule
