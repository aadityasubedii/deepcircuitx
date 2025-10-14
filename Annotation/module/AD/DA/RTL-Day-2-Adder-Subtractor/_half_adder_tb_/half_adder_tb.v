module half_adder_tb();

reg a,b;
wire s,c;

half_adder dut(.a(a),.b(b),.s(s),.c(c));

initial begin
//stimulus
    a=0; b=0;
#10 a=0; b=1;
#10 a=1; b=0;
#10 a=1; b=1;
#10 $finish;
end

endmodule
