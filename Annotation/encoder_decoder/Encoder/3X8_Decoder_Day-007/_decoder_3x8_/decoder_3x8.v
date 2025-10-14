`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Gunavant
// 
// Create Date: 26.07.2023 04:47:19
// Design Name: 
// Module Name: decoder_3x8
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


module decoder_3x8 (input [2:0] I,
                    input en,
                    output reg [7:0] d
                    );
       always @(*) begin
        if (en == 0)
            d = 8'b0;
        else begin
            case(I)
              3'b000 : d = 8'b0000_0001;
              3'b001 : d = 8'b0000_0010;
              3'b010 : d = 8'b0000_0100;
              3'b011 : d = 8'b0000_1000;
              3'b100 : d = 8'b0001_0000;
              3'b101 : d = 8'b0010_0000;
              3'b110 : d = 8'b0100_0000;
              3'b111 : d = 8'b1000_0000;
              default: d = 8'b0;
            endcase
        end
       end
      
endmodule
