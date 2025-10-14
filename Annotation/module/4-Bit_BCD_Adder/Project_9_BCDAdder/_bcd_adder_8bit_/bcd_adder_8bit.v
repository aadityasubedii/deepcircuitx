// Developed by: Aashi Srivastava
// Title : 8-bit BCD adder
// Date:16-10-23, 21:10 IST

module bcd_adder_8bit (
    S0,S1,cout,A1,A0,B1,B0,cin,wire6
);
    input [3:0] A1, A0, B1, B0;
    input cin;
    output [3:0] S0, S1;
    output cout;

    wire[3:0] wire1, wire10;
    wire wire2, wire3,wire4,wire5;
    wire[3:0] wire20, wire30;
    wire wire7, wire8,wire9, wire12,wire11;

    output wire6;

    parallel_adder p1(wire1, wire2, A0,B0, cin);
    and a1(wire3, wire1[3], wire1[2]);
    and a2(wire4, wire1[3], wire1[1]);
    or o1(wire5, wire3, wire4);
    or o2(wire11, wire5, wire2);

    assign wire10[3]=1'b0;
    assign wire10[2]= wire11;
    assign wire10[1]= wire11;
    assign wire10[0]=1'b0;

    parallel_adder p2(S0, cout, wire1, wire10, cin);

    parallel_adder p3(wire20, wire7,A1,B1, wire11);
    and a4(wire8, wire20[3], wire20[2]);
    and a5(wire9, wire20[3], wire20[1]);
    or o3(wire12, wire8, wire9);
    or o4(wire6, wire12, wire7);

    assign wire30[3]=1'b0;
    assign wire30[2]= wire6;
    assign wire30[1]= wire6;
    assign wire30[0]=1'b0;

    parallel_adder p4(S1, cout, wire20, wire30, cin);


endmodule
module parallel_adder (
    sum,carry_out,in1,in2,carry_in
);
    input [3:0] in1, in2;
    output [3:0]sum;
    output carry_out;
    input carry_in;
    wire [2:0] wire1;

    full_adder_CA f1(sum[0],wire1[0],in1[0],in2[0],carry_in);
    
    full_adder_CA f2(sum[1],wire1[1],in1[1],in2[1],wire1[0]);
    
    full_adder_CA f3(sum[2],wire1[2],in1[2],in2[2],wire1[1]);
    
    full_adder_CA f4(sum[3],carry_out,in1[3],in2[3],wire1[2]);

endmodule

module full_adder_CA(
    sum,carry_out,in1,in2,carry_in
);
input in1,in2, carry_in;
output sum, carry_out;
wire wire1, wire2, wire3;
assign sum=(in1^in2)^carry_in;
assign carry_out=(in1 & in2)|(in2 & carry_in)|(carry_in & in1);
endmodule