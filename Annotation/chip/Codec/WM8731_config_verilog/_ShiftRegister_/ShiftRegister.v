module ShiftRegister
(
	//input 
	clock,
	reset,
	data_in,
	//output reg[15:0]
	data_out,
  
  //tb purpose
  counter,
  full
);

parameter data_size = 16;
input clock;
input reset;
input data_in;
output reg [data_size-1:0]data_out;
output reg [3:0]counter;
output reg full;

always@(posedge clock or negedge reset)
begin
  if(!reset) begin
    data_out <= 0;
    counter <= 0;
    full <= 0;
  end
  else begin
    if(counter < 15)begin
      data_out <= {data_out[14:0], data_in};
      counter <= counter + 1;
      full <= 0;
    end
    else begin
      data_out <= data_out;
      full <= 1;
    end
  end
end
endmodule
