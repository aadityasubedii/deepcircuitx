/*

	s10
  s	s
  2	0
  0	0
	s11
  s	s
  2	0
  1	1
	s12	*s02
   
	\/s22
  
*/


module lcd24x3
(
	input  clk,
	
	input  [4:0] iChar7,
	input  [4:0] iChar6,
	input  [4:0] iChar5,
	input  [4:0] iChar4,
	input  [4:0] iChar3,
	input  [4:0] iChar2,
	input  [4:0] iChar1,
	input  [4:0] iChar0,
	input  [7:0] iPoint,
	
	output reg [2:0]  oCom = 0,
	output reg [23:0] oSeg = 0

);
	
	parameter Fclk = 10000; 		// [kHz] System clock frequency
	parameter Contrast = 6;
	
	
	wire [71:0] segin;
	reg  [3:0]  fcom 	= 0;
	reg  [23:0] fseg 	= 0;
	reg  			shift = 0;
	reg  [4:0] 	fbcnt = 0;
	reg  			fbclk = 0;
	reg  [14:0] cnt 	= 0;
	
	
	
	//-----fbase = 2000 Hz
	always @(posedge clk)
	begin
		if(cnt >= (Fclk / 4)-1)
		begin
			cnt <= 0;
			fbclk <= ~fbclk;
		end
		else begin
			cnt <= cnt + 1'b1;
		end
	end

	always @(posedge fbclk)
	begin
		if(fbcnt == 3 + Contrast) 
		begin
			shift <= ~shift;
			fbcnt <= 0;			  
		end
		else begin
			fbcnt <= fbcnt + 1'b1;
		end
	end
	
	
	always @*
	begin
		case(fbcnt)
			0:			fcom = 4'b0001;
			1:			fcom = 4'b0010;
			2:			fcom = 4'b0100;
			3:			fcom = 4'b1000;
			default: fcom = 4'b0000;
		endcase
	end
	

	genvar j;
	generate
		for (j=0; j<24; j=j+1)
		begin: LOOP	
			always @*
			begin
				case (segin[j*3+2 : j*3])
					3'b000:  fseg[j] = 0;
					3'b001:  fseg[j] = fcom[1] | fcom[2];
					3'b010:  fseg[j] = fcom[0] | fcom[2];
					3'b011:  fseg[j] = fcom[3] | fcom[2];
					3'b100:  fseg[j] = fcom[0] | fcom[1];
					3'b101:  fseg[j] = fcom[3] | fcom[1];
					3'b110:  fseg[j] = fcom[3] | fcom[0];
					3'b111:  fseg[j] = |fcom;
					default: fseg[j] = 0;
				endcase
			end
		end
	endgenerate
 
	always @(posedge clk)
	begin
		oCom <= shift ? ~fcom[2:0] : fcom[2:0];
		oSeg <= shift ? ~fseg : fseg;
	end



//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
	data_decoder DATA_DECODER
	(	
		.char0(iChar0),
		.char1(iChar1),
		.char2(iChar2),
		.char3(iChar3),
		.char4(iChar4),
		.char5(iChar5),
		.char6(iChar6),
		.char7(iChar7),
		.point(iPoint),
		
		.data_out(segin)
	);






	
 
 
 
endmodule



