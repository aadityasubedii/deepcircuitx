`timescale 1ns/1ps
module intra_angleToang(
  angle,
  ang
);
  input signed [6:0] angle;
  output [4:0] ang;
  reg [4:0] ang;
  
  always @(*)
  begin
    case (angle)
      -7'sd2 : ang <= 0;     //-2
      -7'sd5 : ang <= 1;   //-5
      -7'sd9 : ang <= 2;   //-9
      -7'sd13 : ang <= 3;   //-13
      -7'sd17 : ang <= 4;   //-17
      -7'sd21 : ang <= 5;   //-21
      -7'sd26 : ang <= 6;   //-26
	  -7'sd32 : ang <=7;
	  7'd0: ang<= 8;
      7'd2 : ang <= 9;
      7'd5 : ang <= 10;
      7'd9 : ang <= 11;
      7'd13 : ang <= 12;
      7'd17 : ang <= 13;
      7'd21 : ang <= 14;
      7'd26 : ang <= 15;
	  7'd32 : ang<= 16;
      default : ang <=17;
    endcase
end
endmodule