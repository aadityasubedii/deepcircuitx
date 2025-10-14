module full_subtractor_tb();

reg a,b,cin;
wire d,bo;

full_subtractor dut(.a(a),.b(b),.cin(cin),.d(d),.bo(bo));

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
