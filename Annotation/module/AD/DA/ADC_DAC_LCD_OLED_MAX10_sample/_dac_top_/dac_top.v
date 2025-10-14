

module dac_top
(
//******************************************
//***** PINOUT
//******************************************
	input  iClk,									//pin N14	50 MHz

//Buttons
	input  [3:0] iBtn, 							//pin AB5,V5,R1,M1
	
//Leds
	output [7:0] oLed,							//pin AA5,AB4,T6,V4,T1,R2,N1,M2 

	
//DAC
	output oDacReset,								//pin L15
	output oDacLatch,								//pin N18
	output oDacSync,								//pin N19
	output oDacScl,								//pin G17
	output oDacSda,								//pin H17
	
	//test
	output testOut,								//pin AA15 (J4-5)
	
//OLED display SSD1306 0,49" I2C
	inout  ioScl,									//pin P18 (U6-7) 
	inout  ioSda,									//pin R18 (U6-5) 

//Display
	output [2:0]  oDispCom,						//pin B3,C3,B2
	output [23:0] oDispSeg						//pin B1,A2,A3,B4,A4,B5,A5,B7,A6,A7,A8,B8,E12,D13,D14,E13,A14,B14,C14,C13,H14,J13,D17,C17

);






//******************************************
//***** VARIABLES
//******************************************
	wire clk;
	wire clk_10k;
	wire clk_50M;
	wire rst;
	wire btnRst;
	wire btnUp, btnUp_i;
	wire btnDwn, btnDwn_i;
	wire btnHold;
	wire btnMidScale, btnMidScale_i;
	reg  stepMode = 0;
	wire stepModeClk;
	wire dacStart;
	reg  [12:0] dacData = 0;
	reg  holdCycle = 0;
   reg  [31:0] holdCnt = 0;
	wire [11:0] adcData;
	wire adcStart;



//******************************************
//***** CONNECTIONS
//******************************************

//PLL
	wire pll_locked;
	pll MAIN_PLL (.inclk0(iClk), .c0(clk_50M), .c1(clk), .c2(clk_10k)); // c0 = 50 MHz; c1 = 10 MHz; c2 = 10 kHz

//ADC_pll_clock_clk
	wire adc_clk;
	wire adc_pll_locked;
	adc_pll ADC_PLL (.inclk0(clk_50M), .c0(adc_clk)); // c0 = 10 MHz; 
	
	

	assign rst = btnRst;
	assign oDacReset = ~rst;
	assign oLed[1:0] = {~btnRst, ~btnRst};
	assign oLed[3:2] = {~btnUp, ~btnUp};
	assign oLed[5:4] = {~btnDwn, ~btnDwn};
	assign oLed[7:6] = {~btnMidScale, ~stepMode};
	
	assign adcStart = 1'b1;

	assign testOut = adcSampleReady;
	
//******************************************
//***** BUTTONS
//******************************************	
	delay    BTN_RST (.clk(clk_10k), .pin(~iBtn[0]), .pout(btnRst));
	defparam BTN_RST.N = 10; // delay 100 ms 
	
	delay    BTN_UP (.clk(clk_10k), .pin(~iBtn[1]), .pout(btnUp));
	defparam BTN_UP.N = 10; // delay 100 ms 	
	
	delay    BTN_DWN (.clk(clk_10k), .pin(~iBtn[2]), .pout(btnDwn));
	defparam BTN_DWN.N = 10; // delay 100 ms 	
	
	delay    BTN_MIDSCALE (.clk(clk_10k), .pin(~iBtn[3]), .pout(btnMidScale));
	defparam BTN_MIDSCALE.N = 10; // delay 100 ms 

	delay    BTN_UP_HOLD (.clk(clk_10k), .pin(btnUp | btnDwn), .pout(btnHold));
	defparam BTN_UP_HOLD.N = 13; // delay 800 ms 
	
	delay    STEP_MODE (.clk(clk_10k), .pin(btnMidScale), .pout(stepModeClk));
	defparam STEP_MODE.N = 13; // delay 800 ms 

	one_shot BTN_UP_SHOT  (.clk(~clk), .din(btnUp), .dout(btnUp_i));
	one_shot BTN_DWN_SHOT (.clk(~clk), .din(btnDwn), .dout(btnDwn_i));
	one_shot BTN_MID_SHOT (.clk(~clk), .din(btnMidScale), .dout(btnMidScale_i));
	
	one_shot DAC_START(.clk(clk_10k), .din(btnUp | btnDwn | btnMidScale), .dout(dacStart));
	defparam DAC_START.EDGE = 1; // back edge detect
	


	
	
	always @(posedge stepModeClk)
	begin
		stepMode <= ~stepMode;
	end
	
	
	
	
	
	

	always @(posedge rst or posedge clk)
	begin
		if(rst)
		begin
			holdCycle <= 0;
			holdCnt <= 0;
		end
		else begin
			if(btnHold)
			begin
				if(holdCnt == 50000)
				begin
					holdCycle <= 1'b1;
					holdCnt <= holdCnt + 1'b1;
				end
				else if(holdCnt >= (50000 + 1))
				begin
					holdCycle <= 0;
					holdCnt <= 0;
				end
				else begin
					holdCnt <= holdCnt + 1'b1;
				end
			end
			else begin
				holdCycle <= 0;
				holdCnt <= 0;
			end
		end
	end


	
	
	always @(posedge rst or posedge clk)
	begin
		if(rst)
		begin
			dacData <= 0;
		end
		else begin
			if(stepMode)
			begin
				if(btnMidScale_i)	
				begin
					dacData <= 13'd2040;
				end
				else if(btnUp_i)
				begin
					if(dacData >= 13'd4080) dacData <= 0;
					else dacData <= dacData + 8'd85;
				end
				else if(btnDwn_i)
				begin
					if(dacData == 0) dacData <= 13'd4080;
					else dacData <= dacData - 8'd85;
				end
			end
			else begin
				if(btnMidScale_i)	dacData <= 13'd2048;
				else if(btnUp_i || btnUp && holdCycle)	dacData <= dacData + 1'b1;
				else if(btnDwn_i || btnDwn && holdCycle) dacData <= dacData - 1'b1;
			end
		end
	end
	
	

//******************************************
//***** DAC DRIVER
//******************************************
	ad5681_driver DAC_DRIVER
	(
		.clk(clk), 
		.rst(rst), 
		.iData({4'h3, dacData[11:0], 8'h0}), 
		.iStart(dacStart), 
		.oSync(oDacSync), 
		.oScl(oDacScl), 
		.oSda(oDacSda), 
		.oLdac(oDacLatch)
	);


	
//******************************************
//***** ADC DRIVER	9 CH
//******************************************	
	wire adcEndOfConvert;
	wire adcClkOut;


	fiftyfivenm_adcblock_top_wrapper ADC_DRIVER
	(
		.chsel(5'd9),           
		.soc(adcStart),             
		.eoc(adcEndOfConvert),             
		.dout(adcData),            
		.usr_pwd(rst),         
		.tsen(stepMode),            
		.clkout_adccore(adcClkOut),  
		.clkin_from_pll_c0(adc_clk)
	);
	defparam ADC_DRIVER.clkdiv = 5;
	defparam ADC_DRIVER.tsclkdiv = 0;
	defparam ADC_DRIVER.tsclksel = 0;
	defparam ADC_DRIVER.refsel = 0;
	defparam ADC_DRIVER.hard_pwd = 0;


//******************************************
//***** MOVING AVERAGE FILTER
//******************************************	
	reg adcSampleReady, adcSampleReady_i;
	wire [11:0] adcFilterData;
	wire adcFilterReady;

	always @(posedge clk)
	begin
		adcSampleReady_i <= adcEndOfConvert;
		adcSampleReady <= adcSampleReady_i;
	end
	
	
	movingAverage ADC_FILTER
	(
		.clk(clk), 
		.rst(1'b0),  			 
		.iDataIn(adcData), 
		.iSampleReady(adcSampleReady), 
		.iFilterWidth(12'd2000), 
		.oDataOut(adcFilterData), 
		.oDataReady(adcFilterReady)
	);


	
//******************************************
//***** ADC DATA SCALING
//******************************************		
	reg signed [12:0] adcScaleData_i;
	reg [11:0] adcScaleData;
	
	
	
	always @(posedge clk)
	begin
		adcScaleData_i <= adcFilterData - 12'h129;
		adcScaleData   <= adcScaleData_i[12] ? 12'h0 : adcScaleData_i[11:0];
	end
	


//******************************************
//***** DISPLAY
//******************************************	

//---DAC---
	reg [31:0] extDacData, extDacData_i;
	wire [23:0] bcdDacData;

	
	always @(posedge clk)
	begin
		extDacData_i <= dacData[11:0] * 1000;
		extDacData   <= extDacData_i / 1638;
	end
	
	
	bin_to_bcd BCD_DAC_DATA (.iBIN(extDacData[19:0]), .oBCD(bcdDacData));


	
//---ADC---
	reg [31:0] extAdcData, extAdcData_i;
	wire [23:0] bcdAdcData;

	
	always @(posedge clk)
	begin
		extAdcData_i <= adcScaleData * 2450;
		extAdcData   <= extAdcData_i / 4095;
	end
	
	
	bin_to_bcd BCD_ADC_DATA (.iBIN(extAdcData[19:0]), .oBCD(bcdAdcData));
	

	
	



//******************************************
//***** DISPLAY LCD
//******************************************	
	lcd24x3 DISPLAY_LCD
	(
		.clk(clk),
		
		.iChar7({1'h0, bcdDacData[15:12]}),
		.iChar6({1'h0, bcdDacData[11: 8]}),
		.iChar5({1'h0, bcdDacData[7 : 4]}),
		.iChar4({1'h0, bcdDacData[3 : 0]}),
		.iChar3( 5'h10),
		.iChar2({1'h0, bcdAdcData[15:12]}),
		.iChar1({1'h0, bcdAdcData[11: 8]}),
		.iChar0({1'h0, bcdAdcData[7 : 4]}),
		
		.iPoint(8'b10000100),
		
		.oCom(oDispCom),
		.oSeg(oDispSeg)

	);
	defparam DISPLAY_LCD.Fclk = 10000; 		
	defparam DISPLAY_LCD.Contrast = 8;


	
	

	
	
//******************************************
//***** DISPLAY OLED
//******************************************		
	wire dispBusy;
	wire ackErr;

	
	OledControl DISPLAY_OLED
	(
		.clk(clk), 
		.rst(rst),
		.iMode(stepMode),
		.iBcdDada(bcdDacData[15:0]),
		.iSelect(btnUp_i),
		
		.oAckErr(ackErr),
		.oDispBusy(dispBusy),
		
		.ioScl(ioScl),
		.ioSda(ioSda)
		
	);	
	defparam  DISPLAY_OLED.FCLK = 10000; 					
	defparam  DISPLAY_OLED.I2C_SPEED = 390;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	




endmodule






