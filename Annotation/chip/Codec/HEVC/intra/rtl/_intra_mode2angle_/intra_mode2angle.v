`timescale 1ns/1ps
module intra_mode2angle(
  mode,
  angle
);
  input [5:0] mode;
  output signed [6:0] angle;
  wire signed [3:0] ang;
  reg signed [4:0] angleIdx;
  reg signed [6:0] angle;
  parameter VER_IDX= 26,
            HOR_IDX=10;
  
  wire modeDC,modeHor,modeVer;
  wire signAng;  
  assign modeDC        = mode < 2;
  assign modeHor       = !modeDC && (mode < 18);
  assign modeVer       = !modeDC && !modeHor;
 
  
  //always @ (*)
 // begin
 always @(*)begin
  angleIdx <= modeVer ?  $signed(mode - VER_IDX) : modeHor ? - $signed( mode - HOR_IDX) : 0;
  case(angleIdx)
  5'd0:  angle <= 0;		
  5'd1:  angle <= 2;		
  5'd2:  angle <= 5;
  5'd3:  angle <= 9;
  5'd4:  angle <= 13;
  5'd5:  angle <= 17;
  5'd6:  angle <= 21;
  5'd7:  angle <= 26;
  5'd8:  angle <= 32;	
  -5'sd1:  angle <= -2;		
  -5'sd2:  angle <= -5;
  -5'sd3:  angle <= -9;
  -5'sd4:  angle <= -13;
  -5'sd5:  angle <= -17;
  -5'sd6:  angle <= -21;
  -5'sd7:  angle <= -26;
  -5'sd8:  angle <= -32;
  default :  angle <= 0;
  endcase
  end

 
//end
endmodule
