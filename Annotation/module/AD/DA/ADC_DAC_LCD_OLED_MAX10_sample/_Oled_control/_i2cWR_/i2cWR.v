//******************************************************
//								I2C WRITE
//						
//******************************************************

module i2cWR (clk, rst, ioSda, ioScl, iDevID, iStart, iByteQnty, iByteIn,  oByteCnt, oAckErr, oAction);

//******************************************
//***** PARAMETERS
//******************************************
	parameter FCLK = 10000; // [kHz]  50_000 kHz max
	parameter SPEED = 400;	// [kHz]	 100 kHz min
	

//******************************************
//***** PINOUT
//******************************************
	input  clk;
	input  rst;
	
	inout  ioScl;
	inout  ioSda;
	
	input  [6:0] iDevID;
	input  iStart;
	input  [10:0] iByteQnty;
	input  [7:0]  iByteIn;
	output [10:0] oByteCnt;
	output oAckErr;
	output oAction;


	

//******************************************
//***** VARIABLES
//******************************************
	wire iSda;
	wire oSda;
	wire iScl;
	wire oScl;
	reg  startBit = 0;
	wire stopBit;
	reg  stopBit_i = 0;
	wire ackBit;
	reg  ackErr = 0;
	reg  [3:0] sclkReg 	  = 4'b0110;
	reg  [3:0] shiftClkReg = 4'b0011;
	wire sclk;
	wire shiftClk;
	reg  shiftClk_i;
	reg  [7:0] TxData = 8'hFF;
	reg  [7:0]  qtCnt 	= 0;
	reg  [3:0]  bitCnt 	= 0;  
	reg  [10:0] byteCnt	= 0;
	reg  action = 0;
	reg  action_i = 0;
	wire action_posedge;
	wire shiftClk_posedge;
	wire shiftClk_negedge;


	
//******************************************
//***** CONNECTIONS
//******************************************
	assign ioSda = oSda ? 1'bZ : 1'b0;
	assign ioScl = oScl ? 1'bZ : 1'b0;
	assign iSda = ioSda;
	assign iScl = ioScl;
	assign oScl = ~sclk;
	assign oSda = ~startBit & ~stopBit & (TxData[7] | ~((bitCnt > 0) & action));
	assign oByteCnt = (byteCnt > 0) ? (byteCnt - 1'b1) : 11'h0;
	assign oAckErr = ackErr;
	assign oAction = action;
	
	assign sclk = sclkReg[3];
	assign shiftClk = shiftClkReg[3];
	assign ackBit = (bitCnt == 0);
	
	always @(negedge clk) begin action_i   <= action;   end
	always @(posedge clk) begin shiftClk_i <= shiftClk; end
	
	assign action_posedge = action && !action_i;
	assign shiftClk_posedge = shiftClk && !shiftClk_i;
	assign shiftClk_negedge = !shiftClk && shiftClk_i;

	
	

//Start bit
	always @(posedge rst or posedge shiftClk or negedge clk)
	begin
		if(rst || shiftClk) 			  startBit <= 0;
		else if(action_posedge) startBit <= 1'b1; 
	end


//Acknowledge Error
	always @(posedge rst or negedge action or posedge clk)
	begin
		if(rst || ~action) ackErr <= 0;
		else if(ackBit && (shiftClk_negedge)) ackErr <= iSda; 
	end

	
//Stop bit
	assign stopBit = shiftClk & ((byteCnt >= iByteQnty + 1) | ackErr);

	always @(posedge clk) stopBit_i <= stopBit;



	
	
	
//******************************************
//***** ACTION
//******************************************
	always @(posedge rst or negedge clk)
	begin
		if(rst) action <= 0;
		else if(stopBit_i && !stopBit) action <= 0;
		else if(iStart && iScl) action <= 1'b1;
	end	

	
	
	
	
//******************************************
//***** QUANT COUNTER
//******************************************	
	always @(posedge rst or posedge clk)
	begin
		if(rst)
		begin
			qtCnt <= 0;
		end
		else begin
			if(!action)
			begin
				qtCnt <= 0;
			end
			else begin
				if(qtCnt >= (FCLK / (4 * SPEED)) - 1) qtCnt <= 0;
				else qtCnt <= qtCnt + 1'b1;
			end
		end
	end	
	
	
	
	
//******************************************
//***** SERIAL CLOCK
//******************************************	
	always @(posedge clk)
	begin
		if(rst)
		begin
			sclkReg     <= 4'b0110;
			shiftClkReg <= 4'b0011;
		end
		else begin
			if(!action)
			begin
				sclkReg     <= 4'b0110;
				shiftClkReg <= 4'b0011;
			end
			else begin
				if(qtCnt >= (FCLK / (4 * SPEED)) - 1)
				begin
					sclkReg[0]   <= sclkReg[3];
					sclkReg[3:1] <= sclkReg[2:0];
					
					shiftClkReg[0]   <= shiftClkReg[3];
					shiftClkReg[3:1] <= shiftClkReg[2:0];
				end
			end
		end
	end
	


	
//******************************************
//***** BIT COUNTER
//******************************************		
	always @(posedge rst or negedge action or posedge clk)
	begin
		if(rst || ~action)
		begin
			bitCnt <= 0;
		end	
		else begin
			if(shiftClk_posedge)
			begin
				if((byteCnt >= iByteQnty + 1) | ackErr) bitCnt <= 0;
				else if(bitCnt >= 8) bitCnt <= 0;
				else 				 		bitCnt <= bitCnt + 1'b1;
			end
		end
	end

	
	
	
//******************************************
//***** BYTE COUNTER
//******************************************		
	always @(posedge rst or negedge action or posedge clk)
	begin
		if(rst || ~action)
		begin
			byteCnt <= 0;
		end	
		else begin
			if((bitCnt == 0) && (shiftClk_negedge)) byteCnt <= byteCnt + 1'b1; 
		end
	end	
	
	
//******************************************
//***** TRANSMITTER
//******************************************	
	always @(posedge clk)
	begin
		if(shiftClk_posedge)
		begin
			if(bitCnt == 0)
			begin
				TxData <= (byteCnt > 0) ? iByteIn : {iDevID, 1'b0};
			end
			else begin
				TxData[0] <= 1'b1;
				TxData[7:1] <= TxData[6:0];
			end
		end
	end	
	
endmodule
