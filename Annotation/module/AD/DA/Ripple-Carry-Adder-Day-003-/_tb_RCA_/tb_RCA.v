`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2023 02:19:55 PM
// Design Name: 
// Module Name: tb_RCA
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


module tb_RCA;
        
        reg [3:0] a,b;
        reg cin;
        wire [3:0] sum, carry;
        
        RCA R(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
        
                initial
                begin
                
                a = 4'b0000;
                b = 4'b0000;
                cin = 0;
               
              #10 a = 4'b0000;
                  b = 4'b0000;
                  cin = 1;
              
              #10 a = 4'b0001;
                  b = 4'b0010;
                  cin = 0;
              
              #10 a = 4'b0001;
                  b = 4'b0010;
                  cin = 1;
                 
              #10 a = 4'b0011;
                  b = 4'b0110;
                  cin = 0;
                 
              #10 a = 4'b0101;
                  b = 4'b0011;
                  cin = 0;  
                 
                 end    
endmodule
