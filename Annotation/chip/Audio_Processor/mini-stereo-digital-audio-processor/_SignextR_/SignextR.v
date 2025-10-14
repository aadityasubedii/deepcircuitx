`timescale 1ns / 1ps

module SignextR(Sclk,sign_statusR,signinR,signoutR);

input Sclk,sign_statusR;
input [15:0]signinR;

output reg [39:0] signoutR;

reg [39:0]padR;

always @(posedge Sclk)
begin
	if(sign_statusR==1)
	begin
		if(signinR[15]==1)
		begin
			padR=40'hFF00000000;
			padR[31:16]=signinR;
		end
		else
		begin
			padR=40'h0000000000;
			padR[31:16]=signinR;		
		end
	end
	
	signoutR=padR;
end

endmodule
