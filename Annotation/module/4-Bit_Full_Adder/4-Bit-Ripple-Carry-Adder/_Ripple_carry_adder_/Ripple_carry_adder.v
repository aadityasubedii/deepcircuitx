// 4 -bit adder

module ripple_carry_adder(a0,a1,a2,a3,b0,b1,b2,b3,cin,s0,s1,s2,s3,cout);

  //---------- Port Declaration ----------//

  input a0,a1,a2,a3,b0,b1,b2,b3,cin;
  output s0,s1,s2,s3,cout;
 
  //---------- Internal cable Declaration ----------//
  
  wire c0,c1,c2;
  
  //---------- Full adder instantiation ----------// 

  full_adder fa1(.a(a0),.b(b0),.c(cin),.sum(s0),.carry(c0));
  full_adder fa2(.a(a1),.b(b1),.c(c0),.sum(s1),.carry(c1));
  full_adder fa3(.a(a2),.b(b2),.c(c1),.sum(s2),.carry(c2));
  full_adder fa4(.a(a3),.b(b3),.c(c2),.sum(s3),.carry(cout));

endmodule


