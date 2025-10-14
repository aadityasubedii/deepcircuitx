`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2023 10:46:56 PM
// Design Name: 
// Module Name: tb_Single_Address_ROM
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


module TB_Single_Address_ROM();

    reg clk,en;
    reg [3:0]addr;
    wire [15:0]data_out;
    
    Single_Address_ROM dut(
    .clk(clk),
    .en(en),
    .addr(addr),
    .data_out(data_out));
    
    integer i;
    
    initial begin
    clk=0;
    #3 en=1;
    end
    always #5 clk=~clk;
    
    initial
    begin
        for(i=0;i<8;i=i+1)
        begin
            #10;
            addr=i;
        end
        #15;
        $finish;
    end
endmodule