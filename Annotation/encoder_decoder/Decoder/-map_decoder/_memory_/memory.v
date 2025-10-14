module gamma_RAM(
input clock,rdwr1,rdwr2,
input [12:0]index,index2,index3,
input signed[11:0]in1,
output  reg signed[11:0]o1,o2,o3,o4,o11,o12,o13,o14);
reg [11:0]mem[127:0];
always@(posedge(clock))
  begin   
      if(!rdwr1)
       begin 
        if(index < 13'b0000010000000)
            mem[index] <= in1;
       end 
    if(rdwr2) 
        begin
          if(index2 > 0)
          begin              
          o1 <= mem[index2 -1];
          o2 <= mem[index2 -1];
          o3 <= mem[index2 -1];
          o4 <= mem[index2 -1];
          end  
        if(index3 > 0)
        begin 
          o11 <= mem[index3 -1];
          o12 <= mem[index3 -1];
          o13 <= mem[index3 -1];
          o14 <= mem[index3 -1];
        end
    end
  
  end
endmodule    