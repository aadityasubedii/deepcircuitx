//##########################################
//####			    							 ####
//####		   SSD1306						 ####
//####			    							 ####
//##########################################


module  oledDriver 
(
//******************************************
//***** PINOUT
//******************************************
	input	 clk, 
	input	 rst, 
//Symbol
	input  			iMode,
	input  [1:0]   iPlaceHolder,
	input  [4:0]	iChar,
	input	 	  		iDraw,
	
	output 			oBusy,
	output 			oAckErr,
	
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
	reg  [3:0]  state = 0;
	reg  [3:0]  next_state = 0;
	reg  [31:0] cnt = 0;
	reg 			busy = 0;
	reg  [3:0]  dataSelect = 0;
	reg  [7:0]  symbolCmd = 0;
	reg  [2:0]  page = 0;

//I2C
	reg  start = 0;
	wire [10:0] byteQnty [7:0];
	wire [7:0]  dispData [7:0];
	wire [10:0] dispAddr;
	wire ackErr;
	wire action;
	


	
//******************************************
//***** CONNECTIONS
//******************************************
	assign oBusy = busy;


	
	



//******************************************
//***** I2C BUS
//******************************************

	i2cWR I2C_BUS
	(
		.clk(clk), 
		.rst(rst), 
		.ioSda(ioSda), 
		.ioScl(ioScl), 
		.iDevID(7'h3C), 
		.iStart(start), 
		.iByteQnty(byteQnty[dataSelect]), 
		.iByteIn(dispData[dataSelect]),  
		.oByteCnt(dispAddr), 
		.oAckErr(oAckErr), 
		.oAction(action)
	);
	defparam I2C_BUS.FCLK = FCLK; 
	defparam I2C_BUS.SPEED = I2C_SPEED;	





//******************************************
//***** OLED INITIALIZATION				dataSelect = 0
//******************************************
	OledInit OLED_INIT (.clock(clk),	.address(dispAddr[5:0]), .q(dispData[0]));
	assign byteQnty[0] = 11'd24;


//******************************************
//***** LOGO									dataSelect = 1
//******************************************
	OledLogo OLED_LOGO (.clock(clk),	.address(dispAddr[8:0] + byteQnty[1][8:0] * page), .q(dispData[1]));
	assign byteQnty[1] = 11'd71;


	
//******************************************
//***** SYMBOL COMMAND						dataSelect = 2
//******************************************
	assign dispData[2] = symbolCmd;
	assign byteQnty[2] = 11'd6;

	always @*
	begin
		case(dispAddr)
					 0: symbolCmd = 8'h80;
					 1: symbolCmd = iMode ? 8'h00 : iPlaceHolder * 8'h05;	//Set Lower Column Start Address
					 2: symbolCmd = 8'h80;
					 3: symbolCmd = 8'h12 + iPlaceHolder;	//Set Higher Column Start Address
					 4: symbolCmd = 8'h80;
					 5: symbolCmd = 8'hB0 + page;//Set Page Start Address
			 default: symbolCmd = 8'h00;
		endcase
	end
	

//******************************************
//***** MAIN FONT     						dataSelect = 3
//******************************************	
	MainFont MAIN_FONT (.clock(clk),	.address(dispAddr + byteQnty[3] * page + byteQnty[3] * 3'd4 * iChar), .q(dispData[3]));
	assign byteQnty[3] = 11'd22;

	
	
//******************************************
//***** EXTENDED FONT     					dataSelect = 4
//******************************************	
	ExtFont EXT_FONT (.clock(clk),	.address(dispAddr + byteQnty[4] * page + byteQnty[4] * 3'd4 * iChar), .q(dispData[4]));
	assign byteQnty[4] = 11'd17;


	
//******************************************
//***** dataSelect = 5...7
//******************************************
	assign dispData[5] = 0;	assign byteQnty[5] = 0;
	assign dispData[6] = 0;	assign byteQnty[6] = 0;
	assign dispData[7] = 0;	assign byteQnty[7] = 0;







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
			0: //Reset
			begin
				next_state = 1;
			end
			1: //Delay 50 ms
			begin
				if(cnt >= (FCLK * 50)) next_state = 2;
				else next_state = 1;
			end
			2: //Start display initialization
			begin
				if(action) next_state = 3;
				else next_state = 2;
			end
			3:
			begin
				if(!action) next_state = 4;
				else next_state = 3;
			end
			4: //Display Logo
			begin
				if(action) next_state = 5;
				else next_state = 4;
			end
			5: 
			begin
				if(!action) next_state = 6;
				else next_state = 5;
			end
			6:
			begin
				if(page == 4) next_state = 7;
				else next_state = 4;
			end
			7: //Delay 2 s with Logo
			begin
				if(cnt >= (FCLK * 2000)) next_state = 8;
				else next_state = 7;
			end
			8: //Wait command
			begin
				if(iDraw) next_state = 9;
				else next_state = 8;
			end
			9: //Placeholder select
			begin
				if(action) next_state = 10;
				else next_state = 9;
			end
			10:
			begin
				if(!action) next_state = 11;
				else next_state = 10;
			end
			11: //Draw character
			begin
				if(action) next_state = 12;
				else next_state = 11;
			end
			12:
			begin
				if(!action) next_state = 13;
				else next_state = 12;
			end
			13:
			begin
				if(page == 4) next_state = 14;
				else next_state = 9;
			end
			14:
			begin
				if(!iDraw) next_state = 8;
				else next_state = 14;
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
				start <= 0;
				busy <= 0;
				dataSelect <= 0;
				page <= 0;
			end	
			1:
			begin
				cnt <= cnt + 1'b1;
				busy <= 1'b1;
			end
			2:
			begin
				cnt <= 0;
				start <= 1'b1;
			end
			3:
			begin
				start <= 0;
			end
			4:
			begin
				dataSelect <= 4'd1;
				start <= 1'b1;
			end
			5:
			begin
				start <= 0;
			end
			6:
			begin
				page <= page + 1'b1;
			end
			7:
			begin
				page <= 0;
				cnt <= cnt + 1'b1;
			end
			8:
			begin
				cnt <= 0;
				busy <= 0;
			end
			9:
			begin
				dataSelect <= 4'd2;
				busy <= 1'b1;
				start <= 1'b1;
			end
			10:
			begin
				start <= 0;
			end
			11:
			begin
				dataSelect <= iMode ? 4'd4 : 4'd3; 
				start <= 1'b1;
			end
			12:
			begin
				start <= 0;
			end
			13:
			begin
				page <= page + 1'b1;
			end
			14:
			begin
				page <= 0;
			end
			

			
			
			
			

		endcase
	end	
	
	
	

endmodule






