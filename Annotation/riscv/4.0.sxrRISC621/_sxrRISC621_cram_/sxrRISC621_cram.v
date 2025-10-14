module sxrRISC621_cram	(Resetn, StBusy, DM_address, Clock, DM_in, WR_DM, DM_out, clk0, clk1, clk2);

//----------------------------------------------------------------------------
//module input and outputs
//----------------------------------------------------------------------------

input		wire [13:0]	DM_address, DM_in;
input		wire			Resetn, Clock, WR_DM, clk0, clk1, clk2;
output	wire [13:0]	DM_out;
output	reg 			StBusy;

// Group Decoder
reg	[1:0]		 GrpID;
wire	[3:0]		 GrpDecd;

// PLL
wire				c0, c1, c2;

// CAMs
wire	[3:0]		mbits0, mbits1, mbits2, mbits3;
wire	[7:0]		dout[3:0];
reg				we_n[3:0];
reg				rd_n[3:0];
reg	[7:0]		din[3:0];
reg	[3:0]		cam_addrs[3:0];


// RAM - Mainmemory
reg	[13:0]	DMM_address, DMM_in;
reg				DMM_WR_DM; 
wire	[13:0]	DMM_out;


//----------------------------------------------------------------------------
// DMC_address is the cache memory address
//----------------------------------------------------------------------------

reg	[8:0]		DMC_address;
wire	[13:0]	DMC_in;
reg				DMC_WR_DM;
wire	[13:0]	DMC_out;

assign DMC_in = (StBusy == 1'b1) ? DMM_out : DM_in;


reg				miss;
reg	[1:0]		replace	[3:0];
reg				StValid	[15:0];
reg				StDirty	[15:0];

reg	[13:0]	tempVal		;

reg	[7:0]		tempTag		;

reg	[1:0]		StateMachine;

reg	[4:0]		transfer_count;


assign DM_out = (StBusy == 1'b1) ? 14'hzzzz : DMC_out ; 

//----------------------------------------------------------------------------
// This 4to16 decoder identifies the group being accessed
//----------------------------------------------------------------------------

	sxrRISC621_grp		my_ramgrpdec	(DM_address[5:4], GrpDecd);

//----------------------------------------------------------------------------
// 8-bit Block Address | 2-bit Group Address | 4-bit Word Address
//----------------------------------------------------------------------------
// Structural part of the code = memory subsystem "data path"
//----------------------------------------------------------------------------
// The PLL unit/block generates three clock phases to sequence all events
//----------------------------------------------------------------------------

	sxrRISC621_pll	ram_pll 	(Clock, c0, c1, c2);
	
//----------------------------------------------------------------------------
// I'm using two separate CAM memories for the two-way TAG identification
//----------------------------------------------------------------------------

	sxrRISC621_cam	RamBank0	(we_n[0], rd_n[0], din[0], DM_address[13:6], cam_addrs[0], dout[0], mbits0);
	
	sxrRISC621_cam	RamBank1	(we_n[1], rd_n[1], din[1], DM_address[13:6], cam_addrs[1], dout[1], mbits1);
	
	sxrRISC621_cam	RamBank2	(we_n[2], rd_n[2], din[2], DM_address[13:6], cam_addrs[2], dout[2], mbits2);
	
	sxrRISC621_cam	RamBank3	(we_n[3], rd_n[3], din[3], DM_address[13:6], cam_addrs[3], dout[3], mbits3);
	
//----------------------------------------------------------------------------
// This is the actual DM ROM, the same one that was used before as a 
//    monolithic DM memory; notice that this is driven by the c1 phase of the 
//    clock.
//----------------------------------------------------------------------------

	sxrRISC621_ram 	my_ram   (DMM_address[13:0], clk1, DMM_in, DMM_WR_DM, DMM_out);
	
//----------------------------------------------------------------------------
// This is the actual cache memory, implemented as a RAM; notice that this
//    is using the c2 phase of the clock.
//----------------------------------------------------------------------------

	sxrRISC621_cache	my_ram_cache	(DMC_address, clk2, DMC_in, DMC_WR_DM, DMC_out);
	
//----------------------------------------------------------------------------
// Behavioral part of the code = memory subsystem "control unit"
//----------------------------------------------------------------------------

always @ (posedge clk0) begin

	if (Resetn == 0) begin

//----------------------------------------------------------------------------
// Memory subsystem initialization; after a reset the cache content is
//    random, and thus the miss signal is set to 1; this in turn will trigger
//    the transfer of the first block from DM into the cache.
//----------------------------------------------------------------------------

		miss = 1'b1; DMC_WR_DM = 1'b0; transfer_count = 5'b0000; transfer_count = 5'b0000;
	
		replace[0] = 2'h3; replace[1] = 2'h3; replace[2] = 2'h3; replace[3] = 2'h3;
		
		we_n[0] = 1; we_n[1] = 1; we_n[2] = 1; we_n[3] = 1; rd_n[0] = 1; rd_n[1] = 1; rd_n[2] = 1; rd_n[3] = 1;
		
		StValid[ 0] = 0; StValid[ 1] = 0;  StValid[ 2] = 0; StValid[ 3] = 0; StValid[ 4] = 0; StValid[ 5] = 0;
		StValid[ 6] = 0; StValid[ 7] = 0;  StValid[ 8] = 0; StValid[ 9] = 0; StValid[10] = 0; StValid[11] = 0;
		StValid[12] = 0; StValid[13] = 0;  StValid[14] = 0; StValid[15] = 0;
		
		StDirty[ 0] = 0; StDirty[ 1] = 0;  StDirty[ 2] = 0; StDirty[ 3] = 0; StDirty[ 4] = 0; StDirty[ 5] = 0;
		StDirty[ 6] = 0; StDirty[ 7] = 0;  StDirty[ 8] = 0; StDirty[ 9] = 0; StDirty[10] = 0; StDirty[11] = 0;
		StDirty[12] = 0; StDirty[13] = 0;  StDirty[14] = 0; StDirty[15] = 0;
		
		StBusy = 1 ; StateMachine = 2'h0;
		
	end else begin
	
		GrpID = DM_address[5:4];
		
		DMC_WR_DM = 1'b0 ; DMM_WR_DM = 1'b0;
		
//----------------------------------------------------------------------------
// The HIT if statements
//----------------------------------------------------------------------------
// miss == 0 means we execute these statements under the assumption that we
//    have not yet discovered a miss.
//----------------------------------------------------------------------------

		if (miss == 0) begin

			StBusy = 0 ;
			
			we_n[0] = 1; we_n[1] = 1; we_n[2] = 1; we_n[3] = 1;
			
//----------------------------------------------------------------------------
// The condition logically ANDs each mbit with the coresponding group line;
// Then, all are logically OR-ed using the OR reduction operator.
//----------------------------------------------------------------------------

			if ( (|(mbits0 & GrpDecd)) && StValid[{2'h0,GrpID}] ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				DMC_address = {2'b00, DM_address[5:0]};
			
				if (WR_DM == 1'b1) begin
					DMC_WR_DM									=	1'b1		;
					StDirty[{2'h0,DM_address[5:4]}]		=	1'b1		;
				end else
					DMC_WR_DM									=	1'b0		;	
				

//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else if ( (|(mbits1 & GrpDecd)) && StValid[{2'h1,GrpID}] ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				DMC_address = {2'h1, DM_address[5:0]}; 
				
				if (WR_DM == 1'b1) begin
					DMC_WR_DM									=	1'b1		;
					StDirty[{2'h1,DM_address[5:4]}]		=	1'b1		;
				end else
					DMC_WR_DM									=	1'b0		;				
				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else	if ( (|(mbits2 & GrpDecd)) && StValid[{2'h2,GrpID}] ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				DMC_address = {2'h2, DM_address[5:0]}; 

				if (WR_DM == 1'b1) begin
					DMC_WR_DM									=	1'b1		;
					StDirty[{2'h2,DM_address[5:4]}]		=	1'b1		;
				end else
					DMC_WR_DM									=	1'b0		;
					
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------
				
			end else	if ( (|(mbits3 & GrpDecd)) && StValid[{2'h3,GrpID}] ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				DMC_address = {2'h3, DM_address[5:0]}; 

				if (WR_DM == 1'b1) begin
					DMC_WR_DM									=	1'b1		;
					StDirty[{2'h3,DM_address[5:4]}]		=	1'b1		;
				end else
					DMC_WR_DM									=	1'b0		;				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else begin 
//----------------------------------------------------------------------------
// A miss has been discovered, and thus the MISS statements are executed next
//----------------------------------------------------------------------------
					
				miss = 1'b1; transfer_count = 5'b00000; StateMachine 	= 2'h0;
				
			end
			
		end
		
//----------------------------------------------------------------------------
// The MISS if statements
//----------------------------------------------------------------------------

		if (miss == 1) begin
		
			if ( (StateMachine 	== 2'h0) && (transfer_count == 5'b00000) ) begin
			
				replace[GrpID] = ((replace[GrpID] + 1)%4);
				
			end
		
			StBusy = 1 ;

//----------------------------------------------------------------------------
// The DMC_address is equal to the concatenation of the replace[GrpID] bit, the 
//    group address field, and the word address; replace[GrpID] is 0 or 1, and is
//    actually implementing a very simple replacement strategy: replace the 
//    block that was not used last of the two blocks in the cache.
//----------------------------------------------------------------------------


			if(StDirty[{replace[GrpID],GrpID}] == 1'b0)  begin

				//----------------------------------------------------------------------------
				// The DMM_address is equal to the entire address generated by the CPU
				//----------------------------------------------------------------------------

				DMM_address = {DM_address[13:4], transfer_count[3:0]};

			
			
				DMC_address = {replace[GrpID], DM_address[5:4], transfer_count[3:0]};
				
				//----------------------------------------------------------------------------
				// This wren enables the writing of the next word into the cache.
				//----------------------------------------------------------------------------

				DMC_WR_DM = 1'b1;
							
				//----------------------------------------------------------------------------
				// The word address is incremented by 1 to point to the next word in the block
				//----------------------------------------------------------------------------

				transfer_count = transfer_count + 1'b1;
				
				//----------------------------------------------------------------------------
				// At the end of a block transfer, update the CAMs
				//----------------------------------------------------------------------------
						
			
			end else begin
			
			
			case(StateMachine)
			
				2'h0 : 	begin
				
							DMM_address = {DM_address[13:4], transfer_count[3:0]};

							DMC_address = {replace[GrpID], DM_address[5:4], transfer_count[3:0]};

							cam_addrs[replace[GrpID]] = GrpID;
							
							rd_n[replace[GrpID]] = 1'b0;
							
							DMC_WR_DM = 1'b0; DMM_WR_DM = 1'b0	;
							
							StateMachine = 2'h1		;
							
							end
							
				2'h1 : 	begin
				
							tempVal = DM_out;
							
							tempTag = dout[replace[GrpID]];

							
							DMM_address = {DM_address[13:4], transfer_count[3:0]};

							DMC_address = {replace[GrpID], DM_address[5:4], transfer_count[3:0]};

							DMC_WR_DM = 1'b1; DMM_WR_DM = 1'b0	;
							
							StateMachine = 2'h2		;
							
							end
							
				2'h2 :	begin
				
							DMM_in 		= tempVal;
							
							DMM_address = {tempTag, GrpID, transfer_count[3:0]};
							
							DMC_WR_DM = 1'b0; DMM_WR_DM = 1'b1	;
							
							StateMachine = 2'h3		;
							
							end
							
				2'h3 :	begin
				
							DMC_WR_DM = 1'b0; DMM_WR_DM = 1'b0	;
							
							transfer_count = transfer_count + 1'b1;
							
							StateMachine = 2'h0		;
							
							end
				endcase
				
			end

			if (transfer_count == 5'b10001) begin
				
					miss = 0; DMC_WR_DM = 0; transfer_count = 5'b00000;
					
						if (replace[GrpID] == 0) begin

							din[0] = DM_address[13:6]; cam_addrs[0] = DM_address[5:4];  we_n[0] = 0;
							
							StValid[{2'h0, DM_address[5:4]}] = 1; StDirty[{2'h0, DM_address[5:4]}] = 0;
						
						end else if (replace[GrpID] == 1) begin

							din[1] = DM_address[13:6]; cam_addrs[1] = DM_address[5:4]; we_n[0] = 0;
							
							StValid[{2'h1, DM_address[5:4]}] = 1; StDirty[{2'h1, DM_address[5:4]}] = 0;
						
						end else if (replace[GrpID] == 2) begin

							din[2] = DM_address[13:6]; cam_addrs[0] = DM_address[5:4]; we_n[0] = 0;
							
							StValid[{2'h2, DM_address[5:4]}] = 1; StDirty[{2'h2, DM_address[5:4]}] = 0;
						
						end else begin
						
							din[3] = DM_address[13:6]; cam_addrs[1] = DM_address[5:4]; we_n[1] = 0;
							
							StValid[{2'b11, DM_address[5:4]}] = 1; StDirty[{2'h3, DM_address[5:4]}] = 0;
						
						end
			end

		
	end
	
end

end

endmodule
