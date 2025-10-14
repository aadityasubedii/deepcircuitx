module controlador(clk, reset, i2c_sclk, i2c_sdat, adcdat,
					m_clk, b_clk, dac_lr_clk, adc_lr_clk, 
					dacdat, i2c_packet, wr_i2c, i2c_idle,
					adc_fifo_out, rd_adc_fifo, adc_fifo_empty,
					dac_fifo_in, wr_dac_fifo, dac_fifo_full,adc_fifo_full);
					
	input clk, reset, adcdat, wr_i2c, rd_adc_fifo, wr_dac_fifo;
	input [23:0] i2c_packet;
	input [31:0] dac_fifo_in;
	
	output i2c_sclk, m_clk, b_clk, dac_lr_clk, adc_lr_clk,
			dacdat, i2c_idle, adc_fifo_empty, dac_fifo_full,adc_fifo_full;
	
	output [31:0] adc_fifo_out;
	
	inout i2c_sdat;
	
	wire [31:0] dac_data_in, adc_data_out;
	wire dac_done_tick,dac_fifo_empty;
	
	/*
	//ADC_DAC
	adc_dac I_adc_dac(.clk(clk), .reset(reset), .dac_data_in(dac_data_in), .adc_data_out(adc_data_out), .adcdat(adcdat), .m_clk(m_clk),
	 .b_clk(b_clk), .dac_lr_clk(dac_lr_clk), .adc_lr_clk(adc_lr_clk), .dacdat(dacdat), .load_done_tick(dac_done_tick));
	*/
	
	//ADC_DAC
	daccc adc_dac (.clk(clk), .reset(reset), .dac_data_in(dac_data_in), .adc_data_out(adc_data_out), .adcdat(adcdat), .m_clk(m_clk),
	 .b_clk(b_clk), .dac_lr_clk(dac_lr_clk), .adc_lr_clk(adc_lr_clk), .dacdat(dacdat), .flancadcclk(dac_done_tick),.dac_fifo_empty(dac_fifo_empty),.adc_fifo_full(adc_fifo_full));
	
	 
	//I2C
	i2cc i2cc_i(.clk(clk), .reset(reset), .din(i2c_packet), .wr_i2c(wr_i2c), .i2c_sclk(i2c_sclk), .i2c_sdat(i2c_sdat), .i2c_idle(i2c_idle));
	 
	 
	//FIFO ADC
	fifo I_fifo_adc (.clk(clk), .reset(reset), .rd(rd_adc_fifo), .wr(dac_done_tick), .w_data(adc_data_out), .empty(adc_fifo_empty), 
	.full(adc_fifo_full), .r_data(adc_fifo_out));
	 
	//FIFO DAC
	fifo I_fifo_dac (.clk(clk), .reset(reset), .rd(dac_done_tick), .wr(wr_dac_fifo), .w_data(dac_fifo_in), . empty(dac_fifo_empty), .full(dac_fifo_full),
	.r_data(dac_data_in));
	
	   
endmodule
