
module Coder ( data_in, clk, data_out );
  input [15:0] data_in;
  output [47:0] data_out;
  input clk;

  assign data_out[15] = data_out[47];
  assign data_out[31] = data_out[47];
  assign data_out[14] = data_out[46];
  assign data_out[30] = data_out[46];
  assign data_out[13] = data_out[45];
  assign data_out[29] = data_out[45];
  assign data_out[12] = data_out[44];
  assign data_out[28] = data_out[44];
  assign data_out[11] = data_out[43];
  assign data_out[27] = data_out[43];
  assign data_out[10] = data_out[42];
  assign data_out[26] = data_out[42];
  assign data_out[9] = data_out[41];
  assign data_out[25] = data_out[41];
  assign data_out[8] = data_out[40];
  assign data_out[24] = data_out[40];
  assign data_out[7] = data_out[39];
  assign data_out[23] = data_out[39];
  assign data_out[6] = data_out[38];
  assign data_out[22] = data_out[38];
  assign data_out[5] = data_out[37];
  assign data_out[21] = data_out[37];
  assign data_out[4] = data_out[36];
  assign data_out[20] = data_out[36];
  assign data_out[3] = data_out[35];
  assign data_out[19] = data_out[35];
  assign data_out[2] = data_out[34];
  assign data_out[18] = data_out[34];
  assign data_out[1] = data_out[33];
  assign data_out[17] = data_out[33];
  assign data_out[0] = data_out[32];
  assign data_out[16] = data_out[32];

  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(data_out[47])
         );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(data_out[46])
         );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(data_out[45])
         );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(data_out[44])
         );
  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(data_out[43])
         );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(data_out[42])
         );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_out[41]) );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_out[40]) );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_out[39]) );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_out[38]) );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_out[37]) );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_out[36]) );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_out[35]) );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_out[34]) );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_out[33]) );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_out[32]) );
endmodule


module Voter_data_len16 ( a, b, c, out );
  input [15:0] a;
  input [15:0] b;
  input [15:0] c;
  output [15:0] out;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;

  OAI2BB1X1 U1 ( .A0N(a[0]), .A1N(b[0]), .B0(n16), .Y(out[0]) );
  OAI21XL U2 ( .A0(a[0]), .A1(b[0]), .B0(c[0]), .Y(n16) );
  OAI2BB1X1 U3 ( .A0N(a[1]), .A1N(b[1]), .B0(n9), .Y(out[1]) );
  OAI21XL U4 ( .A0(a[1]), .A1(b[1]), .B0(c[1]), .Y(n9) );
  OAI2BB1X1 U5 ( .A0N(a[2]), .A1N(b[2]), .B0(n8), .Y(out[2]) );
  OAI21XL U6 ( .A0(a[2]), .A1(b[2]), .B0(c[2]), .Y(n8) );
  OAI2BB1X1 U7 ( .A0N(a[3]), .A1N(b[3]), .B0(n7), .Y(out[3]) );
  OAI21XL U8 ( .A0(a[3]), .A1(b[3]), .B0(c[3]), .Y(n7) );
  OAI2BB1X1 U9 ( .A0N(a[4]), .A1N(b[4]), .B0(n6), .Y(out[4]) );
  OAI21XL U10 ( .A0(a[4]), .A1(b[4]), .B0(c[4]), .Y(n6) );
  OAI2BB1X1 U11 ( .A0N(a[5]), .A1N(b[5]), .B0(n5), .Y(out[5]) );
  OAI21XL U12 ( .A0(a[5]), .A1(b[5]), .B0(c[5]), .Y(n5) );
  OAI2BB1X1 U13 ( .A0N(a[6]), .A1N(b[6]), .B0(n4), .Y(out[6]) );
  OAI21XL U14 ( .A0(a[6]), .A1(b[6]), .B0(c[6]), .Y(n4) );
  OAI2BB1X1 U15 ( .A0N(a[7]), .A1N(b[7]), .B0(n3), .Y(out[7]) );
  OAI21XL U16 ( .A0(a[7]), .A1(b[7]), .B0(c[7]), .Y(n3) );
  OAI2BB1X1 U17 ( .A0N(a[8]), .A1N(b[8]), .B0(n2), .Y(out[8]) );
  OAI21XL U18 ( .A0(a[8]), .A1(b[8]), .B0(c[8]), .Y(n2) );
  OAI2BB1X1 U19 ( .A0N(a[9]), .A1N(b[9]), .B0(n1), .Y(out[9]) );
  OAI21XL U20 ( .A0(a[9]), .A1(b[9]), .B0(c[9]), .Y(n1) );
  OAI2BB1X1 U21 ( .A0N(a[10]), .A1N(b[10]), .B0(n15), .Y(out[10]) );
  OAI21XL U22 ( .A0(a[10]), .A1(b[10]), .B0(c[10]), .Y(n15) );
  OAI2BB1X1 U23 ( .A0N(a[11]), .A1N(b[11]), .B0(n14), .Y(out[11]) );
  OAI21XL U24 ( .A0(a[11]), .A1(b[11]), .B0(c[11]), .Y(n14) );
  OAI2BB1X1 U25 ( .A0N(a[12]), .A1N(b[12]), .B0(n13), .Y(out[12]) );
  OAI21XL U26 ( .A0(a[12]), .A1(b[12]), .B0(c[12]), .Y(n13) );
  OAI2BB1X1 U27 ( .A0N(a[13]), .A1N(b[13]), .B0(n12), .Y(out[13]) );
  OAI21XL U28 ( .A0(a[13]), .A1(b[13]), .B0(c[13]), .Y(n12) );
  OAI2BB1X1 U29 ( .A0N(a[14]), .A1N(b[14]), .B0(n11), .Y(out[14]) );
  OAI21XL U30 ( .A0(a[14]), .A1(b[14]), .B0(c[14]), .Y(n11) );
  OAI2BB1X1 U31 ( .A0N(a[15]), .A1N(b[15]), .B0(n10), .Y(out[15]) );
  OAI21XL U32 ( .A0(a[15]), .A1(b[15]), .B0(c[15]), .Y(n10) );
endmodule


module Decoder ( data_in, clk, data_out );
  input [47:0] data_in;
  output [15:0] data_out;
  input clk;

  wire   [47:0] data_in_reg;

  Voter_data_len16 voter ( .a(data_in_reg[15:0]), .b(data_in_reg[31:16]), .c(
        data_in_reg[47:32]), .out(data_out) );
  DFFHQX1 \data_in_reg_reg[47]  ( .D(data_in[47]), .CK(clk), .Q(
        data_in_reg[47]) );
  DFFHQX1 \data_in_reg_reg[46]  ( .D(data_in[46]), .CK(clk), .Q(
        data_in_reg[46]) );
  DFFHQX1 \data_in_reg_reg[45]  ( .D(data_in[45]), .CK(clk), .Q(
        data_in_reg[45]) );
  DFFHQX1 \data_in_reg_reg[44]  ( .D(data_in[44]), .CK(clk), .Q(
        data_in_reg[44]) );
  DFFHQX1 \data_in_reg_reg[43]  ( .D(data_in[43]), .CK(clk), .Q(
        data_in_reg[43]) );
  DFFHQX1 \data_in_reg_reg[42]  ( .D(data_in[42]), .CK(clk), .Q(
        data_in_reg[42]) );
  DFFHQX1 \data_in_reg_reg[41]  ( .D(data_in[41]), .CK(clk), .Q(
        data_in_reg[41]) );
  DFFHQX1 \data_in_reg_reg[40]  ( .D(data_in[40]), .CK(clk), .Q(
        data_in_reg[40]) );
  DFFHQX1 \data_in_reg_reg[39]  ( .D(data_in[39]), .CK(clk), .Q(
        data_in_reg[39]) );
  DFFHQX1 \data_in_reg_reg[38]  ( .D(data_in[38]), .CK(clk), .Q(
        data_in_reg[38]) );
  DFFHQX1 \data_in_reg_reg[37]  ( .D(data_in[37]), .CK(clk), .Q(
        data_in_reg[37]) );
  DFFHQX1 \data_in_reg_reg[36]  ( .D(data_in[36]), .CK(clk), .Q(
        data_in_reg[36]) );
  DFFHQX1 \data_in_reg_reg[35]  ( .D(data_in[35]), .CK(clk), .Q(
        data_in_reg[35]) );
  DFFHQX1 \data_in_reg_reg[34]  ( .D(data_in[34]), .CK(clk), .Q(
        data_in_reg[34]) );
  DFFHQX1 \data_in_reg_reg[33]  ( .D(data_in[33]), .CK(clk), .Q(
        data_in_reg[33]) );
  DFFHQX1 \data_in_reg_reg[32]  ( .D(data_in[32]), .CK(clk), .Q(
        data_in_reg[32]) );
  DFFHQX1 \data_in_reg_reg[31]  ( .D(data_in[31]), .CK(clk), .Q(
        data_in_reg[31]) );
  DFFHQX1 \data_in_reg_reg[30]  ( .D(data_in[30]), .CK(clk), .Q(
        data_in_reg[30]) );
  DFFHQX1 \data_in_reg_reg[29]  ( .D(data_in[29]), .CK(clk), .Q(
        data_in_reg[29]) );
  DFFHQX1 \data_in_reg_reg[28]  ( .D(data_in[28]), .CK(clk), .Q(
        data_in_reg[28]) );
  DFFHQX1 \data_in_reg_reg[27]  ( .D(data_in[27]), .CK(clk), .Q(
        data_in_reg[27]) );
  DFFHQX1 \data_in_reg_reg[26]  ( .D(data_in[26]), .CK(clk), .Q(
        data_in_reg[26]) );
  DFFHQX1 \data_in_reg_reg[25]  ( .D(data_in[25]), .CK(clk), .Q(
        data_in_reg[25]) );
  DFFHQX1 \data_in_reg_reg[24]  ( .D(data_in[24]), .CK(clk), .Q(
        data_in_reg[24]) );
  DFFHQX1 \data_in_reg_reg[23]  ( .D(data_in[23]), .CK(clk), .Q(
        data_in_reg[23]) );
  DFFHQX1 \data_in_reg_reg[22]  ( .D(data_in[22]), .CK(clk), .Q(
        data_in_reg[22]) );
  DFFHQX1 \data_in_reg_reg[21]  ( .D(data_in[21]), .CK(clk), .Q(
        data_in_reg[21]) );
  DFFHQX1 \data_in_reg_reg[20]  ( .D(data_in[20]), .CK(clk), .Q(
        data_in_reg[20]) );
  DFFHQX1 \data_in_reg_reg[19]  ( .D(data_in[19]), .CK(clk), .Q(
        data_in_reg[19]) );
  DFFHQX1 \data_in_reg_reg[18]  ( .D(data_in[18]), .CK(clk), .Q(
        data_in_reg[18]) );
  DFFHQX1 \data_in_reg_reg[17]  ( .D(data_in[17]), .CK(clk), .Q(
        data_in_reg[17]) );
  DFFHQX1 \data_in_reg_reg[16]  ( .D(data_in[16]), .CK(clk), .Q(
        data_in_reg[16]) );
  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(
        data_in_reg[15]) );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(
        data_in_reg[14]) );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(
        data_in_reg[13]) );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(
        data_in_reg[12]) );
  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(
        data_in_reg[11]) );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(
        data_in_reg[10]) );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_in_reg[9])
         );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_in_reg[8])
         );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_in_reg[7])
         );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_in_reg[6])
         );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_in_reg[5])
         );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_in_reg[4])
         );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_in_reg[3])
         );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_in_reg[2])
         );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_in_reg[1])
         );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_in_reg[0])
         );
endmodule


module Codec ( data_in, bit_flip, clk, data_out );
  input [15:0] data_in;
  input [47:0] bit_flip;
  output [15:0] data_out;
  input clk;

  wire   [47:0] data_coded;
  wire   [47:0] data_augmented;

  Coder coder ( .data_in(data_in), .clk(clk), .data_out(data_coded) );
  Decoder decoder ( .data_in(data_augmented), .clk(clk), .data_out(data_out)
         );
  XOR2X1 U49 ( .A(data_coded[0]), .B(bit_flip[0]), .Y(data_augmented[0]) );
  XOR2X1 U50 ( .A(data_coded[1]), .B(bit_flip[1]), .Y(data_augmented[1]) );
  XOR2X1 U51 ( .A(data_coded[2]), .B(bit_flip[2]), .Y(data_augmented[2]) );
  XOR2X1 U52 ( .A(data_coded[3]), .B(bit_flip[3]), .Y(data_augmented[3]) );
  XOR2X1 U53 ( .A(data_coded[4]), .B(bit_flip[4]), .Y(data_augmented[4]) );
  XOR2X1 U54 ( .A(data_coded[5]), .B(bit_flip[5]), .Y(data_augmented[5]) );
  XOR2X1 U55 ( .A(data_coded[6]), .B(bit_flip[6]), .Y(data_augmented[6]) );
  XOR2X1 U56 ( .A(data_coded[7]), .B(bit_flip[7]), .Y(data_augmented[7]) );
  XOR2X1 U57 ( .A(data_coded[8]), .B(bit_flip[8]), .Y(data_augmented[8]) );
  XOR2X1 U58 ( .A(data_coded[9]), .B(bit_flip[9]), .Y(data_augmented[9]) );
  XOR2X1 U59 ( .A(data_coded[10]), .B(bit_flip[10]), .Y(data_augmented[10]) );
  XOR2X1 U60 ( .A(data_coded[11]), .B(bit_flip[11]), .Y(data_augmented[11]) );
  XOR2X1 U61 ( .A(data_coded[12]), .B(bit_flip[12]), .Y(data_augmented[12]) );
  XOR2X1 U62 ( .A(data_coded[13]), .B(bit_flip[13]), .Y(data_augmented[13]) );
  XOR2X1 U63 ( .A(data_coded[14]), .B(bit_flip[14]), .Y(data_augmented[14]) );
  XOR2X1 U64 ( .A(data_coded[15]), .B(bit_flip[15]), .Y(data_augmented[15]) );
  XOR2X1 U65 ( .A(data_coded[16]), .B(bit_flip[16]), .Y(data_augmented[16]) );
  XOR2X1 U66 ( .A(data_coded[17]), .B(bit_flip[17]), .Y(data_augmented[17]) );
  XOR2X1 U67 ( .A(data_coded[18]), .B(bit_flip[18]), .Y(data_augmented[18]) );
  XOR2X1 U68 ( .A(data_coded[19]), .B(bit_flip[19]), .Y(data_augmented[19]) );
  XOR2X1 U69 ( .A(data_coded[20]), .B(bit_flip[20]), .Y(data_augmented[20]) );
  XOR2X1 U70 ( .A(data_coded[21]), .B(bit_flip[21]), .Y(data_augmented[21]) );
  XOR2X1 U71 ( .A(data_coded[22]), .B(bit_flip[22]), .Y(data_augmented[22]) );
  XOR2X1 U72 ( .A(data_coded[23]), .B(bit_flip[23]), .Y(data_augmented[23]) );
  XOR2X1 U73 ( .A(data_coded[24]), .B(bit_flip[24]), .Y(data_augmented[24]) );
  XOR2X1 U74 ( .A(data_coded[25]), .B(bit_flip[25]), .Y(data_augmented[25]) );
  XOR2X1 U75 ( .A(data_coded[26]), .B(bit_flip[26]), .Y(data_augmented[26]) );
  XOR2X1 U76 ( .A(data_coded[27]), .B(bit_flip[27]), .Y(data_augmented[27]) );
  XOR2X1 U77 ( .A(data_coded[28]), .B(bit_flip[28]), .Y(data_augmented[28]) );
  XOR2X1 U78 ( .A(data_coded[29]), .B(bit_flip[29]), .Y(data_augmented[29]) );
  XOR2X1 U79 ( .A(data_coded[30]), .B(bit_flip[30]), .Y(data_augmented[30]) );
  XOR2X1 U80 ( .A(data_coded[31]), .B(bit_flip[31]), .Y(data_augmented[31]) );
  XOR2X1 U81 ( .A(data_coded[32]), .B(bit_flip[32]), .Y(data_augmented[32]) );
  XOR2X1 U82 ( .A(data_coded[33]), .B(bit_flip[33]), .Y(data_augmented[33]) );
  XOR2X1 U83 ( .A(data_coded[34]), .B(bit_flip[34]), .Y(data_augmented[34]) );
  XOR2X1 U84 ( .A(data_coded[35]), .B(bit_flip[35]), .Y(data_augmented[35]) );
  XOR2X1 U85 ( .A(data_coded[36]), .B(bit_flip[36]), .Y(data_augmented[36]) );
  XOR2X1 U86 ( .A(data_coded[37]), .B(bit_flip[37]), .Y(data_augmented[37]) );
  XOR2X1 U87 ( .A(data_coded[38]), .B(bit_flip[38]), .Y(data_augmented[38]) );
  XOR2X1 U88 ( .A(data_coded[39]), .B(bit_flip[39]), .Y(data_augmented[39]) );
  XOR2X1 U89 ( .A(data_coded[40]), .B(bit_flip[40]), .Y(data_augmented[40]) );
  XOR2X1 U90 ( .A(data_coded[41]), .B(bit_flip[41]), .Y(data_augmented[41]) );
  XOR2X1 U91 ( .A(data_coded[42]), .B(bit_flip[42]), .Y(data_augmented[42]) );
  XOR2X1 U92 ( .A(data_coded[43]), .B(bit_flip[43]), .Y(data_augmented[43]) );
  XOR2X1 U93 ( .A(data_coded[44]), .B(bit_flip[44]), .Y(data_augmented[44]) );
  XOR2X1 U94 ( .A(data_coded[45]), .B(bit_flip[45]), .Y(data_augmented[45]) );
  XOR2X1 U95 ( .A(data_coded[46]), .B(bit_flip[46]), .Y(data_augmented[46]) );
  XOR2X1 U96 ( .A(data_coded[47]), .B(bit_flip[47]), .Y(data_augmented[47]) );
endmodule

