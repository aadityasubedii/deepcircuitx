`timescale 1ns/100ps

`define i2cfm              sys_i2c_fm_i

module testi2ctasks();
  
reg clk, reset,enable, start_i2c;
wire i2c_sclk, idle, i2c_sdat;
reg [23:0] datain;

//La variable error en la que anirem sumant els errors
integer error;

i2cc i2cc_i(.clk(clk), .reset(reset), .din(datain), .wr_i2c(start_i2c), .i2c_sclk(i2c_sclk), .i2c_sdat(i2c_sdat), .i2c_idle(idle));

//Model funcional
sys_i2c_fm sys_i2c_fm_i (.clk(clk), .reset(reset), .i2c_sdat(i2c_sdat), .i2c_sclk(i2c_sclk));
   
always #10 clk = ~clk;

/*
assign i2c_sdat = (i2c_sdat === 1'bz) ? 1'b1 : (
					(reset == 1) ?	1'b1 : i2c_sdat);
*/

initial
begin
error = 0;
clk = 0;
reset = 1;
datain = 24'b101010100011110011000011;
start_i2c=0;

#100 reset=0;
#100 start_i2c=1;
#10 start_i2c=0;
fork
`i2cfm.waitstart;
`i2cfm.measuresclk;
`i2cfm.listen_acknowledge(1,24'b101010100011110011000011);
join
`i2cfm.waitend;
#300000 start_i2c=1;
#100 start_i2c=0;
#300000 start_i2c=1;
#100 start_i2c=0;
#150000 reset=1;
#100 reset=0;


#4000000 $finish(); 

end


endmodule
