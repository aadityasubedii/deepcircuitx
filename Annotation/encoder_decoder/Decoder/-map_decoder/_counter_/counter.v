module up_counter    (
out     ,  // Output of the counter
// enable for counter
clk     ,  // clock Input
reset      // reset Input
);
//----------Output Ports--------------
    output [12:0] out;
//------------Input Ports--------------
     input  clk, reset;
//------------Internal Variables--------
    reg [12:0] out;
//-------------Code Starts Here-------
always @(posedge (clk))
if (reset) begin
  out <= 13'b0 ;
end else  begin
  out <= out + 1;
end


endmodule 
