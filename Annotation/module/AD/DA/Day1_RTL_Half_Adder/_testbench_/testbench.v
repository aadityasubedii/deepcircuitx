// Testbench
`timescale 10ns/10ps
`include "half_adder.v"
module tb();
reg a,b;
wire sum,carry;
halfadder ha_dut(a,b,sum,carry);
initial begin
a=0;b=0;
#10;
a=1;b=0;
#10;
a=0;b=1;
#10;
a=1;b=1;
#10;
end
  
initial begin  
$monitor("%t: a=%x,b=%x,sum=%x,carry=%x",$time,a,b,sum,carry);
$dumpfile("dump.vcd"); 
$dumpvars;  
end

endmodule 


