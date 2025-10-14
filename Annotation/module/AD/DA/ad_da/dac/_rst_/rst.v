`timescale 1ns/1ns
/*Ä£¿éÀı»¯
rst rst_u(
    //global clock
    . clk(clk),
    . rst_n(rst_n),

    //user interface
    . rst(rst)
);
*/
module rst (
    //global clock
    input clk,
    input rst_n,

    //user interface
    output reg rst
);
reg rst1;
//
always  @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        rst1 <= 0;
        rst  <= 0;
    end
    else begin
        rst1 <= rst_n;
        rst  <= rst1;
    end  
end
    
endmodule

