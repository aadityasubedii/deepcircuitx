		assign adc_sck = !clk_1MHz & !adc_cs;
		assign sdata_to_adc = adc_din;
		assign data_valid = adc_cs;
endmodule