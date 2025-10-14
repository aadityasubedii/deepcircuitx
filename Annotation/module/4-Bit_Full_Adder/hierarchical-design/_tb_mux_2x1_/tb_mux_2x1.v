`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.01.2024 15:48:05
// Design Name: 
// Module Name: tb_mux_2x1
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


module tb_mux_2x1();
    reg in_0, in_1 ,sel; 
    wire mux_out;
    
 mux_2x1 inst1(.in_0(in_0),.in_1(in_1),.sel(sel),.mux_out(mux_out));
 
 initial
    begin
        in_0 = 0;
        in_1 = 0;  
        #10
        in_0 = 1;  
        #10
        in_0 = 1;
        in_1 = 0;  
        #10
        in_1 = 1;  
        #10
        $finish;
    end
 initial
    begin
        $monitor("T=%0t in_0=%0b in_1=%0b sel=%0b mux_out=%0b ",$time, in_0, in_1,sel,mux_out);
    end   
    
endmodule
