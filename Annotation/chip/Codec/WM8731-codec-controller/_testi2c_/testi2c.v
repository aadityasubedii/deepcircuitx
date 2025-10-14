`timescale 1ns/100ps

module testi2c();
  
reg clk, reset, start_i2c, sdat_reg;
wire sclk, idle;
tri1 sdat; 
reg [23:0] datain;

reg [4:0] i;


i2cc i2cc_i(.clk(clk), .reset(reset), .din(datain), .wr_i2c(start_i2c), .i2c_sclk(sclk), .i2c_sdat(sdat), .i2c_idle(idle));
i2ccbeta beta(.clk(clk), .reset(reset), .din(datain), .wr_i2c(start_i2c), .i2c_sclk(sclk), .i2c_sdat(sdat), .i2c_idle(idle));

assign sdat = sdat_reg ? 1'bz : 1'b0;
   
always #10 clk = ~clk;

initial
begin
sdat_reg = 1;
clk = 0;
reset = 1;
datain = 24'b101010100011110011000011;
start_i2c=0;

for (i = 23; i >= 1; i = i -1) begin
  	  	$display ("Current value of i is %d", i);
end

#100 reset=0;
#100 start_i2c=1;
#10 start_i2c=0;
//#10000 datain = 24'b001110101100001100111100;
#84000 sdat_reg = 0;
#10000 sdat_reg = 1'bz;
#300000 start_i2c=1;
#100 start_i2c=0;
#300000 start_i2c=1;
#100 start_i2c=0;
#150000 reset=1;
#100 reset=0;


#400000 $finish(); 

end


endmodule
