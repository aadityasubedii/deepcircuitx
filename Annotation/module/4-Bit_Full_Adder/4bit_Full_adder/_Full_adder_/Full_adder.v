module add4(
  input [3:0]a, b, 
  output [3:0]sum);
  
  wire w2;
  
  add2 a3(a[1:0], b[1:0], 0, sum[1:0], w2);
  add2 a4(a[3:2], b[3:2], w2, sum[3:2]);
endmodule


module add2(
    input [1:0]a, b, 
    input cin,
    output [1:0]sum,
    output cout);
    wire w1;
    
  add1 a1(.a(a[0]), .b(b[0]), .cin(0), .sum(sum[0]), .cout(w1));
  add1 a2(.a(a[1]), .b(b[1]), .cin(w1), .sum(sum[1]));
endmodule
  
module add1(
    input a, b, cin,
    output sum, cout);
    assign sum = a^b^cin;
    assign cout = a&b | b&cin | cin&a;
endmodule  
