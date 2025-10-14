module movingAverage (clk, rst, iDataIn, iSampleReady, iFilterWidth, oDataOut, oDataReady);


//******************************************
//***** PINOUT
//******************************************

	input  clk;
	input  rst;
	
	input  [11:0] iDataIn;
	input  iSampleReady;
	input  [11:0] iFilterWidth;
	
	output [11:0] oDataOut;
	output reg oDataReady = 0;



//******************************************
//***** VARIABLES
//******************************************

	reg  wrEn = 0;
	reg  [10:0] wrIndex = 0;
	reg  [10:0] cellIndex = 0;
	wire [11:0] cellData;
	reg  [23:0] dataOut = 0;
	reg  dataReady = 0;
	wire filterEnable;
	reg  [23:0] accum = 0;
	
	reg  [2:0] state = 0;
	reg  [2:0] next_state =0;



//******************************************
//***** CONNECTIONS
//******************************************
	assign filterEnable = (iFilterWidth > 12'd1) & ~rst;
	assign oDataOut 	= filterEnable ? dataOut[11:0]	   : iDataIn;
	
	always @(posedge clk) begin  oDataReady <= filterEnable ? dataReady : iSampleReady; end





//******************************************
//***** FILTER CELLS
//******************************************

	filterCells FILTER_CELLS
	(
		.clock(clk),
		.data(iDataIn),
		.wren(wrEn),
		.wraddress(wrIndex),
		.rdaddress(cellIndex),
		.q(cellData)
	);



//******************************************
//***** FSM
//******************************************


always @(negedge filterEnable or posedge clk) 
	begin
		if(!filterEnable) state <= 0;
		else state <= next_state;
	end
	
	always @(*)
	begin
		case(state)
			0:
			begin
				next_state = 1;
			end
			1:
			begin
				if(iSampleReady) next_state = 2;
				else next_state = 1;
			end
			2:
			begin
				next_state = 3;
			end
			3:
			begin
				next_state = 4;
			end
			4:
			begin
				if(cellIndex >= iFilterWidth) next_state = 5;
				else next_state = 4;
			end
			5:
			begin
				next_state = 6;
			end
			6:
			begin
				if(!iSampleReady) next_state = 1;
				else next_state = 6;
			end
			
			default: next_state = 0;
		endcase
	end	


// States handle 

	always @(negedge filterEnable or negedge clk)
	begin
		if(!filterEnable)
		begin 
			wrIndex <= 0;
			wrEn <= 0;
			cellIndex <= 0;
			accum <= 0;
			dataReady <= 0;
		end
		else begin
			case(state)
				0:
				begin
					wrIndex <= 0;
					wrEn <= 0;
					cellIndex <= 0;
					accum <= 0;
					dataReady <= 0;
				end
				2:
				begin
					wrEn <= 1'b1;
					dataReady <= 0;
				end
				3:
				begin
					wrEn <= 0;
					wrIndex <= (wrIndex >= iFilterWidth - 1'b1) ? 11'b0 :  wrIndex + 1'b1;
				end
				4:
				begin
					accum <= accum + cellData;
					cellIndex <= cellIndex + 1'b1;
				end
				5:
				begin
					dataOut <= (accum / iFilterWidth);
					accum <= 0;
					cellIndex <= 0;
				end
				6:
				begin
					dataReady <= 1'b1;
				end

			endcase
		end
	end	



endmodule
