
`timescale 1 ns / 100 ps
module tb();
reg  reset_n;
wire FPGA_I2C_SCLK;
wire FPGA_I2C_SDAT;
reg clk;
wire current_state[3:0] ;
I2Cstate U0(
	.FPGA_I2C_SCLK (FPGA_I2C_SCLK),
	.FPGA_I2C_SDAT (FPGA_I2C_SDAT),
	.clk (clk),
	.reset_n (reset_n)
);
/*
Digital_Audio_Interface U0(
    reset_n (reset_n),
    AUD_DACDAT (AUD_DACDAT),
    AUD_DACLRCK (AUD_DACDAT),
    AUD_BCLK (AUD_BCLK)

);
*/



always
    #10 clk = ~clk;
initial 
    begin
        //give initial values and trigger reset cycle
        clk = 0;
        reset_n = 0;
        #20 
        reset_n = 1;
        $display ($time ,"Starting Simulation of Lab 1.");
        #20000 
        reset_n = 0;
       
        #25000
            //Start again
        reset_n = 1; 
        
       
        #35000
            $display ($time ,"Work Done");

    end
endmodule 