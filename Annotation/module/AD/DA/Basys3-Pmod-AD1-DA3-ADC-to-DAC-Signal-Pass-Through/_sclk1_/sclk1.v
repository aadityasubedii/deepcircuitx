`timescale 1ns / 1ps


module sclk1(
    input clock,
    input reset,
    output reg sclk1
    );
    
    reg[24:0] count = 0;
    
    initial begin
    count = 0;
    sclk1 = 0;
    end
    
    always @ (posedge clock) begin
        if (reset ==1'b1)begin
            count <= 0;
            sclk1 <= 0;
        end else begin
            count <= count + 1;
            if(count == 1) begin 
                sclk1 <= ~sclk1;
                count <= 0;  
            end
        end 
    end      
endmodule