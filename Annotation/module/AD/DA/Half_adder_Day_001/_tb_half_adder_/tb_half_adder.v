module tb_half_adder;
  reg a, b;
  wire  carry, sum;
  
  half_adder a1(a, b,  carry, sum);
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    $monitor("a=%b, b=%b,  carry= %b, sum = %b", a, b, carry , sum);
    a = 1'b1; b = 1'b1; 
    #3;
    a = 1'b1; b = 1'b0;
    #5;
    a = 1'b0; b = 1'b0; 
    #10;
    a = 1'b1; b = 1'b1;
    #5;
  end
endmodule
