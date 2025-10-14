module delay_3(
input [11:0]x1,
input clk,
output reg[11:0]x2
);
integer i; 


always@(posedge(clk))
begin 
        if( i >= 7'b0101000)
        begin   
                x2 <= x1;
        end
        else 
            if( i >= 0)
                i <= i+1;
            else
                i <=0;

end

endmodule                        