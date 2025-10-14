`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 05:08:44
// Design Name: 
// Module Name: tb_decoder_3x8
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


module tb_decoder_3x8;
    reg en;
    reg [2:0] I;
    wire [7:0] d;
    
    decoder_3x8 DUT (.en(en),.I(I),.d(d));
        

        initial begin
            en = 1;
             I = 3'b000;
            #50 I = 3'b001;
            #50  I = 3'b010;
            #50 I = 3'b011;
            #50 I = 3'b101;
            #50 I = 3'b101;
            #50 I = 3'b110;
            #50 I = 3'b111;
            #50 $stop;
            end  
endmodule
