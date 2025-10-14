`timescale 1ns/100ps

module adc_fm(m_clk, b_clk, adc_lr_clk, adcdat);
	
	input m_clk, b_clk, adc_lr_clk;
	
	output adcdat;
	
	reg adcdat_reg;
	
	
	task measuresclk;
	real frequency_m, frequency_b, frequency_lr;
	begin
	fork
	begin
		mesura_m_clk(frequency_m);
		mesura_b_clk(frequency_b);
		mesura_adc_lr_clk(frequency_lr);
	end
	join
	begin
	$display("Measured mclk = %f KHz", frequency_m);
	$display("Measured bclk = %f KHz", frequency_b);
	$display("Measured dac_lr_clk = %f KHz", frequency_lr);
	end
	end
	endtask
	
	task mesura_m_clk;
	output real frequency_m;
	time t1, t2;
	
	fork : timeout
      begin
         // Timeout check
         #100000
         $display("%t : timeout, no START received", $time);
         $finish();
         disable timeout;
      end
      begin
         // m_clk
         @(posedge m_clk);
         t1 = $realtime;
         @(posedge m_clk);
         t2 = $realtime;
         
         frequency_m = 1/((t2-t1)*1e-7);
         disable timeout;
      end
	join
	endtask
	
	task mesura_b_clk;
	output real frequency_b;
	time t1, t2;
	
	fork : timeout
      begin
         // Timeout check
         #100000
         $display("%t : timeout, no START received", $time);
         $finish();
         disable timeout;
      end
      begin
         // m_clk
         @(posedge b_clk);
         t1 = $realtime;
         @(posedge b_clk);
         t2 = $realtime;
         
         frequency_b = 1/((t2-t1)*1e-7);
         disable timeout;
      end
	join
	endtask
	
	task mesura_adc_lr_clk;
	output real frequency_lr;
	time t1, t2;
	
	fork : timeout
      begin
         // Timeout check
         #100000000
         $display("%t : timeout, no START received", $time);
         $finish();
         disable timeout;
      end
      begin
         // m_clk
         @(posedge adc_lr_clk);
         t1 = $realtime;
         @(posedge adc_lr_clk);
         t2 = $realtime;
         
         frequency_lr = 1/((t2-t1)*1e-7);
         disable timeout;
      end
	join
	endtask
	
	task adcwrite;
			
		input reg [31:0] data;
		integer i;
				
		begin
		i = 0;
		@(posedge adc_lr_clk)
		repeat(32) begin
		@(posedge b_clk)
				adcdat_reg = data[31-i];
				i = i+1;
		end
		end
	endtask
	
	initial
	 begin
	adcdat_reg = 0;
		end
		
	assign adcdat = adcdat_reg;
	
	
endmodule
