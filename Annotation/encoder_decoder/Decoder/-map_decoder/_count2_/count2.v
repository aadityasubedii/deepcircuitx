module skip_counter    (
out     ,  // Output of the counter
// enable for counter
clk     ,  // clock Input
reset      // reset Input
);
output [12:0] out;
input  clk, reset;
reg [12:0] out;
integer i = 0;
always @(posedge (clk))
begin 
if (reset)
 begin
  out <= 13'b0 ;
  i <= 0;
 end 
 else
  begin
    if((i%2) == 0)
    begin   
      out <= out + 1;
      i <= i + 1;
    end
    else
      i <= i + 1;
  end
end

endmodule 
