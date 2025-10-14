`timescale 1ns/100ps

module stimulus;

// internal ports
reg A, B, C_IN;
wire SUM, C_OUT;

// instantiate a one-bit full adder
fulladd fa(SUM, C_OUT, A, B, C_IN);

// monitor inputs and outputs
initial
begin
        $monitor($time, " A = %b, B = %b, C_IN = %b, C_OUT = %b, SUM = %b\n", A, B, C_IN, C_OUT, SUM);
end

// set inputs
initial
begin
        A=1'b0; B=1'b0; C_IN=1'b0;
        #1 A = 1'b1;
        #1 B = 1'b1;
        #1 A = 1'b0;
        #1 C_IN = 1'b1;
        #1 A = 1'b1;
        #1 B = 1'b0;
        #1 A = 1'b1;
end

endmodule
