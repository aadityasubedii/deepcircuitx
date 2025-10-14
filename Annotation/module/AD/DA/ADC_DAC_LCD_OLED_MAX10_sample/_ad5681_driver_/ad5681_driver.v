
module ad5681_driver (clk, rst, iData, iStart, oSync, oScl, oSda, oLdac);

//******************************************
//***** PINOUT
//******************************************
	input  clk;
	input  rst;
	
	input  [23:0] iData;
	input  iStart;
	
	output oScl;
	output oSda;
	output oSync;
	output oLdac;
	
	
//******************************************
//***** VARIABLES
//******************************************
	reg  [2:0]  state = 0;
	reg  [2:0]  next_state = 0;
	reg  [23:0] shdata =0;
	reg  [4:0]  bcnt =0; 			// bit counter
	reg  sclk_en = 0;
   reg  sclk_en_i = 0;
	reg  csel = 0;
	reg  ldac = 0;


//******************************************
//***** CONNECTIONS
//******************************************

	assign oScl = ~sclk_en_i | clk;
	assign oSync = ~csel;
	assign oLdac = ~ldac;
	assign oSda = shdata[23];
	always @(posedge clk)begin sclk_en_i <= sclk_en; end


//******************************************
//***** SHIFT REGISTER
//******************************************

	always @(posedge rst or posedge clk)
	begin
		if(rst)
		begin
			shdata <= 0;
		end
		else begin
			if(bcnt < 2) 
			begin
				shdata <= iData;
			end
			else begin
				shdata[0] <= 1'b1;
				shdata[23:1] <= shdata[22:0];
			end
		end
	end




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
			0: 
			begin
				if(iStart) next_state = 1;
				else next_state = 0;
			end
			1:
			begin
				if(bcnt >= 24) next_state = 2;
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
				if(!iStart) next_state = 0;
				else next_state = 4;
			end
			default: next_state = 0;
		endcase
	end

//State handler
	always @(negedge clk)
	begin
		case(state)		
			0: 		// Reset
			begin
				bcnt <= 0;
				sclk_en <= 0;
				csel <= 0;
				ldac <= 0;
			end
			1:
			begin
				sclk_en <= 1'b1;
				csel <= 1'b1;
				bcnt <= bcnt + 1'b1;
			end
			2:
			begin
				sclk_en <= 0;
				bcnt <= bcnt + 1'b1;
			end
			3:
			begin
				csel <= 0;
				bcnt <= 0;
			end
			4:
			begin
				ldac <= 1'b1;
			end
		endcase
	end

	
	
	

endmodule




