`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 13:09:05
// Design Name: 
// Module Name: tb_mux_2x1_conditionaloper
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


module tb_mux_2x1_conditionaloper();
    reg in_0, in_1, sel;
    wire mux_outt;
    
    
mux_2x1_conditionaloper mux(.in_0(in_0),
                  .in_1(in_1),
                  .sel(sel),
                  .mux_outt(mux_outt));

initial
    begin
        in_0 = 0;
        in_1 = 0;
        sel=0;  
        #10
        in_1 = 1;  
        #10
        sel = 1;
        in_0 = 1;  
        #10
        sel = 0;  
        #10
        $finish;
    
    end 
    initial
        begin
        $monitor("Time=%0t  in_0=%0b in_1=%0b sel=%0b mux_outt=0%0b",$time,sel,in_0,in_1,mux_outt);
         
        end                 
                     
endmodule
