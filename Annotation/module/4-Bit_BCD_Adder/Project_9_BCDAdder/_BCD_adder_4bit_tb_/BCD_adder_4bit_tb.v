module bcd_adder_4bit_tb (
    
);
    reg [3:0]in1,in2;
    wire [3:0] sum;
    wire carry_out;
    reg carry_in;
    wire wire6;

    bcd_adder_4bit p(
    sum,carry_out,in1,in2,carry_in,wire6
);    

initial begin
    $dumpfile("bcd_adder_4bit.vcd");
    $dumpvars(0,bcd_adder_4bit_tb);
    $monitor(" sum=%0d%0d in1=%0d in2=%0d ",wire6,sum,in1,in2);
        #40 $finish;
    end
initial begin
    in1=4'b1001;
    in2=4'b0011;
    carry_in=1'b0;
end
endmodule