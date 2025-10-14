`timescale 1ns/100ps

`include "global.v"

`define SYSRST            I_tb_codec_top.I_sys_rst_fm
`define CLK50M            I_tb_codec_top.I_sys_clk50MHz_fm
`define I2CFM             I_tb_codec_top.I_sys_i2c_fm
`define DACFM             I_tb_codec_top.I_dac_fm
`define ADCFM             I_tb_codec_top.I_adc_fm
`define MASTER            I_tb_codec_top.I_master_bus_fm


module test_codec_top();

   //La variable error en la que anirem sumant els errors
  integer error;
  
  
  reg [31:0] dades_adc [0:11];
  reg [383:0] dades_a_enviar;
  
  
tb_codec_top I_tb_codec_top();

initial
begin
  error=0;
   `SYSRST.rstOn;
   
   `CLK50M.waitCycles(10);   
   `SYSRST.rstOff;
   
  dades_adc[0] =$random($random);
  dades_adc[1] =$random($random);
  dades_adc[2] =$random($random);
  dades_adc[3] =$random($random);
  dades_adc[4] =$random($random);
  dades_adc[5] =$random($random);
  dades_adc[6] =$random($random);
  dades_adc[7] =$random($random);
  dades_adc[8] =$random($random);
  dades_adc[9] =$random($random);
  dades_adc[10] =$random($random);
  dades_adc[11] =$random($random);
  
	dades_a_enviar = {dades_adc[0],dades_adc[1],dades_adc[2],dades_adc[3],dades_adc[4],dades_adc[5],dades_adc[6],dades_adc[7],
	                    dades_adc[8],dades_adc[9],dades_adc[10],dades_adc[11]};
   testadc2;
   testadc(dades_a_enviar);
   testdac;
   testi2c;
   `ADCFM.measuresclk;
   check_error;
   
      
#1000000 $finish(); 

end


task ADC_get_ready;
	input [383:0] dades_enviar;
	reg [31:0] dades_adc [0:11];
	integer i;
	
	
	begin
	
	dades_adc[0] =dades_enviar[31:0];
	dades_adc[1] =dades_enviar[63:32];
	dades_adc[2] =dades_enviar[95:64];
	dades_adc[3] =dades_enviar[127:96];
	dades_adc[4] =dades_enviar[159:128];
	dades_adc[5] =dades_enviar[191:160];
	dades_adc[6] =dades_enviar[223:192];
	dades_adc[7] =dades_enviar[255:224];
	dades_adc[8] =dades_enviar[287:256];
	dades_adc[9] =dades_enviar[319:288];
	dades_adc[10] =dades_enviar[351:320];
	dades_adc[11] =dades_enviar[383:352];
	
	
	
	i = 0;
	`ADCFM.adcwrite(32'hFFFFAAAA);
	
	fork
		repeat(12) begin
			`ADCFM.adcwrite(dades_adc[i]);
			i = i+1;
		end
		while(`MASTER.readData != 32'hFFFFAAAA) begin
			`MASTER.simpleRead(`ADDR_ADC_AUDIO);
		end
	join
	i = 0;
	repeat(11) begin
		checkReceivedADC(dades_adc[i]);
		i = i+1;
	end
	end
endtask

task checkReceivedADC;

input[31:0] dataToReceive;

 begin
  
     `MASTER.simpleRead(`ADDR_ADC_AUDIO);
 if (dataToReceive != `MASTER.readData) begin
                        $display("ADC: Error, transmitted data %h is not the expected value %h", `MASTER.readData, dataToReceive);
                        error = error +1;
                        end
   else $display("ADC: Correct, transmitted data %h is the expected value %h", `MASTER.readData, dataToReceive);
  end
  
endtask


task transmitADC_and_check;

  input[31:0] dataToTransmit;
  
  begin
   `ADCFM.adcwrite(dataToTransmit);
   checkReceivedADC(dataToTransmit);
  end
 
endtask


task transmitDAC_and_check;

  input[31:0] dataToTransmit;
  
  begin
   `MASTER.setDACaudio(dataToTransmit);
   `DACFM.dacread(dataToTransmit);
  end
endtask


task transmitI2C_and_check;

  input[23:0] dataToTransmit;
  
  begin
   `MASTER.seti2cpacket(dataToTransmit);
   `I2CFM.listen_acknowledge(1,dataToTransmit);
   end
endtask


task check_error;
 begin
   if (error != 0) $display("Test unsuccessful, %d errors", error);
   else $display("Test successful, %d errors", error);
 end
endtask

task testdac;
  begin
    $display("Starting test DAC");
    //`DACFM.measuresclk;
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random)); 
    `SYSRST.rstOn;
    `CLK50M.waitCycles(10);    
    `SYSRST.rstOff;
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random));
    transmitDAC_and_check($random($random)); 
    check_error;
  end
 endtask
 
task testadc;
input reg [383:0] dades_adc;
  begin
    $display("Starting test ADC");
    //`ADCFM.measuresclk;
    ADC_get_ready(dades_adc);
    check_error;
  end
 endtask

task testadc2;
  begin
    $display("Starting test ADC 2");
    //`ADCFM.measuresclk;
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));
    transmitADC_and_check($random($random));   
    check_error;
  end
 endtask

task testi2c;
  begin
    $display("Starting test I2C");
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    `SYSRST.rstOn;
    `CLK50M.waitCycles(10);   
    `SYSRST.rstOff;
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    transmitI2C_and_check($random($random));
    check_error;
  end
 endtask
 
endmodule 
