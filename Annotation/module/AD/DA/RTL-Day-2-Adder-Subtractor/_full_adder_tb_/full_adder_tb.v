module full_adder_tb();

reg a,b,cin;
wire s,co;

full_adder dut(.a(a),.b(b),.cin(cin),.s(s),.co(co));

initial begin
//stimulus
    a=0; b=0;cin=0;
#10 a=0; b=0;cin=1;
#10 a=0; b=1;cin=0;
#10 a=0; b=1;cin=1;
#10 a=1; b=0;cin=0;
#10 a=1; b=0;cin=1;
#10 a=1; b=1;cin=0;
#10 a=1; b=1;cin=1;
#10 $finish;

end

endmodule
