 /////////////////////////////////
/// audio interface to DE1-SoC ///
/// March 2016                 ///
/// serial transfer  DAC       ///
/// part 2 serial module       ///
//////////////////////////////////

module serial_dac(
 
 serial_dac,	// 24 bit serial in data
 SDACL,			// left channel DAC
 SDACR, 			// right channel DAC 
 dac_lr,			// left right channel enable
 clk,				// 50 KHz clock
 enable			// master reset

);

 
 input[32:0] SDACL;	// Stored ADC left
 input[32:0] SDACR;	// Stored ADC right
 
 output serial_dac; 
 input clk;
 input enable;
 input dac_lr;
 
///////////////////////////////////////
// internal register
///////////////////////////////////////
  
 reg [7:0] SDACL_counter;	// counter for DAC left channel
 reg [7:0] SDACR_counter;	// counter for DAC right channel
 
 ////////////////////////////////////////
 // state machine for serial counter   // 
 ////////////////////////////////////////
 
 assign serial_dac = (dac_lr)? serial_1 : serial_2 ; 
 reg serial_1;
 reg serial_2;
 

 always @(negedge enable or posedge clk) begin
 
 	if  (!enable)
	
	begin
	SDACL_counter = 7'b0; // reset left channel counter
	
	end
	
	else begin
	
	if (dac_lr) 
	SDACL_counter = 7'b0;	
	
	else
	SDACL_counter = SDACL_counter + 1; // left channel captures audio
	end
	
	end

 ///////////////////////////////////////////////////////////////////////
 
 always @(negedge enable or posedge clk) begin
 
 	if  (!enable)
	
	begin
	
	SDACR_counter = 7'b0; // reset right channel counter
	end
	
	else begin
	
	if (!dac_lr) 
	SDACR_counter = 7'b0;
		
	else
	SDACR_counter = SDACR_counter + 1; // right channel captures audio
	
	end
	
	end
 
 always @ (negedge enable or negedge clk) begin
 
 
 case (SDACL_counter)
 
		// msb first
		7'd0	: begin serial_1 = SDACL[32]  ;  end // bit 0 - start
 
		7'd1	: begin serial_1 = SDACL[31]  ;  end //  valid audio 31 left channel
		
		7'd2	: begin serial_1 = SDACL[30] ;  end // valid audio 30 left channel
		
		7'd3	: begin serial_1 = SDACL[29]  ;  end // valid audio 29 left channel
		
		7'd4	: begin serial_1 = SDACL[28]  ;  end // valid audio 28 left channel
		
		7'd5	: begin serial_1 = SDACL[27]  ;  end // valid audio 27 left channel
		
		7'd6	: begin serial_1 = SDACL[26]  ;  end // valid audio 26 left channel
		
		7'd7	: begin serial_1 = SDACL[25]  ;  end // valid audio 25 left channel
		
		7'd8	: begin serial_1 = SDACL[24]  ;  end // valid audio 24 left channel
		
		7'd9	: begin serial_1 = SDACL[23]  ;  end // valid audio 23 left channel
		
		7'd10	: begin serial_1 = SDACL[22]  ;  end // valid audio 22 left channel
		
		7'd11	: begin serial_1 = SDACL[21]  ;  end // valid audio 21 left channel

		7'd12	: begin serial_1 = SDACL[20]  ;  end // valid audio 20 left channel
		
		7'd13	: begin serial_1 = SDACL[19]  ;  end // valid audio 19 left channel
		
		7'd14	: begin serial_1 = SDACL[18]  ;  end // valid audio 18 left channel
		
		7'd15	: begin serial_1 = SDACL[17]  ;  end // valid audio 17 left channel
		
		7'd16	: begin serial_1 = SDACL[16]  ;  end // valid audio 16 left channel
		
		7'd17	: begin serial_1 = SDACL[15]  ;  end // valid audio 15 left channel
		
		7'd18	: begin serial_1 = SDACL[14]  ;  end // valid audio 14 left channel
		
		7'd19	: begin serial_1 = SDACL[13]  ;  end // valid audio 13 left channel
		
		7'd20	: begin serial_1 = SDACL[12] ;  end // valid audio 12 left channel
		
		7'd21	: begin serial_1 = SDACL[11]  ;  end // valid audio 11 left channel
				
		7'd22	: begin serial_1 = SDACL[10]  ;  end // valid audio 10 left channel

		7'd23	: begin serial_1 = SDACL[9]  ;  end // valid audio 9 left channel
		
		7'd24	: begin serial_1 = SDACL[8]  ;  end // valid audio 8 left channel
		
		7'd25	: begin serial_1 = SDACL[7]  ;  end // valid audio 7 left channel
		
		7'd26	: begin serial_1 = SDACL[6]  ;  end // valid audio 6 left channel
		
		7'd27 : begin serial_1 = SDACL[5]  ;  end // valid audio 5 left channel
		
		7'd28	: begin serial_1 = SDACL[4]  ;  end // valid audio 4 left channel
		
		7'd29	: begin serial_1 = SDACL[3]  ;  end // valid audio 3 left channel
		
		7'd30	: begin serial_1 = SDACL[2]  ;  end // valid audio 2 left channel
		
		7'd31	: begin serial_1 = SDACL[1]  ;  end // valid audio 1 left channel
		
		7'd32	: begin serial_1 = SDACL[0]  ;  end // valid audio 0 left channel
		
			
		endcase
		
		end
		
		always @ (negedge enable or negedge clk) begin
 
 
		case (SDACR_counter)
 
		// msb first
		7'd0	: begin serial_2 = SDACR[32] ;  end // bit 0 - start
 
		7'd1	: begin serial_2 = SDACR[31] ;  end // valid audio 31 right channel
		
		7'd2	: begin serial_2 = SDACR[30] ;  end // valid audio 30 right channel
		
		7'd3	: begin serial_2 = SDACR[29] ;  end // valid audio 29 right channel
		
		7'd4	: begin serial_2 = SDACR[28] ;  end // valid audio 28 right channel
		
		7'd5	: begin serial_2 = SDACR[27] ;  end // valid audio 27 right channel
		
		7'd6	: begin serial_2 = SDACR[26] ;  end // valid audio 26 right channel
		
		7'd7	: begin serial_2 = SDACR[25] ;  end // valid audio 25 right channel
		
		7'd8	: begin serial_2 = SDACR[24] ;  end // valid audio 24 right channel
		
		7'd9	: begin serial_2 = SDACR[23] ;  end // valid audio 23 right channel
		
		7'd10	: begin serial_2 = SDACR[22] ;  end // valid audio 22 right channel
		
		7'd11	: begin serial_2 = SDACR[21] ;  end // valid audio 21 right channel

		7'd12	: begin serial_2 = SDACR[20] ;  end // valid audio 20 right channel
		
		7'd13	: begin serial_2 = SDACR[19] ;  end // valid audio 19 right channel
		
		7'd14	: begin serial_2 = SDACR[18] ;  end // valid audio 18 right channel
		
		7'd15	: begin serial_2 = SDACR[17] ;  end // valid audio 17 right channel
		
		7'd16	: begin serial_2 = SDACR[16] ;  end // valid audio 16 right channel
		
		7'd17	: begin serial_2 = SDACR[15] ;  end // valid audio 15 right channel
		
		7'd18	: begin serial_2 = SDACR[14] ;  end // valid audio 14 right channel
		
		7'd19	: begin serial_2 = SDACR[13] ;  end // valid audio 13 right channel
		
		7'd20	: begin serial_2 = SDACR[12] ;  end // valid audio 12 right channel
		
		7'd21	: begin serial_2 = SDACR[11] ;  end // valid audio 11 right channel
		
		7'd22	: begin serial_2 = SDACR[10] ;  end // valid audio 10 right channel

		7'd23	: begin serial_2 = SDACR[9] ;  end // valid audio 9 right channel
		
		7'd24	: begin serial_2 = SDACR[8] ;  end // valid audio 8 right channel
		
		7'd25	: begin serial_2 = SDACR[7] ;  end // valid audio 7 right channel
		
		7'd26	: begin serial_2 = SDACR[6] ;  end // valid audio 6 right channel
		
		7'd27 : begin serial_2 = SDACR[5] ;  end // valid audio 5 right channel
		
		7'd28	: begin serial_2 = SDACR[4] ;  end // valid audio 4 right channel
		
		7'd29	: begin serial_2 = SDACR[3] ;  end // valid audio 3 right channel
		
		7'd30	: begin serial_2 = SDACR[2] ;  end // valid audio 2 right channel
		
		7'd31	: begin serial_2 = SDACR[1] ;  end // valid audio 1 right channel
		
		7'd32	: begin serial_2 = SDACR[0] ;  end // valid audio 0 right channel
			
		endcase
		
		end
		
		endmodule
