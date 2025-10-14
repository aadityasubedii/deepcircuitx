// Developed by: Aashi Srivastava
// Title : 4-bit BCD adder
// Date:16-10-23, 21:10 IST

module bcd_adder_4bit (
    sum,cout,in1,in2,cin, wire6
);
    input [3:0] in1, in2;
    input cin;
    output [3:0] sum;
    output cout;

    wire[3:0] wire1, wire10;
    wire wire2, wire3,wire4,wire5;

    output wire6;

    parallel_adder p1(wire1, wire2, in1, in2, cin);
    and a1(wire3, wire1[3], wire1[2]);
    and a2(wire4, wire1[3], wire1[1]);
    or o1(wire5, wire3, wire4);
    or o2(wire6, wire5, wire2);

    assign wire10[3]=1'b0;
    assign wire10[2]= wire6;
    assign wire10[1]= wire6;
    assign wire10[0]=1'b0;

    parallel_adder p2(sum, cout, wire1, wire10, cin);

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