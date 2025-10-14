`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.07.2023 06:32:45
// Design Name: GUNAVANT
// Module Name: tb_ripple_carry_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ripple_carry_adder;
    reg [3:0]a;
    reg [3:0]b;
    reg [3:0]cin;
    wire [3:0]sum;
    wire [3:0]carry;
    ripple_carry_adder RCA1(.a(a),
                            .b(b),
                            .cin(cin),
                            .carry(carry),
                            .sum(sum)
                            );
    
    initial begin
        #5 a = 4'b0000; b = 4'b0000; cin = 4'b0000;
        #5 a = 4'b0001; b = 4'b0001; cin = 4'b0000;
        #5 a = 4'b0010; b = 4'b0010; cin = 4'b0000;
        #5 a = 4'b0100; b = 4'b0100; cin = 4'b0000;
        #5 a = 4'b1000; b = 4'b1000; cin = 4'b0001;
        #5 a = 4'b1001; b = 4'b1001; cin = 4'b0001;
        #5 a = 4'b1011; b = 4'b1011; cin = 4'b0001;
        #5 a = 4'b1111; b = 4'b1111; cin = 4'b0001;
        #5 $stop;
    end  
endmodule
