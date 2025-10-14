
module Coder ( data_in, clk, data_out );
  input [15:0] data_in;
  output [20:0] data_out;
  input clk;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n1;

  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(data_out[16])
         );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(data_out[19])
         );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_out[9]) );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(data_out[18])
         );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(data_out[17])
         );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_out[11]) );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_out[5]) );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_out[2]) );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_out[8]) );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_out[10]) );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_out[4]) );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_out[12]) );
  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(data_out[20])
         );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_out[6]) );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_out[13]) );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(data_out[14])
         );
  XNOR2X1 U3 ( .A(n23), .B(n15), .Y(n4) );
  XNOR2X1 U4 ( .A(data_out[12]), .B(data_out[8]), .Y(n23) );
  XOR2X1 U5 ( .A(data_out[14]), .B(data_out[10]), .Y(n15) );
  XOR2X1 U6 ( .A(data_out[20]), .B(data_out[19]), .Y(n8) );
  XOR2X1 U7 ( .A(data_out[6]), .B(data_out[4]), .Y(n9) );
  XOR2X1 U8 ( .A(data_out[13]), .B(data_out[9]), .Y(n2) );
  XNOR2X1 U9 ( .A(data_out[17]), .B(n15), .Y(n14) );
  XNOR2X1 U10 ( .A(data_out[11]), .B(n9), .Y(n7) );
  XOR2X1 U11 ( .A(n20), .B(n21), .Y(data_out[0]) );
  XOR2X1 U12 ( .A(n19), .B(n9), .Y(n21) );
  XOR2X1 U13 ( .A(n22), .B(n4), .Y(n20) );
  XOR2X1 U14 ( .A(n12), .B(n13), .Y(data_out[1]) );
  XOR2X1 U15 ( .A(n16), .B(n17), .Y(n12) );
  XOR2X1 U16 ( .A(n14), .B(n2), .Y(n13) );
  XOR2X1 U17 ( .A(n5), .B(n6), .Y(data_out[3]) );
  XOR2X1 U18 ( .A(n10), .B(n11), .Y(n5) );
  XOR2X1 U19 ( .A(n7), .B(n8), .Y(n6) );
  XOR2X1 U20 ( .A(n2), .B(n3), .Y(data_out[7]) );
  XOR2X1 U21 ( .A(data_out[11]), .B(n4), .Y(n3) );
  XOR2X1 U22 ( .A(n1), .B(n18), .Y(data_out[15]) );
  INVX1 U23 ( .A(n19), .Y(n1) );
  XOR2X1 U24 ( .A(data_out[17]), .B(n8), .Y(n18) );
  XNOR2X1 U25 ( .A(data_out[18]), .B(data_out[16]), .Y(n19) );
  XOR2X1 U26 ( .A(data_out[6]), .B(data_out[5]), .Y(n17) );
  XOR2X1 U27 ( .A(data_out[5]), .B(data_out[14]), .Y(n11) );
  XNOR2X1 U28 ( .A(data_out[18]), .B(data_out[2]), .Y(n16) );
  XNOR2X1 U29 ( .A(data_out[12]), .B(data_out[13]), .Y(n10) );
  XNOR2X1 U30 ( .A(data_out[20]), .B(data_out[2]), .Y(n22) );
endmodule


module Decoder_DW01_ash_0 ( A, DATA_TC, SH, SH_TC, B );
  input [21:0] A;
  input [4:0] SH;
  output [21:0] B;
  input DATA_TC, SH_TC;
  wire   \ML_int[1][1] , \ML_int[2][1] , \ML_int[2][0] , \ML_int[3][3] ,
         \ML_int[4][4] , \ML_int[4][2] , \ML_int[4][1] , \ML_int[5][15] ,
         \ML_int[5][14] , \ML_int[5][13] , \ML_int[5][12] , \ML_int[5][11] ,
         \ML_int[5][10] , \ML_int[5][9] , \ML_int[5][7] , \ML_int[5][6] ,
         \ML_int[5][5] , \ML_int[5][3] , n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30;
  assign \ML_int[1][1]  = SH[0];
  assign B[15] = \ML_int[5][15] ;
  assign B[14] = \ML_int[5][14] ;
  assign B[13] = \ML_int[5][13] ;
  assign B[12] = \ML_int[5][12] ;
  assign B[11] = \ML_int[5][11] ;
  assign B[10] = \ML_int[5][10] ;
  assign B[9] = \ML_int[5][9] ;
  assign B[7] = \ML_int[5][7] ;
  assign B[6] = \ML_int[5][6] ;
  assign B[5] = \ML_int[5][5] ;
  assign B[3] = \ML_int[5][3] ;

  AND2X2 U3 ( .A(SH[4]), .B(\ML_int[4][2] ), .Y(B[18]) );
  AND2X2 U4 ( .A(SH[4]), .B(n19), .Y(B[19]) );
  AND2X2 U5 ( .A(SH[4]), .B(n21), .Y(B[21]) );
  AND2X2 U6 ( .A(SH[4]), .B(\ML_int[4][1] ), .Y(B[17]) );
  AND2X2 U7 ( .A(SH[4]), .B(\ML_int[4][4] ), .Y(B[20]) );
  AND2X2 U8 ( .A(SH[3]), .B(n22), .Y(n6) );
  AND2X2 U9 ( .A(SH[3]), .B(n16), .Y(n7) );
  AND2X2 U10 ( .A(SH[3]), .B(n15), .Y(n8) );
  AND2X2 U11 ( .A(SH[3]), .B(n13), .Y(n9) );
  AND2X2 U12 ( .A(SH[3]), .B(n14), .Y(n10) );
  AND2X2 U13 ( .A(SH[3]), .B(\ML_int[3][3] ), .Y(n11) );
  AND2X2 U14 ( .A(SH[3]), .B(n20), .Y(n12) );
  INVX1 U15 ( .A(n30), .Y(n22) );
  INVX1 U16 ( .A(n29), .Y(n20) );
  INVX1 U17 ( .A(SH[3]), .Y(n26) );
  INVX1 U18 ( .A(SH[4]), .Y(n25) );
  INVX1 U19 ( .A(SH[2]), .Y(n24) );
  AND2X2 U20 ( .A(SH[2]), .B(\ML_int[2][1] ), .Y(n13) );
  INVX1 U21 ( .A(\ML_int[1][1] ), .Y(n23) );
  AND2X2 U22 ( .A(SH[2]), .B(\ML_int[2][0] ), .Y(n14) );
  AND2X2 U23 ( .A(SH[2]), .B(n17), .Y(n15) );
  AND2X2 U24 ( .A(SH[2]), .B(n18), .Y(n16) );
  AND2X2 U25 ( .A(SH[1]), .B(n23), .Y(n17) );
  AND2X2 U26 ( .A(SH[1]), .B(\ML_int[1][1] ), .Y(n18) );
  INVX1 U27 ( .A(n28), .Y(n19) );
  INVX1 U28 ( .A(n27), .Y(n21) );
  AND2X1 U29 ( .A(n6), .B(n25), .Y(\ML_int[5][9] ) );
  AND3X1 U30 ( .A(n26), .B(n25), .C(n16), .Y(\ML_int[5][7] ) );
  AND3X1 U31 ( .A(n26), .B(n25), .C(n15), .Y(\ML_int[5][6] ) );
  NOR2X1 U32 ( .A(SH[4]), .B(n27), .Y(\ML_int[5][5] ) );
  NOR2X1 U33 ( .A(SH[4]), .B(n28), .Y(\ML_int[5][3] ) );
  AND2X1 U34 ( .A(n7), .B(n25), .Y(\ML_int[5][15] ) );
  AND2X1 U35 ( .A(n8), .B(n25), .Y(\ML_int[5][14] ) );
  AND2X1 U36 ( .A(n9), .B(n25), .Y(\ML_int[5][13] ) );
  AND2X1 U37 ( .A(n10), .B(n25), .Y(\ML_int[5][12] ) );
  AND2X1 U38 ( .A(n11), .B(n25), .Y(\ML_int[5][11] ) );
  AND2X1 U39 ( .A(n12), .B(n25), .Y(\ML_int[5][10] ) );
  NAND2X1 U40 ( .A(n13), .B(n26), .Y(n27) );
  AND2X1 U41 ( .A(n14), .B(n26), .Y(\ML_int[4][4] ) );
  NAND2X1 U42 ( .A(\ML_int[3][3] ), .B(n26), .Y(n28) );
  NOR2X1 U43 ( .A(SH[3]), .B(n29), .Y(\ML_int[4][2] ) );
  NOR2X1 U44 ( .A(SH[3]), .B(n30), .Y(\ML_int[4][1] ) );
  AND2X1 U45 ( .A(n18), .B(n24), .Y(\ML_int[3][3] ) );
  NAND2X1 U46 ( .A(n17), .B(n24), .Y(n29) );
  NAND2X1 U47 ( .A(\ML_int[2][1] ), .B(n24), .Y(n30) );
  NOR2X1 U48 ( .A(n23), .B(SH[1]), .Y(\ML_int[2][1] ) );
  NOR2X1 U49 ( .A(SH[1]), .B(\ML_int[1][1] ), .Y(\ML_int[2][0] ) );
endmodule


module Decoder ( data_in, clk, data_out );
  input [20:0] data_in;
  output [15:0] data_out;
  input clk;
  wire   mask_21, mask_20, mask_19, mask_18, mask_17, mask_7, mask_6, mask_5,
         mask_3, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n1;
  wire   [20:0] data_in_reg;
  wire   [4:0] parity;
  wire   [15:9] mask;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;

  Decoder_DW01_ash_0 sll_49 ( .A({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b1}), .DATA_TC(1'b0), .SH(parity), .SH_TC(1'b0), .B({
        mask_21, mask_20, mask_19, mask_18, mask_17, SYNOPSYS_UNCONNECTED__0, 
        mask, SYNOPSYS_UNCONNECTED__1, mask_7, mask_6, mask_5, 
        SYNOPSYS_UNCONNECTED__2, mask_3, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5}) );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_in_reg[7])
         );
  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(
        data_in_reg[15]) );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_in_reg[3])
         );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_in_reg[1])
         );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_in_reg[0])
         );
  DFFHQX1 \data_in_reg_reg[19]  ( .D(data_in[19]), .CK(clk), .Q(
        data_in_reg[19]) );
  DFFHQX1 \data_in_reg_reg[16]  ( .D(data_in[16]), .CK(clk), .Q(
        data_in_reg[16]) );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(
        data_in_reg[10]) );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_in_reg[4])
         );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_in_reg[8])
         );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_in_reg[9])
         );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(
        data_in_reg[12]) );
  DFFHQX1 \data_in_reg_reg[20]  ( .D(data_in[20]), .CK(clk), .Q(
        data_in_reg[20]) );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_in_reg[2])
         );
  DFFHQX1 \data_in_reg_reg[18]  ( .D(data_in[18]), .CK(clk), .Q(
        data_in_reg[18]) );
  DFFHQX1 \data_in_reg_reg[17]  ( .D(data_in[17]), .CK(clk), .Q(
        data_in_reg[17]) );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(
        data_in_reg[14]) );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(
        data_in_reg[13]) );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_in_reg[6])
         );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_in_reg[5])
         );
  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(
        data_in_reg[11]) );
  XOR2X1 U3 ( .A(n8), .B(n21), .Y(n20) );
  XOR2X1 U4 ( .A(n4), .B(n14), .Y(n13) );
  XNOR2X1 U5 ( .A(n5), .B(n9), .Y(n26) );
  XOR2X1 U6 ( .A(n6), .B(n7), .Y(parity[3]) );
  XOR2X1 U7 ( .A(data_in_reg[7]), .B(data_in_reg[11]), .Y(n6) );
  XOR2X1 U8 ( .A(n8), .B(n9), .Y(n7) );
  XOR2X1 U9 ( .A(n2), .B(n3), .Y(parity[4]) );
  XOR2X1 U10 ( .A(data_in_reg[17]), .B(data_in_reg[15]), .Y(n2) );
  XNOR2X1 U11 ( .A(n4), .B(n1), .Y(n3) );
  INVX1 U12 ( .A(n5), .Y(n1) );
  XOR2X1 U13 ( .A(n10), .B(n11), .Y(parity[2]) );
  XOR2X1 U14 ( .A(n15), .B(n16), .Y(n10) );
  XOR2X1 U15 ( .A(n12), .B(n13), .Y(n11) );
  XOR2X1 U16 ( .A(data_in_reg[5]), .B(data_in_reg[3]), .Y(n15) );
  XNOR2X1 U17 ( .A(n27), .B(n21), .Y(n9) );
  XNOR2X1 U18 ( .A(data_in_reg[12]), .B(data_in_reg[8]), .Y(n27) );
  XOR2X1 U19 ( .A(data_in_reg[4]), .B(data_in_reg[6]), .Y(n14) );
  XOR2X1 U20 ( .A(data_in_reg[10]), .B(data_in_reg[14]), .Y(n21) );
  XOR2X1 U21 ( .A(n24), .B(n25), .Y(parity[0]) );
  XOR2X1 U22 ( .A(n28), .B(data_in_reg[0]), .Y(n24) );
  XOR2X1 U23 ( .A(n26), .B(n14), .Y(n25) );
  XNOR2X1 U24 ( .A(data_in_reg[20]), .B(data_in_reg[2]), .Y(n28) );
  XOR2X1 U25 ( .A(n17), .B(n18), .Y(parity[1]) );
  XOR2X1 U26 ( .A(n22), .B(n23), .Y(n17) );
  XOR2X1 U27 ( .A(n19), .B(n20), .Y(n18) );
  XOR2X1 U28 ( .A(data_in_reg[6]), .B(data_in_reg[5]), .Y(n22) );
  XOR2X1 U29 ( .A(data_in_reg[16]), .B(data_in_reg[18]), .Y(n5) );
  XOR2X1 U30 ( .A(data_in_reg[13]), .B(data_in_reg[9]), .Y(n8) );
  XOR2X1 U31 ( .A(data_in_reg[19]), .B(data_in_reg[20]), .Y(n4) );
  XOR2X1 U32 ( .A(data_in_reg[2]), .B(data_in_reg[1]), .Y(n23) );
  XOR2X1 U33 ( .A(data_in_reg[14]), .B(data_in_reg[13]), .Y(n16) );
  XOR2X1 U34 ( .A(data_in_reg[18]), .B(data_in_reg[17]), .Y(n19) );
  XOR2X1 U35 ( .A(data_in_reg[12]), .B(data_in_reg[11]), .Y(n12) );
  XOR2X1 U36 ( .A(mask[12]), .B(data_in_reg[11]), .Y(data_out[7]) );
  XOR2X1 U37 ( .A(mask_3), .B(data_in_reg[2]), .Y(data_out[0]) );
  XOR2X1 U38 ( .A(mask_6), .B(data_in_reg[5]), .Y(data_out[2]) );
  XOR2X1 U39 ( .A(mask_7), .B(data_in_reg[6]), .Y(data_out[3]) );
  XOR2X1 U40 ( .A(mask[14]), .B(data_in_reg[13]), .Y(data_out[9]) );
  XOR2X1 U41 ( .A(mask[15]), .B(data_in_reg[14]), .Y(data_out[10]) );
  XOR2X1 U42 ( .A(mask_18), .B(data_in_reg[17]), .Y(data_out[12]) );
  XOR2X1 U43 ( .A(mask_19), .B(data_in_reg[18]), .Y(data_out[13]) );
  XOR2X1 U44 ( .A(mask_21), .B(data_in_reg[20]), .Y(data_out[15]) );
  XOR2X1 U45 ( .A(mask[13]), .B(data_in_reg[12]), .Y(data_out[8]) );
  XOR2X1 U46 ( .A(mask[9]), .B(data_in_reg[8]), .Y(data_out[4]) );
  XOR2X1 U47 ( .A(mask[10]), .B(data_in_reg[9]), .Y(data_out[5]) );
  XOR2X1 U48 ( .A(mask_5), .B(data_in_reg[4]), .Y(data_out[1]) );
  XOR2X1 U49 ( .A(mask[11]), .B(data_in_reg[10]), .Y(data_out[6]) );
  XOR2X1 U50 ( .A(mask_17), .B(data_in_reg[16]), .Y(data_out[11]) );
  XOR2X1 U51 ( .A(mask_20), .B(data_in_reg[19]), .Y(data_out[14]) );
endmodule


module Codec ( data_in, bit_flip, clk, data_out );
  input [15:0] data_in;
  input [20:0] bit_flip;
  output [15:0] data_out;
  input clk;

  wire   [20:0] data_coded;
  wire   [20:0] data_augmented;

  Coder coder ( .data_in(data_in), .clk(clk), .data_out(data_coded) );
  Decoder decoder ( .data_in(data_augmented), .clk(clk), .data_out(data_out)
         );
  XOR2X1 U22 ( .A(data_coded[0]), .B(bit_flip[0]), .Y(data_augmented[0]) );
  XOR2X1 U23 ( .A(data_coded[1]), .B(bit_flip[1]), .Y(data_augmented[1]) );
  XOR2X1 U24 ( .A(data_coded[3]), .B(bit_flip[3]), .Y(data_augmented[3]) );
  XOR2X1 U25 ( .A(data_coded[7]), .B(bit_flip[7]), .Y(data_augmented[7]) );
  XOR2X1 U26 ( .A(data_coded[15]), .B(bit_flip[15]), .Y(data_augmented[15]) );
  XOR2X1 U27 ( .A(data_coded[2]), .B(bit_flip[2]), .Y(data_augmented[2]) );
  XOR2X1 U28 ( .A(data_coded[4]), .B(bit_flip[4]), .Y(data_augmented[4]) );
  XOR2X1 U29 ( .A(data_coded[5]), .B(bit_flip[5]), .Y(data_augmented[5]) );
  XOR2X1 U30 ( .A(data_coded[6]), .B(bit_flip[6]), .Y(data_augmented[6]) );
  XOR2X1 U31 ( .A(data_coded[8]), .B(bit_flip[8]), .Y(data_augmented[8]) );
  XOR2X1 U32 ( .A(data_coded[9]), .B(bit_flip[9]), .Y(data_augmented[9]) );
  XOR2X1 U33 ( .A(data_coded[10]), .B(bit_flip[10]), .Y(data_augmented[10]) );
  XOR2X1 U34 ( .A(data_coded[11]), .B(bit_flip[11]), .Y(data_augmented[11]) );
  XOR2X1 U35 ( .A(data_coded[12]), .B(bit_flip[12]), .Y(data_augmented[12]) );
  XOR2X1 U36 ( .A(data_coded[13]), .B(bit_flip[13]), .Y(data_augmented[13]) );
  XOR2X1 U37 ( .A(data_coded[14]), .B(bit_flip[14]), .Y(data_augmented[14]) );
  XOR2X1 U38 ( .A(data_coded[16]), .B(bit_flip[16]), .Y(data_augmented[16]) );
  XOR2X1 U39 ( .A(data_coded[17]), .B(bit_flip[17]), .Y(data_augmented[17]) );
  XOR2X1 U40 ( .A(data_coded[18]), .B(bit_flip[18]), .Y(data_augmented[18]) );
  XOR2X1 U41 ( .A(data_coded[19]), .B(bit_flip[19]), .Y(data_augmented[19]) );
  XOR2X1 U42 ( .A(data_coded[20]), .B(bit_flip[20]), .Y(data_augmented[20]) );
endmodule

