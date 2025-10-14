`timescale 1ns/100ps

module sys_i2c_fm (i2c_sdat, i2c_sclk);
	inout i2c_sdat;
	input i2c_sclk;
	
	wire akn;
	reg akn_reg;

//Si sda en i2cc = 1, el bus a 1 o 0 segons akn. Si 0, 0.
	assign i2c_sdat = (I_codec_avalon.I_controlador.i2cc_i.sda) ? akn : 0 ;
	
	assign akn = akn_reg;
	
	initial begin
	akn_reg = 1;
	end

task waitstart;
/* 
El MF espera el senyal d'inici: i2c_sdat = 0 mentre i2c_sclk = 1
*/
	
	fork : timeout
      begin
         // Timeout check
         #100000
         $display("%t : timeout, no START received", $time);
         $finish();
         disable timeout;
      end
      begin
         // Wait on Start
         @(negedge i2c_sdat);
         if (i2c_sclk == 1) $display("%t : START signal received", $time);
         else begin
         $display("%t : Bad START signal", $time);
         $finish();
         end
         disable timeout;
      end
   join
endtask

task measuresclk;
	time tempsflanc[1:5], period[1:4];
	real frequency;
	integer i;
	
	begin
	i = 0;
	
	repeat(5) begin
	@(posedge i2c_sclk)
		begin
		i = i+1;
		tempsflanc[i] = $realtime;
		if (i>1) period[i-1] = tempsflanc[i] - tempsflanc[i-1];
		end
	end
	i = 1;
	repeat(3) begin
	//$display("Period %i = %t ", i,period[i]);
	if (period[i+1] != period [i]) $display("Error! Variable Period for i2c_sclk!");
	i = i+1;
	end
	
	frequency = 1/(period[1]*1e-7);
	$display("Measured frequency = %f KHz", frequency);
	end
endtask

task listen_acknowledge;
	//La funció mostreja la dada a cada flanc de pujada de i2c_sclk i compara amb el valor esperat
	//Si l'input "ackno" = 1, la funció fa acknowledge de forma adecuada. Si no, no...
	
	input ackno;
	input [23:0] data_sent;
	//output [7:0] received_data;
	reg [23:0] received_data;
	
	
	time temps[1:24];
	
	integer i,nb;
	
	if (ackno)
	begin
		i = 0;
		repeat(3) begin
			repeat(8) begin
			@(posedge i2c_sclk)
				temps[i] = $realtime;
				received_data[23-i] = i2c_sdat;
				if (received_data[23-i] === 1'bz) received_data[23-i] = 1'b1;
				if (received_data[23-i] !== data_sent[23-i]) begin
					$display("At %t: Transmission error, bit %d lost! Received %b, should be %b",temps[i],i,received_data[23-i],data_sent[23-i]);
					test_codec_top.error = test_codec_top.error+1;
				end
				else $display("At %t: received %b, ok",temps[i],received_data[23-i]);
				
				i = i+1;
			end
			
			
			//Acknowledge
			@(negedge i2c_sclk)
			akn_reg = 0;
			
			
			//Free bus after ack bit
			@(negedge i2c_sclk)
			akn_reg = 1;
			
		end
	
	end
	else begin
		i = 0;
		
		repeat(8) begin
			@(posedge i2c_sclk)
				temps[i] = $realtime;
				received_data[23-i] = i2c_sdat;
				if (received_data[23-i] === 1'bz) received_data[23-i] = 1'b1;
				if (received_data[23-i] !== data_sent[23-i]) begin
					$display("At %t: Transmission error, bit %d lost! Received %b, should be %b",temps[i],i,received_data[23-i],data_sent[23-i]);
					test_codec_top.error = test_codec_top.error+1;
				end
				else $display("At %t: received %b, ok",temps[i],received_data[23-i]);
				
				i = i+1;
		end
		
		$display("Failing to acknowledge at %t!",temps[i]);
		//NoAcknowledge
			@(negedge i2c_sclk)
			akn_reg = 1;
			
			//Free bus after ack bit
			@(negedge i2c_sclk)
			akn_reg = 1;
		
	end
endtask

task waitend;
/* 
El MF espera el senyal de fi
*/
	
	fork : timeout
      begin
         // Timeout check
         #100000
         $display("%t : timeout, no END received", $time);
         $finish();
         disable timeout;
      end
      begin
         // Wait on end
         @(posedge i2c_sdat);
         if (i2c_sclk == 1) $display("%t : END signal received", $time);
         else begin
         $display("%t : Bad END signal", $time);
         $finish();         
         end
         disable timeout;
      end
   join
endtask
endmodule
