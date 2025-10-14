`timescale 1ns/1ps
module intra_lut1(
  ang,
  yPos,
  move
);

  input [4:0] ang;
  input [2:0] yPos;
  output reg [11:0] move;        //4 x 3

  always @(*)
  begin
   casez ({ang,yPos})
		// angle= -2
	  8'h00:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h01:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h02:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h03:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h04:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h05:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h06:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h07:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -5
		8'h08:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h09:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h0a:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h0b:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h0c:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h0d:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h0e:  begin  move[11:9]<=1 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h0f:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -9
		8'h10:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h11:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h12:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h13:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h14:  begin  move[11:9]<=1 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h15:  begin  move[11:9]<=1 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h16:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h17:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -13
		8'h18:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h19:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h1a:  begin  move[11:9]<=1 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h1b:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h1c:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h1d:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h1e:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h1f:  begin  move[11:9]<=1 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -17
		8'h20:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h21:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h22:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h23:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h24:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h25:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h26:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h27:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -21
		8'h28:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h29:  begin  move[11:9]<=2 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h2a:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h2b:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h2c:  begin  move[11:9]<=2 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h2d:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h2e:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h2f:  begin  move[11:9]<=1 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -26
		8'h30:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h31:  begin  move[11:9]<=2 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h32:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h33:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h34:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h35:  begin  move[11:9]<=2 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h36:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h37:  begin  move[11:9]<=2 ; move[8:6]<=1 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= -32
		8'h38:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h39:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3a:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3b:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3c:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3d:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3e:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		8'h3f:  begin  move[11:9]<=3 ; move[8:6]<=2 ; move[5:3]<=1 ; move[2:0]<=0 ; end
		// angle= 0
		8'h40:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h41:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h42:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h43:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h44:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h45:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h46:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h47:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		// angle= 2
		8'h48:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h49:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h4a:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h4b:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h4c:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h4d:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h4e:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h4f:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		// angle= 5
		8'h50:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h51:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h52:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h53:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h54:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h55:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h56:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h57:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		// angle= 9
		8'h58:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h59:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h5a:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h5b:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h5c:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h5d:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h5e:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=0 ; end
		8'h5f:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		// angle= 13
		8'h60:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h61:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h62:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h63:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h64:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h65:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h66:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=0 ; move[2:0]<=1 ; end
		8'h67:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		// angle= 17
		8'h68:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h69:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h6a:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h6b:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h6c:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h6d:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h6e:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=1 ; end
		8'h6f:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		// angle= 21
		8'h70:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h71:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h72:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=2 ; end
		8'h73:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h74:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h75:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=2 ; end
		8'h76:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h77:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		// angle= 26
		8'h78:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h79:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h7a:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h7b:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h7c:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h7d:  begin  move[11:9]<=0 ; move[8:6]<=0 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h7e:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=1 ; move[2:0]<=2 ; end
		8'h7f:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		// angle= 32
		8'h80:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h81:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h82:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h83:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h84:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h85:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h86:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end
		8'h87:  begin  move[11:9]<=0 ; move[8:6]<=1 ; move[5:3]<=2 ; move[2:0]<=3 ; end

		 default: begin  move <= 0; end 
    endcase
  end
endmodule