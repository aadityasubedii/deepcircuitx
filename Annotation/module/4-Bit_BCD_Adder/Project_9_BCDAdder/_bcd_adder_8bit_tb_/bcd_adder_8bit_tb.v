// Developed by: Aashi Srivastava
// Title : 8-bit BCD adder test bench
// Date:16-10-23, 21:10 IST
module bcd_adder_8bit_tb (
    
);
    
    reg [3:0] A1, A0, B1, B0;
    reg cin;
    wire  [3:0] S0, S1;
    wire cout;
    wire wire6;


    bcd_adder_8bit p(
     S0,S1,cout,A1,A0,B1,B0,cin,wire6
);    

initial begin
    $dumpfile("bcd_adder_8bit.vcd");
    $dumpvars(0,bcd_adder_8bit_tb);
    $monitor(" sum=%0d%0d%0d in1=%0d%0d in2=%0d%0d ",wire6,S1,S0,A1,A0,B1,B0);
        #40 $finish;
    end
initial begin
    A0=4'b1001;
    B0=4'b1001;
    A1=4'b1001;
    B1=4'b1001;
    cin=1'b0;
end
endmodule