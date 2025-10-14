

module OledControl 
(
//******************************************
//***** PINOUT
//******************************************
	input clk, 
	input rst,

	input iMode,
	input [15:0] iBcdDada,
	input iSelect,
	
	output oAckErr,
	output oDispBusy,
	
	inout  ioScl,
   inout  ioSda
	
);


//******************************************
//***** PARAMETERS
//******************************************
	parameter FCLK = 10000; 					// [kHz]  50_000 kHz max
	parameter I2C_SPEED = 390;					// [kHz]	 100 kHz min




//******************************************
//***** VARIABLES
//******************************************
	reg  [2:0]  state = 0;
	reg  [2:0]  next_state = 0;
	reg  [31:0]  cnt = 0;
	
	wire dispBusy;
	reg  [1:0] placeHolder = 0;
	reg  [4:0] symbol = 0;
	reg  drawSymbol = 0;
	wire [4:0] displayData [3:0];
	reg  [2:0] marker = 0;
	
	
	
//******************************************
//***** CONNECTIONS
//******************************************
	assign oDispBusy = dispBusy;	
	assign displayData[0] = iMode ? marker == 3'd1 ? iBcdDada[15:12] + 5'd16 : iBcdDada[15:12] : iBcdDada[15:12];
	assign displayData[1] = iMode ? marker == 3'd2 ? iBcdDada[11: 8] + 5'd16 : iBcdDada[11: 8] : iBcdDada[11: 8];
	assign displayData[2] = iMode ? marker == 3'd3 ? iBcdDada[7 : 4] + 5'd16 : iBcdDada[7 : 4] : iBcdDada[7 : 4];
	assign displayData[3] = iMode ? marker == 3'd4 ? iBcdDada[3 : 0] + 5'd16 : iBcdDada[3 : 0] : 5'd16;   
	
	always @(posedge rst or posedge iSelect)
	begin
		if(rst) 
		begin 
			marker <= 0;
		end
		else begin
			if(marker >= 4) marker <= 0;
			else marker <= marker + 1'b1;
		end
	end
	

//******************************************
//***** DISPLAY DRIVER
//******************************************
	oledDriver OLED_DRIVER
	(
		.clk(clk), 
		.rst(rst), 
	   
		.iMode(iMode),
		.iPlaceHolder(placeHolder),						
	   .iChar(symbol),
	   .iDraw(drawSymbol),	
		
		.oBusy(dispBusy),
		.oAckErr(oAckErr),
		
		.ioScl(ioScl), 
		.ioSda(ioSda)
		
	);
	defparam  OLED_DRIVER.FCLK = FCLK; 					
	defparam  OLED_DRIVER.I2C_SPEED = I2C_SPEED;




//******************************************
//***** FSM
//******************************************
	always @(posedge rst or posedge clk) 
	begin
		if(rst) state <= 0;
		else state <= next_state;
	end
	
	always @(*)
	begin
		case(state)
			0://Reset
			begin
				next_state = 1;
			end
			1://Logo
			begin
				if(dispBusy) next_state = 2;
				else next_state = 1;
			end
			2:
			begin
				if(!dispBusy) next_state = 3;
				else next_state = 2;
			end
			3://Dislpay data
			begin
				if(dispBusy) next_state = 4;
				else next_state = 3;
			end
			4:
			begin
				if(!dispBusy) next_state = 5;
				else next_state = 4;
			end
			5:
			begin
				if(placeHolder == 0) next_state = 6;
				else next_state = 3;
			end
			6://Delay 50 ms
			begin
				if(cnt >= (FCLK * 50)) next_state = 3;
				else next_state = 6;
			end
			
			
			
			


			default: next_state = 0;
		endcase
	end


	
	
//State handler
	always @(negedge clk)
	begin
		case(state)		
			0: 		
			begin
				cnt <= 0;
				placeHolder <= 0;
				symbol <= 0;
				drawSymbol <= 0;
			end	
			3:
			begin
				symbol <= displayData[placeHolder];
				drawSymbol <= 1'b1;
				cnt <= 0;
			end
			4:
			begin
				drawSymbol <= 0;
			end
			5:
			begin
				placeHolder <= placeHolder + 1'b1;
			end
			6:
			begin
				cnt <= cnt + 1'b1;
				placeHolder <= 0;
			end
	
	

		endcase
	end	
		
	
	
	
	
	
	
	






endmodule


