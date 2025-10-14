`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2023 10:36:30 PM
// Design Name: 
// Module Name: Single_Address_ROM
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


module Single_Address_ROM(
    input clk,
    input en,
    input [2:0] addr,
    output reg [15:0]data_out
    );
    
    wire [15:0] L0,L1,L2,L3,L4,L5,L6,L7;

    assign L0=16'haaaa;
    assign L1=16'habcd;
    assign L2=16'h9999;
    assign L3=16'h2121;
    assign L4=16'h8585;
    assign L5=16'h4258;
    assign L6=16'h7b4e;
    assign L7=16'h9a2b;

    always @(posedge clk) begin
        if (en)
            case(addr)
                 4'b000: data_out <= L0;
                 4'b001: data_out <= L1;
                 4'b010: data_out <= L2;
                 4'b011: data_out <= L3;
                 4'b100: data_out <= L4;
                 4'b101: data_out <= L5;
                 4'b110: data_out <= L6;
                 4'b111: data_out <= L7;
                 default: data_out <= 16'bx;
            endcase
        else 
            data_out<=16'bz;
    end
endmodule
