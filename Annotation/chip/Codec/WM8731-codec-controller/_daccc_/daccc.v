module daccc(clk, reset, dac_data_in, adc_data_out, adcdat, m_clk, b_clk, dac_lr_clk, adc_lr_clk, dacdat, flancadcclk,dac_fifo_empty,adc_fifo_full);

	 input clk, reset, adcdat;
    input [31:0] dac_data_in;
    input dac_fifo_empty, adc_fifo_full;
    output [31:0] adc_data_out;
    output m_clk, b_clk, dac_lr_clk, adc_lr_clk, dacdat, flancadcclk;
    
    wire flancbclk, flancadcclk, flanc_p_bclk, m_clk, b_clk, dac_lr_clk, adc_lr_clk, dacdat, adcclk;
    wire [31:0] adc_data_out;
    
    //Generador de mclk i bclk
    mclkgen m_i (.clk(clk),.reset(reset),.mclk(m_clk),.bclk(b_clk));
    
    //Detector de flancs de baixada de b_clk
    dflancb detfb_bclk_i (.clk(clk), .reset(reset), .in(b_clk), .flanc(flancbclk));
	
	//Generador de adcclk. Comptador habilitat pel flanc de baixada de b_clk
	adcclkgen2 clkgen_i (.clk(clk), .reset(reset), .tin(flancbclk), .adcclk(adcclk));
    
    //Detector de flancs de pujada de adcclk per indicar que podem carregar nova dada
    dflancp detfp_adcclk_i (.clk(clk), .reset(reset), .in(adcclk), .flanc(flancadcclk));
    
    //Shift register per enviar les dades
    shiftreg32b shout (.clk(clk), .reset(reset), .shift(flancbclk), .carrega(flancadcclk), .in(dac_data_in), .regout(dacdat));
    
    //Shift register per rebre les dades. La dada és estable quan hi ha un flanc de pujada de bclk
    //Així que primer posem un detector de flanc de pujada, per indicar quan es podrà llegir la dada
    
    dflancp detfp_bclk_i (.clk(clk), .reset(reset), .in(b_clk), .flanc(flanc_p_bclk));
    shiftreg32bsp shiftin (.clk(clk), .reset(reset), .shift(flanc_p_bclk), .in(adcdat), .missatge(adc_data_out));
    
    
	assign dac_lr_clk = adcclk;
	assign adc_lr_clk = adcclk;
	
 	

endmodule
