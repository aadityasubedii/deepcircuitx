module Full_adder_tb;
  reg [3:0]a, b;
  wire [3:0]sum;
  
  
  add4 t(a, b, sum); 
  
  initial begin
    $monitor("a=%b, b=%b, sum=%b", a, b, sum);
    $dumpfile("dump.vcd"); $dumpvars;
    a = 4'd1;
    b = 4'd2;
    #10;
    a = 4'd2;
    b = 4'd4;
    #20;
    repeat(10) begin
      a = $random;
      b = $random;
      #5;
    end
  end
endmodule
