
module Coder ( data_in, clk, data_out );
  input [15:0] data_in;
  output [23:0] data_out;
  input clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
;

  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(data_out[15])
         );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_out[9]) );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_out[7]) );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_out[1]) );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(data_out[14])
         );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(data_out[13])
         );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(data_out[12])
         );
  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(data_out[11])
         );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_out[8]) );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_out[6]) );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_out[5]) );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_out[3]) );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(data_out[10])
         );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_out[4]) );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_out[2]) );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_out[0]) );
  XOR2X1 U3 ( .A(n15), .B(n16), .Y(data_out[16]) );
  XOR2X1 U4 ( .A(data_out[3]), .B(data_out[2]), .Y(n15) );
  XOR2X1 U5 ( .A(data_out[1]), .B(data_out[0]), .Y(n16) );
  XOR2X1 U6 ( .A(n13), .B(n14), .Y(data_out[17]) );
  XOR2X1 U7 ( .A(data_out[7]), .B(data_out[6]), .Y(n13) );
  XOR2X1 U8 ( .A(data_out[5]), .B(data_out[4]), .Y(n14) );
  XOR2X1 U9 ( .A(n11), .B(n12), .Y(data_out[18]) );
  XOR2X1 U10 ( .A(data_out[9]), .B(data_out[8]), .Y(n11) );
  XOR2X1 U11 ( .A(data_out[11]), .B(data_out[10]), .Y(n12) );
  XOR2X1 U12 ( .A(n9), .B(n10), .Y(data_out[19]) );
  XOR2X1 U13 ( .A(data_out[15]), .B(data_out[14]), .Y(n9) );
  XOR2X1 U14 ( .A(data_out[13]), .B(data_out[12]), .Y(n10) );
  XOR2X1 U15 ( .A(n7), .B(n8), .Y(data_out[20]) );
  XOR2X1 U16 ( .A(data_out[8]), .B(data_out[4]), .Y(n7) );
  XOR2X1 U17 ( .A(data_out[12]), .B(data_out[0]), .Y(n8) );
  XOR2X1 U18 ( .A(n5), .B(n6), .Y(data_out[21]) );
  XOR2X1 U19 ( .A(data_out[9]), .B(data_out[5]), .Y(n5) );
  XOR2X1 U20 ( .A(data_out[1]), .B(data_out[13]), .Y(n6) );
  XOR2X1 U21 ( .A(n3), .B(n4), .Y(data_out[22]) );
  XOR2X1 U22 ( .A(data_out[6]), .B(data_out[2]), .Y(n3) );
  XOR2X1 U23 ( .A(data_out[14]), .B(data_out[10]), .Y(n4) );
  XOR2X1 U24 ( .A(n1), .B(n2), .Y(data_out[23]) );
  XOR2X1 U25 ( .A(data_out[7]), .B(data_out[3]), .Y(n1) );
  XOR2X1 U26 ( .A(data_out[15]), .B(data_out[11]), .Y(n2) );
endmodule


module Decoder ( data_in, clk, data_out );
  input [23:0] data_in;
  output [15:0] data_out;
  input clk;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51;
  wire   [23:0] data_in_reg;

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
  DFFHQX1 \data_in_reg_reg[16]  ( .D(data_in[16]), .CK(clk), .Q(
        data_in_reg[16]) );
  DFFHQX1 \data_in_reg_reg[17]  ( .D(data_in[17]), .CK(clk), .Q(
        data_in_reg[17]) );
  DFFHQX1 \data_in_reg_reg[13]  ( .D(data_in[13]), .CK(clk), .Q(
        data_in_reg[13]) );
  DFFHQX1 \data_in_reg_reg[10]  ( .D(data_in[10]), .CK(clk), .Q(
        data_in_reg[10]) );
  DFFHQX1 \data_in_reg_reg[9]  ( .D(data_in[9]), .CK(clk), .Q(data_in_reg[9])
         );
  DFFHQX1 \data_in_reg_reg[7]  ( .D(data_in[7]), .CK(clk), .Q(data_in_reg[7])
         );
  DFFHQX1 \data_in_reg_reg[15]  ( .D(data_in[15]), .CK(clk), .Q(
        data_in_reg[15]) );
  DFFHQX1 \data_in_reg_reg[0]  ( .D(data_in[0]), .CK(clk), .Q(data_in_reg[0])
         );
  DFFHQX1 \data_in_reg_reg[14]  ( .D(data_in[14]), .CK(clk), .Q(
        data_in_reg[14]) );
  DFFHQX1 \data_in_reg_reg[5]  ( .D(data_in[5]), .CK(clk), .Q(data_in_reg[5])
         );
  DFFHQX1 \data_in_reg_reg[1]  ( .D(data_in[1]), .CK(clk), .Q(data_in_reg[1])
         );
  DFFHQX1 \data_in_reg_reg[11]  ( .D(data_in[11]), .CK(clk), .Q(
        data_in_reg[11]) );
  DFFHQX1 \data_in_reg_reg[8]  ( .D(data_in[8]), .CK(clk), .Q(data_in_reg[8])
         );
  DFFHQX1 \data_in_reg_reg[6]  ( .D(data_in[6]), .CK(clk), .Q(data_in_reg[6])
         );
  DFFHQX1 \data_in_reg_reg[4]  ( .D(data_in[4]), .CK(clk), .Q(data_in_reg[4])
         );
  DFFHQX1 \data_in_reg_reg[3]  ( .D(data_in[3]), .CK(clk), .Q(data_in_reg[3])
         );
  DFFHQX1 \data_in_reg_reg[12]  ( .D(data_in[12]), .CK(clk), .Q(
        data_in_reg[12]) );
  DFFHQX1 \data_in_reg_reg[2]  ( .D(data_in[2]), .CK(clk), .Q(data_in_reg[2])
         );
  XOR2X1 U3 ( .A(n3), .B(n45), .Y(data_out[0]) );
  NAND2X1 U4 ( .A(n20), .B(n8), .Y(n45) );
  XOR2X1 U5 ( .A(n2), .B(n26), .Y(data_out[13]) );
  NAND2X1 U6 ( .A(n24), .B(n6), .Y(n26) );
  XOR2X1 U7 ( .A(n1), .B(n23), .Y(data_out[15]) );
  NAND2X1 U8 ( .A(n24), .B(n10), .Y(n23) );
  XNOR2X1 U9 ( .A(n49), .B(n50), .Y(n20) );
  XNOR2X1 U10 ( .A(data_in_reg[1]), .B(n51), .Y(n49) );
  XOR2X1 U11 ( .A(data_in_reg[16]), .B(data_in_reg[0]), .Y(n50) );
  XOR2X1 U12 ( .A(data_in_reg[3]), .B(data_in_reg[2]), .Y(n51) );
  XNOR2X1 U13 ( .A(n31), .B(n32), .Y(n24) );
  XNOR2X1 U14 ( .A(data_in_reg[14]), .B(n33), .Y(n31) );
  XOR2X1 U15 ( .A(data_in_reg[13]), .B(data_in_reg[12]), .Y(n32) );
  XOR2X1 U16 ( .A(data_in_reg[19]), .B(data_in_reg[15]), .Y(n33) );
  XNOR2X1 U17 ( .A(n16), .B(n17), .Y(n11) );
  XNOR2X1 U18 ( .A(data_in_reg[5]), .B(n18), .Y(n16) );
  XOR2X1 U19 ( .A(data_in_reg[4]), .B(data_in_reg[17]), .Y(n17) );
  XOR2X1 U20 ( .A(data_in_reg[7]), .B(data_in_reg[6]), .Y(n18) );
  XNOR2X1 U21 ( .A(n42), .B(n43), .Y(n13) );
  XNOR2X1 U22 ( .A(data_in_reg[10]), .B(data_in_reg[14]), .Y(n42) );
  XOR2X1 U23 ( .A(data_in_reg[22]), .B(n44), .Y(n43) );
  XOR2X1 U24 ( .A(data_in_reg[6]), .B(data_in_reg[2]), .Y(n44) );
  XNOR2X1 U25 ( .A(n35), .B(n36), .Y(n10) );
  XOR2X1 U26 ( .A(data_in_reg[11]), .B(n1), .Y(n35) );
  XOR2X1 U27 ( .A(data_in_reg[23]), .B(n37), .Y(n36) );
  XOR2X1 U28 ( .A(data_in_reg[7]), .B(data_in_reg[3]), .Y(n37) );
  XNOR2X1 U29 ( .A(n39), .B(n40), .Y(n5) );
  XNOR2X1 U30 ( .A(data_in_reg[10]), .B(data_in_reg[11]), .Y(n39) );
  XOR2X1 U31 ( .A(data_in_reg[18]), .B(n41), .Y(n40) );
  XOR2X1 U32 ( .A(data_in_reg[9]), .B(data_in_reg[8]), .Y(n41) );
  XNOR2X1 U33 ( .A(n46), .B(n47), .Y(n8) );
  XOR2X1 U34 ( .A(n3), .B(data_in_reg[12]), .Y(n46) );
  XOR2X1 U35 ( .A(data_in_reg[20]), .B(n48), .Y(n47) );
  XOR2X1 U36 ( .A(data_in_reg[8]), .B(data_in_reg[4]), .Y(n48) );
  XNOR2X1 U37 ( .A(n27), .B(n28), .Y(n6) );
  XOR2X1 U38 ( .A(n2), .B(data_in_reg[1]), .Y(n27) );
  XOR2X1 U39 ( .A(data_in_reg[21]), .B(n29), .Y(n28) );
  XOR2X1 U40 ( .A(data_in_reg[9]), .B(data_in_reg[5]), .Y(n29) );
  INVX1 U41 ( .A(data_in_reg[15]), .Y(n1) );
  INVX1 U42 ( .A(data_in_reg[0]), .Y(n3) );
  INVX1 U43 ( .A(data_in_reg[13]), .Y(n2) );
  XNOR2X1 U44 ( .A(data_in_reg[1]), .B(n22), .Y(data_out[1]) );
  NAND2X1 U45 ( .A(n20), .B(n6), .Y(n22) );
  XNOR2X1 U46 ( .A(data_in_reg[2]), .B(n21), .Y(data_out[2]) );
  NAND2X1 U47 ( .A(n20), .B(n13), .Y(n21) );
  XNOR2X1 U48 ( .A(data_in_reg[3]), .B(n19), .Y(data_out[3]) );
  NAND2X1 U49 ( .A(n20), .B(n10), .Y(n19) );
  XNOR2X1 U50 ( .A(data_in_reg[4]), .B(n15), .Y(data_out[4]) );
  NAND2X1 U51 ( .A(n11), .B(n8), .Y(n15) );
  XNOR2X1 U52 ( .A(data_in_reg[5]), .B(n14), .Y(data_out[5]) );
  NAND2X1 U53 ( .A(n11), .B(n6), .Y(n14) );
  XNOR2X1 U54 ( .A(data_in_reg[6]), .B(n12), .Y(data_out[6]) );
  NAND2X1 U55 ( .A(n13), .B(n11), .Y(n12) );
  XNOR2X1 U56 ( .A(data_in_reg[7]), .B(n9), .Y(data_out[7]) );
  NAND2X1 U57 ( .A(n10), .B(n11), .Y(n9) );
  XNOR2X1 U58 ( .A(data_in_reg[8]), .B(n7), .Y(data_out[8]) );
  NAND2X1 U59 ( .A(n8), .B(n5), .Y(n7) );
  XNOR2X1 U60 ( .A(data_in_reg[9]), .B(n4), .Y(data_out[9]) );
  NAND2X1 U61 ( .A(n5), .B(n6), .Y(n4) );
  XNOR2X1 U62 ( .A(data_in_reg[10]), .B(n38), .Y(data_out[10]) );
  NAND2X1 U63 ( .A(n13), .B(n5), .Y(n38) );
  XNOR2X1 U64 ( .A(data_in_reg[11]), .B(n34), .Y(data_out[11]) );
  NAND2X1 U65 ( .A(n10), .B(n5), .Y(n34) );
  XNOR2X1 U66 ( .A(data_in_reg[12]), .B(n30), .Y(data_out[12]) );
  NAND2X1 U67 ( .A(n24), .B(n8), .Y(n30) );
  XNOR2X1 U68 ( .A(data_in_reg[14]), .B(n25), .Y(data_out[14]) );
  NAND2X1 U69 ( .A(n24), .B(n13), .Y(n25) );
endmodule


module Codec ( data_in, bit_flip, clk, data_out );
  input [15:0] data_in;
  input [23:0] bit_flip;
  output [15:0] data_out;
  input clk;

  wire   [23:0] data_coded;
  wire   [23:0] data_augmented;

  Coder coder ( .data_in(data_in), .clk(clk), .data_out(data_coded) );
  Decoder decoder ( .data_in(data_augmented), .clk(clk), .data_out(data_out)
         );
  XOR2X1 U25 ( .A(data_coded[16]), .B(bit_flip[16]), .Y(data_augmented[16]) );
  XOR2X1 U26 ( .A(data_coded[17]), .B(bit_flip[17]), .Y(data_augmented[17]) );
  XOR2X1 U27 ( .A(data_coded[18]), .B(bit_flip[18]), .Y(data_augmented[18]) );
  XOR2X1 U28 ( .A(data_coded[19]), .B(bit_flip[19]), .Y(data_augmented[19]) );
  XOR2X1 U29 ( .A(data_coded[20]), .B(bit_flip[20]), .Y(data_augmented[20]) );
  XOR2X1 U30 ( .A(data_coded[21]), .B(bit_flip[21]), .Y(data_augmented[21]) );
  XOR2X1 U31 ( .A(data_coded[22]), .B(bit_flip[22]), .Y(data_augmented[22]) );
  XOR2X1 U32 ( .A(data_coded[23]), .B(bit_flip[23]), .Y(data_augmented[23]) );
  XOR2X1 U33 ( .A(data_coded[0]), .B(bit_flip[0]), .Y(data_augmented[0]) );
  XOR2X1 U34 ( .A(data_coded[1]), .B(bit_flip[1]), .Y(data_augmented[1]) );
  XOR2X1 U35 ( .A(data_coded[2]), .B(bit_flip[2]), .Y(data_augmented[2]) );
  XOR2X1 U36 ( .A(data_coded[3]), .B(bit_flip[3]), .Y(data_augmented[3]) );
  XOR2X1 U37 ( .A(data_coded[4]), .B(bit_flip[4]), .Y(data_augmented[4]) );
  XOR2X1 U38 ( .A(data_coded[5]), .B(bit_flip[5]), .Y(data_augmented[5]) );
  XOR2X1 U39 ( .A(data_coded[6]), .B(bit_flip[6]), .Y(data_augmented[6]) );
  XOR2X1 U40 ( .A(data_coded[7]), .B(bit_flip[7]), .Y(data_augmented[7]) );
  XOR2X1 U41 ( .A(data_coded[8]), .B(bit_flip[8]), .Y(data_augmented[8]) );
  XOR2X1 U42 ( .A(data_coded[9]), .B(bit_flip[9]), .Y(data_augmented[9]) );
  XOR2X1 U43 ( .A(data_coded[10]), .B(bit_flip[10]), .Y(data_augmented[10]) );
  XOR2X1 U44 ( .A(data_coded[11]), .B(bit_flip[11]), .Y(data_augmented[11]) );
  XOR2X1 U45 ( .A(data_coded[12]), .B(bit_flip[12]), .Y(data_augmented[12]) );
  XOR2X1 U46 ( .A(data_coded[13]), .B(bit_flip[13]), .Y(data_augmented[13]) );
  XOR2X1 U47 ( .A(data_coded[14]), .B(bit_flip[14]), .Y(data_augmented[14]) );
  XOR2X1 U48 ( .A(data_coded[15]), .B(bit_flip[15]), .Y(data_augmented[15]) );
endmodule

