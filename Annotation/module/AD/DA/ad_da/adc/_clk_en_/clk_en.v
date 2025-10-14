`timescale 1ns/1ns
/*模块说明

*/
module clk_en (
    //global clock
    input  clk,
    input  rst_n,

    //user interface
    input  cs,
    output reg sclk 
);

reg clk_en;
reg  [1:0] edges;
wire up_edge = edges == 2'b01;
wire dw_edge = edges == 2'b10;

//key signal 流转两个寄存器，为检测边沿
always  @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        edges <= 2'b11;
    end
    else begin
        edges <= {edges[0],cs};
    end
end

always  @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        clk_en <= 0;
    end
    else if(dw_edge)begin
        clk_en <= 1;
    end
    else if(up_edge)begin
        clk_en <= 0;
    end

end
always  @(*)begin
    if(clk_en)begin
        sclk <= clk;
    end
    else
        sclk <= 1;
end
    
endmodule