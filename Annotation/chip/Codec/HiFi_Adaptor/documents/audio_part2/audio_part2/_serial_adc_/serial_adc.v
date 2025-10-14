 /////////////////////////////////
/// audio interface to DE1-SoC ///
/// March 2016                 ///
/// serial transfer  ADC       ///
/// part 2 serial module       ///
//////////////////////////////////

module serial_adc (
 
 serial_adc,	// 24 bit serial in data
 SADCL,			// left channel ADC
 SADCR,			// right channel ADC 
 adc_lr,			// left right enable
 clk,				// 50 KHz clock
 enable			// master reset

);

 
 output[32:0] SADCL;	// Serial shift register ADC left
 output[32:0] SADCR;	// Serial shift register ADC right
 
 reg[32:0] SADCL;
 reg[32:0] SADCR;
 
 input serial_adc; 
 input clk;
 input enable;
 input adc_lr;
 
///////////////////////////////////////
// internal register
///////////////////////////////////////
  
 reg [7:0] SADCL_counter;	// counter for serial in register
 reg [7:0] SADCR_counter;	// indicates end of 3 bit transfer

 
 ////////////////////////////////////////
 // state machine for serial counter   // 
 ////////////////////////////////////////
 
 
 
 always @(negedge enable or posedge clk) begin
 
 	if  (!enable)
	
	begin
	
	SADCR_counter = 7'b0; // reset right channel counter
	end
	
	else begin
	
	if (!adc_lr) 
	SADCR_counter = 7'b0;
	
	
	else
	SADCR_counter = SADCR_counter + 1; // right channel captures audio
	end
	
	end
	
//////////////////////////////////////////////////////////////

 always @(negedge enable or posedge clk) begin
 
 	if  (!enable)
	
	begin
	SADCL_counter = 7'b0; // reset left channel counter
	
	end
	
	else begin
	
	if (adc_lr) 
	SADCL_counter = 7'b0;
	
	
	else
	SADCL_counter = SADCL_counter + 1; // left channel captures audio
	
	end
	
	end
 
 always @ (negedge enable or negedge clk) begin
 
 
 case (SADCL_counter)
 
		// msb first
		7'd0	: begin SADCL[32] = serial_adc ;  end // bit 0 - start
 
		7'd1	: begin SADCL[31] = serial_adc ;  end //  valid audio 31 left channel
		
		7'd2	: begin SADCL[30] = serial_adc ;  end // valid audio 30 left channel
		
		7'd3	: begin SADCL[29] = serial_adc ;  end // valid audio 29 left channel
		
		7'd4	: begin SADCL[28] = serial_adc ;  end // valid audio 28 left channel
		
		7'd5	: begin SADCL[27] = serial_adc ;  end // valid audio 27 left channel
		
		7'd6	: begin SADCL[26] = serial_adc ;  end // valid audio 26 left channel
		
		7'd7	: begin SADCL[25] = serial_adc ;  end // valid audio 25 left channel
		
		7'd8	: begin SADCL[24] = serial_adc ;  end // valid audio 24 left channel
		
		7'd9	: begin SADCL[23] = serial_adc ;  end // valid audio 23 left channel
		
		7'd10	: begin SADCL[22] = serial_adc ;  end // valid audio 22 left channel
		
		7'd11	: begin SADCL[21] = serial_adc ;  end // valid audio 21 left channel

		7'd12	: begin SADCL[20] = serial_adc ;  end // valid audio 20 left channel
		
		7'd13	: begin SADCL[19] = serial_adc ;  end // valid audio 19 left channel
		
		7'd14	: begin SADCL[18] = serial_adc ;  end // valid audio 18 left channel
		
		7'd15	: begin SADCL[17] = serial_adc ;  end // valid audio 17 left channel
		
		7'd16	: begin SADCL[16] = serial_adc ;  end // valid audio 16 left channel
		
		7'd17	: begin SADCL[15] = serial_adc ;  end // valid audio 15 left channel
		
		7'd18	: begin SADCL[14] = serial_adc ;  end // valid audio 14 left channel
		
		7'd19	: begin SADCL[13] = serial_adc ;  end // valid audio 13 left channel
		
		7'd20	: begin SADCL[12] = serial_adc ;  end // valid audio 12 left channel
		
		7'd21	: begin SADCL[11] = serial_adc ;  end // valid audio 11 left channel
				
		7'd22	: begin SADCL[10] = serial_adc ;  end // valid audio 10 left channel

		7'd23	: begin SADCL[9] = serial_adc ;  end // valid audio 9 left channel
		
		7'd24	: begin SADCL[8] = serial_adc ;  end // valid audio 8 left channel
		
		7'd25	: begin SADCL[7] = serial_adc ;  end // valid audio 7 left channel
		
		7'd26	: begin SADCL[6] = serial_adc ;  end // valid audio 6 left channel
		
		7'd27 : begin SADCL[5] = serial_adc ;  end // valid audio 5 left channel
		
		7'd28	: begin SADCL[4] = serial_adc ;  end // valid audio 4 left channel
		
		7'd29	: begin SADCL[3] = serial_adc ;  end // valid audio 3 left channel
		
		7'd30	: begin SADCL[2] = serial_adc ;  end // valid audio 2 left channel
		
		7'd31	: begin SADCL[1] = serial_adc ;  end // valid audio 1 left channel
		
		7'd32	: begin SADCL[0] = serial_adc ;  end // valid audio 0 left channel
		
			
		endcase
		
		end
		
		always @ (negedge enable or negedge clk) begin
 
 
 case (SADCR_counter)
 
		// msb first
		7'd0	: begin SADCR[32] = serial_adc ;  end // bit 0 - start
 
		7'd1	: begin SADCR[31] = serial_adc ;  end //  valid audio 31 right channel
		
		7'd2	: begin SADCR[30] = serial_adc ;  end // valid audio 30 right channel
		
		7'd3	: begin SADCR[29] = serial_adc ;  end // valid audio 29 right channel
		
		7'd4	: begin SADCR[28] = serial_adc ;  end // valid audio 28 right channel
		
		7'd5	: begin SADCR[27] = serial_adc ;  end // valid audio 27 right channel
		
		7'd6	: begin SADCR[26] = serial_adc ;  end // valid audio 26 right channel
		
		7'd7	: begin SADCR[25] = serial_adc ;  end // valid audio 25 right channel
		
		7'd8	: begin SADCR[24] = serial_adc ;  end // valid audio 24 right channel
		
		7'd9	: begin SADCR[23] = serial_adc ;  end // valid audio 23 right channel
		
		7'd10	: begin SADCR[22] = serial_adc ;  end // valid audio 22 right channel
		
		7'd11	: begin SADCR[21] = serial_adc ;  end // valid audio 21 right channel

		7'd12	: begin SADCR[20] = serial_adc ;  end // valid audio 20 right channel
		
		7'd13	: begin SADCR[19] = serial_adc ;  end // valid audio 19 right channel
		
		7'd14	: begin SADCR[18] = serial_adc ;  end // valid audio 18 right channel
		
		7'd15	: begin SADCR[17] = serial_adc ;  end // valid audio 17 right channel
		
		7'd16	: begin SADCR[16] = serial_adc ;  end // valid audio 16 right channel
		
		7'd17	: begin SADCR[15] = serial_adc ;  end // valid audio 15 right channel
		
		7'd18	: begin SADCR[14] = serial_adc ;  end // valid audio 14 right channel
		
		7'd19	: begin SADCR[13] = serial_adc ;  end // valid audio 13 right channel
		
		7'd20	: begin SADCR[12] = serial_adc ;  end // valid audio 12 right channel
		
		7'd21	: begin SADCR[11] = serial_adc ;  end // valid audio 11 right channel
		
		7'd22	: begin SADCR[10] = serial_adc ;  end // valid audio 10 right channel

		7'd23	: begin SADCR[9] = serial_adc ;  end // valid audio 9 right channel
		
		7'd24	: begin SADCR[8] = serial_adc ;  end // valid audio 8 right channel
		
		7'd25	: begin SADCR[7] = serial_adc ;  end // valid audio 7 right channel
		
		7'd26	: begin SADCR[6] = serial_adc ;  end // valid audio 6 right channel
		
		7'd27 : begin SADCR[5] = serial_adc ;  end // valid audio 5 right channel
		
		7'd28	: begin SADCR[4] = serial_adc ;  end // valid audio 4 right channel
		
		7'd29	: begin SADCR[3] = serial_adc ;  end // valid audio 3 right channel
		
		7'd30	: begin SADCR[2] = serial_adc ;  end // valid audio 2 right channel
		
		7'd31	: begin SADCR[1] = serial_adc ;  end // valid audio 1 right channel
		
		7'd32	: begin SADCR[0] = serial_adc ;  end // valid audio 0 right channel
			
		endcase
		
		end
		
		endmodule
