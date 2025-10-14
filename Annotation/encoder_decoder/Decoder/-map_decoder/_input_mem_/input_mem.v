module input_RAM(
input clock,rdwr1,rdwr2,
input [12:0]index,
input signed[11:0]in,
output reg signed[11:0]out);
reg [11:0]mem[6143:0];
always@(posedge(clock))
  begin
    if(index <= 13'b1100000000000)
     begin 
      if(!rdwr1)
        begin
          mem[index] <= in;
       end 
      if (rdwr2)
        begin
          if(index > 0)
         out <= mem[index - 1];
        end
   end
  end
endmodule    