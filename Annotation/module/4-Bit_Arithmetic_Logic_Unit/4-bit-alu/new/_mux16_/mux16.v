`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2022 18:40:46
// Design Name: 
// Module Name: mux16
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


module mux16(
    input [2:0] sel,
    input [4:0] a,
    input [4:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    input [3:0] f,
    input [3:0] g,
    input [7:0] h,
    output reg [8:0] out
    );
    always @(*)
    begin
        case(sel)
        4'b000:out=a;
        4'b001:out=b;
        4'b010:out=c;
        4'b011:out=d;
        4'b100:out=e;
        4'b101:out=f;
        4'b110:out=g;
        4'b111:out=h;
        
        endcase
    end
endmodule
