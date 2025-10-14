//4-bit adder TB

module ripple_carry_adder_tb();
  
  // ---------- Port Declaration ---------- \\
  reg a0,a1,a2,a3,b0,b1,b2,b3,cin;
  wire s0,s1,s2,s3,cout;

  // ---------- DUT Instantiation ---------- \\
  
  ripple_carry_adder dut(.a0(a0),.a1(a1),.a2(a2),.a3(a3),.b0(b0),.b1(b1),.b2(b2),.b3(b3),.cin(cin),.s0(s0),.s1(s1),.s2(s2),.s3(s3),.cout(cout));

  initial begin
  
 $monitor($time,"a0 = %b,a1 = %b,a2 = %b,a3 = %b,b0 = %b,b1 = %b,b2 = %b,b3 = %b,cin = %b,s0 = %b,s1 = %b,s2 = %b,s3 = %b,cout = %b",a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,cout);

 //----- Input a0,a1,a2,a3 -----\\ //----- Input b0,b1,b2,b3 -----\\ //-cin-\\
  a0 = 0; a1 = 0; a2 = 0; a3 = 0;  b0 = 0; b1 = 0; b2 = 0; b3 = 0;    cin = 0;
  #5;
  a0 = 0; a1 = 0; a2 = 0; a3 = 1;  b0 = 0; b1 = 0; b2 = 0; b3 = 1;    cin = 0;
  #5;
  a0 = 0; a1 = 0; a2 = 1; a3 = 0;  b0 = 0; b1 = 0; b2 = 1; b3 = 0;    cin = 0;
  #5;
  a0 = 0; a1 = 0; a2 = 1; a3 = 1;  b0 = 0; b1 = 0; b2 = 1; b3 = 1;    cin = 0;
  #5;
  a0 = 0; a1 = 1; a2 = 0; a3 = 0;  b0 = 0; b1 = 1; b2 = 0; b3 = 0;    cin = 0;
  #5;
  a0 = 0; a1 = 1; a2 = 0; a3 = 1;  b0 = 0; b1 = 1; b2 = 0; b3 = 1;    cin = 0;
  #5;
  a0 = 0; a1 = 1; a2 = 1; a3 = 0;  b0 = 0; b1 = 1; b2 = 1; b3 = 0;    cin = 0;
  #5;
  a0 = 0; a1 = 1; a2 = 1; a3 = 1;  b0 = 0; b1 = 1; b2 = 1; b3 = 1;    cin = 0;
  #5;
  a0 = 1; a1 = 0; a2 = 0; a3 = 0;  b0 = 1; b1 = 0; b2 = 0; b3 = 0;    cin = 0;
  #5;
  a0 = 1; a1 = 0; a2 = 0; a3 = 1;  b0 = 1; b1 = 0; b2 = 0; b3 = 1;    cin = 0;
  #5;
  a0 = 1; a1 = 0; a2 = 1; a3 = 0;  b0 = 1; b1 = 0; b2 = 1; b3 = 0;    cin = 0;
  #5; 
  a0 = 1; a1 = 0; a2 = 1; a3 = 1;  b0 = 1; b1 = 0; b2 = 1; b3 = 1;    cin = 0;
  #5;
  a0 = 1; a1 = 1; a2 = 0; a3 = 0;  b0 = 1; b1 = 1; b2 = 0; b3 = 0;    cin = 0;
  #5; 
  a0 = 1; a1 = 1; a2 = 0; a3 = 1;  b0 = 1; b1 = 1; b2 = 0; b3 = 1;    cin = 0;
  #5;
  a0 = 1; a1 = 1; a2 = 1; a3 = 0;  b0 = 1; b1 = 1; b2 = 1; b3 = 0;    cin = 0;
  #5;
  a0 = 1; a1 = 1; a2 = 1; a3 = 1;  b0 = 1; b1 = 1; b2 = 1; b3 = 1;    cin = 1;
  #5;
  $finish;
end
endmodule

