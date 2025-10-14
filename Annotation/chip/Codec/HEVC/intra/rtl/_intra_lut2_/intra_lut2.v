`timescale 1ns/1ps
module intra_lut2(			
  ang,
  yPos,
  weight			//pred[x,y] = (32-weight)*ref[]+weight*ref[]....
);

  input [2:0]  yPos;
  output [19:0] weight;
  
  //reg[19:0] weight;
  input [4:0] ang;
  reg [19:0] weight;
  always @(*)
   
  begin 
     casez ({ ang, yPos})
//angle = -2
		8'o00:  begin weight[19:15]= 30; weight[14:10]= 28;  weight[9:5]= 26;  weight[4:0]= 24; end 
		8'o01:  begin weight[19:15]= 22; weight[14:10]= 20;  weight[9:5]= 18;  weight[4:0]= 16; end 
		8'o02:  begin weight[19:15]= 14; weight[14:10]= 12;  weight[9:5]= 10;  weight[4:0]= 8; end 
		8'o03:  begin weight[19:15]= 6; weight[14:10]= 4;  weight[9:5]= 2;  weight[4:0]= 0; end 
		8'o04:  begin weight[19:15]= 30; weight[14:10]= 28;  weight[9:5]= 26;  weight[4:0]= 24; end 
		8'o05:  begin weight[19:15]= 22; weight[14:10]= 20;  weight[9:5]= 18;  weight[4:0]= 16; end 
		8'o06:  begin weight[19:15]= 14; weight[14:10]= 12;  weight[9:5]= 10;  weight[4:0]= 8; end 
		8'o07:  begin weight[19:15]= 6; weight[14:10]= 4;  weight[9:5]= 2;  weight[4:0]= 0; end 
//angle = -5
		8'o10:  begin weight[19:15]= 27; weight[14:10]= 22;  weight[9:5]= 17;  weight[4:0]= 12; end 
		8'o11:  begin weight[19:15]= 7; weight[14:10]= 2;  weight[9:5]= 29;  weight[4:0]= 24; end 
		8'o12:  begin weight[19:15]= 19; weight[14:10]= 14;  weight[9:5]= 9;  weight[4:0]= 4; end 
		8'o13:  begin weight[19:15]= 31; weight[14:10]= 26;  weight[9:5]= 21;  weight[4:0]= 16; end 
		8'o14:  begin weight[19:15]= 11; weight[14:10]= 6;  weight[9:5]= 1;  weight[4:0]= 28; end 
		8'o15:  begin weight[19:15]= 23; weight[14:10]= 18;  weight[9:5]= 13;  weight[4:0]= 8; end 
		8'o16:  begin weight[19:15]= 3; weight[14:10]= 30;  weight[9:5]= 25;  weight[4:0]= 20; end 
		8'o17:  begin weight[19:15]= 15; weight[14:10]= 10;  weight[9:5]= 5;  weight[4:0]= 0; end 
//angle = -9
		8'o20:  begin weight[19:15]= 23; weight[14:10]= 14;  weight[9:5]= 5;  weight[4:0]= 28; end 
		8'o21:  begin weight[19:15]= 19; weight[14:10]= 10;  weight[9:5]= 1;  weight[4:0]= 24; end 
		8'o22:  begin weight[19:15]= 15; weight[14:10]= 6;  weight[9:5]= 29;  weight[4:0]= 20; end 
		8'o23:  begin weight[19:15]= 11; weight[14:10]= 2;  weight[9:5]= 25;  weight[4:0]= 16; end 
		8'o24:  begin weight[19:15]= 7; weight[14:10]= 30;  weight[9:5]= 21;  weight[4:0]= 12; end 
		8'o25:  begin weight[19:15]= 3; weight[14:10]= 26;  weight[9:5]= 17;  weight[4:0]= 8; end 
		8'o26:  begin weight[19:15]= 31; weight[14:10]= 22;  weight[9:5]= 13;  weight[4:0]= 4; end 
		8'o27:  begin weight[19:15]= 27; weight[14:10]= 18;  weight[9:5]= 9;  weight[4:0]= 0; end 
//angle = -13
		8'o30:  begin weight[19:15]= 19; weight[14:10]= 6;  weight[9:5]= 25;  weight[4:0]= 12; end 
		8'o31:  begin weight[19:15]= 31; weight[14:10]= 18;  weight[9:5]= 5;  weight[4:0]= 24; end 
		8'o32:  begin weight[19:15]= 11; weight[14:10]= 30;  weight[9:5]= 17;  weight[4:0]= 4; end 
		8'o33:  begin weight[19:15]= 23; weight[14:10]= 10;  weight[9:5]= 29;  weight[4:0]= 16; end 
		8'o34:  begin weight[19:15]= 3; weight[14:10]= 22;  weight[9:5]= 9;  weight[4:0]= 28; end 
		8'o35:  begin weight[19:15]= 15; weight[14:10]= 2;  weight[9:5]= 21;  weight[4:0]= 8; end 
		8'o36:  begin weight[19:15]= 27; weight[14:10]= 14;  weight[9:5]= 1;  weight[4:0]= 20; end 
		8'o37:  begin weight[19:15]= 7; weight[14:10]= 26;  weight[9:5]= 13;  weight[4:0]= 0; end 
//angle = -17
		8'o40:  begin weight[19:15]= 15; weight[14:10]= 30;  weight[9:5]= 13;  weight[4:0]= 28; end 
		8'o41:  begin weight[19:15]= 11; weight[14:10]= 26;  weight[9:5]= 9;  weight[4:0]= 24; end 
		8'o42:  begin weight[19:15]= 7; weight[14:10]= 22;  weight[9:5]= 5;  weight[4:0]= 20; end 
		8'o43:  begin weight[19:15]= 3; weight[14:10]= 18;  weight[9:5]= 1;  weight[4:0]= 16; end 
		8'o44:  begin weight[19:15]= 31; weight[14:10]= 14;  weight[9:5]= 29;  weight[4:0]= 12; end 
		8'o45:  begin weight[19:15]= 27; weight[14:10]= 10;  weight[9:5]= 25;  weight[4:0]= 8; end 
		8'o46:  begin weight[19:15]= 23; weight[14:10]= 6;  weight[9:5]= 21;  weight[4:0]= 4; end 
		8'o47:  begin weight[19:15]= 19; weight[14:10]= 2;  weight[9:5]= 17;  weight[4:0]= 0; end 
//angle = -21
		8'o50:  begin weight[19:15]= 11; weight[14:10]= 22;  weight[9:5]= 1;  weight[4:0]= 12; end 
		8'o51:  begin weight[19:15]= 23; weight[14:10]= 2;  weight[9:5]= 13;  weight[4:0]= 24; end 
		8'o52:  begin weight[19:15]= 3; weight[14:10]= 14;  weight[9:5]= 25;  weight[4:0]= 4; end 
		8'o53:  begin weight[19:15]= 15; weight[14:10]= 26;  weight[9:5]= 5;  weight[4:0]= 16; end 
		8'o54:  begin weight[19:15]= 27; weight[14:10]= 6;  weight[9:5]= 17;  weight[4:0]= 28; end 
		8'o55:  begin weight[19:15]= 7; weight[14:10]= 18;  weight[9:5]= 29;  weight[4:0]= 8; end 
		8'o56:  begin weight[19:15]= 19; weight[14:10]= 30;  weight[9:5]= 9;  weight[4:0]= 20; end 
		8'o57:  begin weight[19:15]= 31; weight[14:10]= 10;  weight[9:5]= 21;  weight[4:0]= 0; end 
//angle = -26
		8'o60:  begin weight[19:15]= 6; weight[14:10]= 12;  weight[9:5]= 18;  weight[4:0]= 24; end 
		8'o61:  begin weight[19:15]= 30; weight[14:10]= 4;  weight[9:5]= 10;  weight[4:0]= 16; end 
		8'o62:  begin weight[19:15]= 22; weight[14:10]= 28;  weight[9:5]= 2;  weight[4:0]= 8; end 
		8'o63:  begin weight[19:15]= 14; weight[14:10]= 20;  weight[9:5]= 26;  weight[4:0]= 0; end 
		8'o64:  begin weight[19:15]= 6; weight[14:10]= 12;  weight[9:5]= 18;  weight[4:0]= 24; end 
		8'o65:  begin weight[19:15]= 30; weight[14:10]= 4;  weight[9:5]= 10;  weight[4:0]= 16; end 
		8'o66:  begin weight[19:15]= 22; weight[14:10]= 28;  weight[9:5]= 2;  weight[4:0]= 8; end 
		8'o67:  begin weight[19:15]= 14; weight[14:10]= 20;  weight[9:5]= 26;  weight[4:0]= 0; end 
//angle = -32
		8'o7?:  begin weight[19:15]= 0; weight[14:10]= 0;  weight[9:5]= 0;  weight[4:0]= 0; end 
//angle = 0
		8'o10?:  begin weight[19:15]= 0; weight[14:10]= 0;  weight[9:5]= 0;  weight[4:0]= 0; end 
//angle = 2
		8'o110:  begin weight[19:15]= 2; weight[14:10]= 4;  weight[9:5]= 6;  weight[4:0]= 8; end 
		8'o111:  begin weight[19:15]= 10; weight[14:10]= 12;  weight[9:5]= 14;  weight[4:0]= 16; end 
		8'o112:  begin weight[19:15]= 18; weight[14:10]= 20;  weight[9:5]= 22;  weight[4:0]= 24; end 
		8'o113:  begin weight[19:15]= 26; weight[14:10]= 28;  weight[9:5]= 30;  weight[4:0]= 0; end 
		8'o114:  begin weight[19:15]= 2; weight[14:10]= 4;  weight[9:5]= 6;  weight[4:0]= 8; end 
		8'o115:  begin weight[19:15]= 10; weight[14:10]= 12;  weight[9:5]= 14;  weight[4:0]= 16; end 
		8'o116:  begin weight[19:15]= 18; weight[14:10]= 20;  weight[9:5]= 22;  weight[4:0]= 24; end 
		8'o117:  begin weight[19:15]= 26; weight[14:10]= 28;  weight[9:5]= 30;  weight[4:0]= 0; end 
//angle = 5
		8'o120:  begin weight[19:15]= 5; weight[14:10]= 10;  weight[9:5]= 15;  weight[4:0]= 20; end 
		8'o121:  begin weight[19:15]= 25; weight[14:10]= 30;  weight[9:5]= 3;  weight[4:0]= 8; end 
		8'o122:  begin weight[19:15]= 13; weight[14:10]= 18;  weight[9:5]= 23;  weight[4:0]= 28; end 
		8'o123:  begin weight[19:15]= 1; weight[14:10]= 6;  weight[9:5]= 11;  weight[4:0]= 16; end 
		8'o124:  begin weight[19:15]= 21; weight[14:10]= 26;  weight[9:5]= 31;  weight[4:0]= 4; end 
		8'o125:  begin weight[19:15]= 9; weight[14:10]= 14;  weight[9:5]= 19;  weight[4:0]= 24; end 
		8'o126:  begin weight[19:15]= 29; weight[14:10]= 2;  weight[9:5]= 7;  weight[4:0]= 12; end 
		8'o127:  begin weight[19:15]= 17; weight[14:10]= 22;  weight[9:5]= 27;  weight[4:0]= 0; end 
//angle = 9
		8'o130:  begin weight[19:15]= 9; weight[14:10]= 18;  weight[9:5]= 27;  weight[4:0]= 4; end 
		8'o131:  begin weight[19:15]= 13; weight[14:10]= 22;  weight[9:5]= 31;  weight[4:0]= 8; end 
		8'o132:  begin weight[19:15]= 17; weight[14:10]= 26;  weight[9:5]= 3;  weight[4:0]= 12; end 
		8'o133:  begin weight[19:15]= 21; weight[14:10]= 30;  weight[9:5]= 7;  weight[4:0]= 16; end 
		8'o134:  begin weight[19:15]= 25; weight[14:10]= 2;  weight[9:5]= 11;  weight[4:0]= 20; end 
		8'o135:  begin weight[19:15]= 29; weight[14:10]= 6;  weight[9:5]= 15;  weight[4:0]= 24; end 
		8'o136:  begin weight[19:15]= 1; weight[14:10]= 10;  weight[9:5]= 19;  weight[4:0]= 28; end 
		8'o137:  begin weight[19:15]= 5; weight[14:10]= 14;  weight[9:5]= 23;  weight[4:0]= 0; end 
//angle = 13
		8'o140:  begin weight[19:15]= 13; weight[14:10]= 26;  weight[9:5]= 7;  weight[4:0]= 20; end 
		8'o141:  begin weight[19:15]= 1; weight[14:10]= 14;  weight[9:5]= 27;  weight[4:0]= 8; end 
		8'o142:  begin weight[19:15]= 21; weight[14:10]= 2;  weight[9:5]= 15;  weight[4:0]= 28; end 
		8'o143:  begin weight[19:15]= 9; weight[14:10]= 22;  weight[9:5]= 3;  weight[4:0]= 16; end 
		8'o144:  begin weight[19:15]= 29; weight[14:10]= 10;  weight[9:5]= 23;  weight[4:0]= 4; end 
		8'o145:  begin weight[19:15]= 17; weight[14:10]= 30;  weight[9:5]= 11;  weight[4:0]= 24; end 
		8'o146:  begin weight[19:15]= 5; weight[14:10]= 18;  weight[9:5]= 31;  weight[4:0]= 12; end 
		8'o147:  begin weight[19:15]= 25; weight[14:10]= 6;  weight[9:5]= 19;  weight[4:0]= 0; end 
//angle = 17
		8'o150:  begin weight[19:15]= 17; weight[14:10]= 2;  weight[9:5]= 19;  weight[4:0]= 4; end 
		8'o151:  begin weight[19:15]= 21; weight[14:10]= 6;  weight[9:5]= 23;  weight[4:0]= 8; end 
		8'o152:  begin weight[19:15]= 25; weight[14:10]= 10;  weight[9:5]= 27;  weight[4:0]= 12; end 
		8'o153:  begin weight[19:15]= 29; weight[14:10]= 14;  weight[9:5]= 31;  weight[4:0]= 16; end 
		8'o154:  begin weight[19:15]= 1; weight[14:10]= 18;  weight[9:5]= 3;  weight[4:0]= 20; end 
		8'o155:  begin weight[19:15]= 5; weight[14:10]= 22;  weight[9:5]= 7;  weight[4:0]= 24; end 
		8'o156:  begin weight[19:15]= 9; weight[14:10]= 26;  weight[9:5]= 11;  weight[4:0]= 28; end 
		8'o157:  begin weight[19:15]= 13; weight[14:10]= 30;  weight[9:5]= 15;  weight[4:0]= 0; end 
//angle = 21
		8'o160:  begin weight[19:15]= 21; weight[14:10]= 10;  weight[9:5]= 31;  weight[4:0]= 20; end 
		8'o161:  begin weight[19:15]= 9; weight[14:10]= 30;  weight[9:5]= 19;  weight[4:0]= 8; end 
		8'o162:  begin weight[19:15]= 29; weight[14:10]= 18;  weight[9:5]= 7;  weight[4:0]= 28; end 
		8'o163:  begin weight[19:15]= 17; weight[14:10]= 6;  weight[9:5]= 27;  weight[4:0]= 16; end 
		8'o164:  begin weight[19:15]= 5; weight[14:10]= 26;  weight[9:5]= 15;  weight[4:0]= 4; end 
		8'o165:  begin weight[19:15]= 25; weight[14:10]= 14;  weight[9:5]= 3;  weight[4:0]= 24; end 
		8'o166:  begin weight[19:15]= 13; weight[14:10]= 2;  weight[9:5]= 23;  weight[4:0]= 12; end 
		8'o167:  begin weight[19:15]= 1; weight[14:10]= 22;  weight[9:5]= 11;  weight[4:0]= 0; end 
//angle = 26
		8'o170:  begin weight[19:15]= 26; weight[14:10]= 20;  weight[9:5]= 14;  weight[4:0]= 8; end 
		8'o171:  begin weight[19:15]= 2; weight[14:10]= 28;  weight[9:5]= 22;  weight[4:0]= 16; end 
		8'o172:  begin weight[19:15]= 10; weight[14:10]= 4;  weight[9:5]= 30;  weight[4:0]= 24; end 
		8'o173:  begin weight[19:15]= 18; weight[14:10]= 12;  weight[9:5]= 6;  weight[4:0]= 0; end 
		8'o174:  begin weight[19:15]= 26; weight[14:10]= 20;  weight[9:5]= 14;  weight[4:0]= 8; end 
		8'o175:  begin weight[19:15]= 2; weight[14:10]= 28;  weight[9:5]= 22;  weight[4:0]= 16; end 
		8'o176:  begin weight[19:15]= 10; weight[14:10]= 4;  weight[9:5]= 30;  weight[4:0]= 24; end 
		8'o177:  begin weight[19:15]= 18; weight[14:10]= 12;  weight[9:5]= 6;  weight[4:0]= 0; end 
//angle = 32
		8'o20?:  begin weight[19:15]= 0; weight[14:10]= 0;  weight[9:5]= 0;  weight[4:0]= 0; end 


    default :      // for angle = +- 32;
            weight = 20'd0;
  endcase
     
     
  end
  
  
endmodule
