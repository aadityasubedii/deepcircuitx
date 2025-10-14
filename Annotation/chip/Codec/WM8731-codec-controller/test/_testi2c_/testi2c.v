`timescale 1ns/100ps

module testi2c();
  
reg clk, reset,enable, start_i2c, sdat_reg;
wire sclk, idle;
tri1 sdat; 
reg [23:0] datain;


i2cc i2cc_i(.clk(clk), .reset(reset), .din(datain), .wr_i2c(start_i2c), .i2c_sclk(sclk), .i2c_sdat(sdat), .i2c_idle(idle));

assign sdat = sdat_reg ? 1'bz : 1'b0;
   
always #10 clk = ~clk;

initial
begin
sdat_reg = 1;
clk = 0;
reset = 1;
//enable = 0;

//datain = 24'b111111111111111111111011;
datain = 24'b101010100011110011000011;
start_i2c=0;

#100 reset=0;
//#100 enable=1;
#100 start_i2c=1;
#10 start_i2c=0;
#10000 datain = 24'b001110101100001100111100;
#84000 sdat_reg = 0;
#10000 sdat_reg = 1'bz;
#300000 start_i2c=1;
#100 start_i2c=0;
#300000 start_i2c=1;
#100 start_i2c=0;
#150000 reset=1;
#100 reset=0;


#4000000 $finish(); 

end


endmodule
