`timescale 1ns/100ps

module testadcdac();
	
	reg clk, reset, adcdat;
	reg [31:0] dacdin;
	
	wire m_clk_p,m_clk, b_clk, b_clk_p, daclrclk, adclrclk, dacdat, load_done_tick;
	wire [31:0] dacdout, dacdout_p;
	
	/*adc_dac c_i
   (
    .clk(clk), .reset(reset), .dac_data_in(dacdin), .adc_data_out(dacdout), .m_clk(m_clk), .b_clk(b_clk), .dac_lr_clk(daclrclk), 
    .adc_lr_clk(adclrclk), .dacdat(dacdat), .adcdat(adcdat), .load_done_tick(load_done_tick)
   );*/
   
	daccc c_i2(.clk(clk), .reset(reset), .dac_data_in(dacdin), .adc_data_out(dacdout_p), .adcdat(adcdat), .m_clk(m_clk_p),
	 .b_clk(b_clk_p), .dac_lr_clk(dacclrclk), .adc_lr_clk(adcclrclk), .dacdat(dacdat_p), .flancadcclk(load_done_tick_p));
	
	always #10 clk = ~clk;

	initial
	begin
	clk = 0;
	reset = 1;
	dacdin = 32'b10101010110011001010101011001100;
	adcdat = 0;
	
	#100 reset =0;
		
	#1000 reset =1;
	#100 reset= 0;
		adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	#640 adcdat = 0;
	#640 adcdat = 1;
	
	
	#400000 $finish(); 
	
	end
	
endmodule
