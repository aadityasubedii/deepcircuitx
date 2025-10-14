
module four_bit_adder (a,b,cin,cout,sum);
 input [3:0] a,b;
 input cin;
 output cout;
 output [3:0] sum;
 wire [3:1] c;
 fa st0 (a[0],b[0],cin,sum[0],c[1]);
 fa st1 (a[1],b[1],c[1],sum[1],c[2]);
 fa st2 (a[2],b[2],c[2],sum[2],c[3]);
 fa st3 (a[3],b[3],c[3],sum[3],cout);

 endmodule

module fa(a,b,c,sum,cout);
input a,b,c;
output sum,cout;
wire sum1,c1,c2;


assign sum1=hasum(a,b);
assign sum=hasum(sum1,c);
assign c1=hacarry(a,b);
assign c2=hacarry(hasum(a,b),c);
assign cout=c1 | c2;

function hasum;
input ain,bin;
begin
 hasum=ain^bin;
 end
endfunction


function hacarry;

input ain,bin;
begin
hacarry=ain & bin;
end
endfunction

endmodule



module testbench;
reg [3:0] a,b;
reg cin;
wire cout;
wire [3:0] sum;

four_bit_adder dut(a,b,cin,cout,sum);
initial 
begin

$monitor($time," a=%b b=%b cin=%b sum=%b cout=%b",a,b,cin,sum,cout);
#5 a=1101; b=0101; cin=0;
#5 a=1111; b=1101; cin=1;
#5 a=0111; b=0101; cin=0;

#5 $finish;
end
endmodule
