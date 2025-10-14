`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.01.2024 13:15:06
// Design Name: 
// Module Name: tb_demux_1x2
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


module tb_demux_1x2();
    reg y,sel;
    wire d0,d1;
    
    demux_1x2 dem(.y(y), .sel(sel),.d0(d0),.d1(d1));
    
    initial 
        begin 
         sel = 0;
         y = 0;
         #10
         sel = 0;
         y =1;
         #10
         
         sel = 1;
         y=0;
         #10
         
         sel = 1;
         y=1;
         #10
         $finish;
         
        
        end
     initial
     begin
     $monitor("time=%0t, y=%0b sel=%0b d0=%0b d1=%0b",$time, y, sel, d0, d1);
     
     end
    
endmodule
