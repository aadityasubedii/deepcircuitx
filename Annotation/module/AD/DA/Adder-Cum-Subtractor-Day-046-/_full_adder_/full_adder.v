module full_adder(
    input a, b, cin,
    output sout, cout
    );
    assign sout = a^b^cin;
    assign cout = (a&b) | (b&cin) | (a&cin);
endmodule