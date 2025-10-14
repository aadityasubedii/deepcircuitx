module Audio_Clock 
(
	input clk,
  input reset,
	output c0
);
	
reg  	[10:0] COUNTER_500;
// wire  CLOCK_500 = COUNTER_500[9];
assign c0 = COUNTER_500[1];

always @(posedge clk, posedge reset)
  if(reset)
    COUNTER_500 <= 0;
  else
    COUNTER_500 <= COUNTER_500 + 1;
      

endmodule

