`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 21.07.2023 08:11:19
// Design Name: 
// Module Name: tb_full_adder
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


module tb_full_adder;
    reg a,b,cin;
    wire carry, sum;
    
    full_adder FA1 (.a(a), 
                    .b(b),
                    .cin(cin),
                    .carry(carry),
                    .sum(sum)
                    );
    initial begin
        #5 a=0; b=0; cin=0;
        #5 a=0; b=1; cin=0;
        #5 a=1; b=0; cin=0;
        #5 a=1; b=1; cin=0;
        #5 a=0; b=0; cin=1;
        #5 a=0; b=1; cin=1;
        #5 a=1; b=0; cin=1;
        #5 a=1; b=1; cin=1;
        #5 $stop;
    end 
   
endmodule
