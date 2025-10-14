module half_adder(
  input a,b,
  output  carry, sum);
  
  assign sum = a^b;
  assign carry = a&b;
  
endmodule
