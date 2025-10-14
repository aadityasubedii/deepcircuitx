module sxrRISC621_crom	(Resetn, StBusy, PM_address, Clock, PM_out, clk0, clk1, clk2);

//----------------------------------------------------------------------------
//module input and outputs
//----------------------------------------------------------------------------

input		wire	[13:0]	PM_address;
input		wire				Resetn, Clock, clk0, clk1, clk2;
output	wire	[13:0]	PM_out;
output	reg				StBusy;

//----------------------------------------------------------------------------
//structural nets
//----------------------------------------------------------------------------

wire	[3:0]		mbits0, mbits1, mbits2, mbits3, GrpDecd;
wire  [13:0]	PMM_out;
wire				c0, c1, c2;
wire	[7:0]		dout0, dout1, dout2, dout3;

//----------------------------------------------------------------------------
//registered nets
//----------------------------------------------------------------------------

reg				we_n0, we_n1 ,we_n2, we_n3 , rd_n0, rd_n1 , rd_n2, rd_n3;
reg				miss, wren;
reg	[1:0]		replace	[3:0];
reg				StValid	[15:0];

//----------------------------------------------------------------------------
// PMC_address is the cache memory address
//----------------------------------------------------------------------------

reg	[8:0]		PMC_address; 

//----------------------------------------------------------------------------
// PMM_address is the PM memory address;
//----------------------------------------------------------------------------

reg	[13:0] PMM_address; 
reg	[7:0] din0, din1, din2, din3;
reg	[3:0] cam_addrs0, cam_addrs1,cam_addrs2, cam_addrs3;
reg	[4:0] transfer_count;

wire [7:0] tag;

assign tag = PMM_address[13:6];

//----------------------------------------------------------------------------
// GrpID is used to capture the group address field
//----------------------------------------------------------------------------

reg	[1:0]	GrpID;

wire Reset ;

assign Reset = ~Resetn; 

//----------------------------------------------------------------------------
// 8-bit Block Address | 2-bit Group Address | 4-bit Word Address
//----------------------------------------------------------------------------
// Structural part of the code = memory subsystem "data path"
//----------------------------------------------------------------------------
// The PLL unit/block generates three clock phases to sequence all events
//----------------------------------------------------------------------------

	sxrRISC621_pll	rom_pll 	(Clock, c0, c1, c2);
	
//----------------------------------------------------------------------------
// I'm using two separate CAM memories for the two-way TAG identification
//----------------------------------------------------------------------------

	sxrRISC621_cam	RomBank0	(we_n0, rd_n0, din0, PM_address[13:6], cam_addrs0, dout0, mbits0);
	
	sxrRISC621_cam	RomBank1	(we_n1, rd_n1, din1, PM_address[13:6], cam_addrs1, dout1, mbits1);
	
	sxrRISC621_cam	RomBank2	(we_n2, rd_n2, din2, PM_address[13:6], cam_addrs2, dout2, mbits2);
	
	sxrRISC621_cam	RomBank3	(we_n3, rd_n3, din3, PM_address[13:6], cam_addrs3, dout3, mbits3);
	
//----------------------------------------------------------------------------
// This is the actual PM ROM, the same one that was used before as a 
//    monolithic PM memory; notice that this is driven by the c1 phase of the 
//    clock.
//----------------------------------------------------------------------------

	sxrRISC621_rom 	my_rom   (PMM_address[13:0], clk1, PMM_out);
	
//----------------------------------------------------------------------------
// This is the actual cache memory, implemented as a RAM; notice that this
//    is using the c2 phase of the clock.
//----------------------------------------------------------------------------

	sxrRISC621_cache	my_rom_cache	(PMC_address, clk2, PMM_out, wren, PM_out);
	
//----------------------------------------------------------------------------
// This 4to16 decoder identifies the group being accessed
//----------------------------------------------------------------------------

	sxrRISC621_grp		my_romgrpdec	(PM_address[5:4], GrpDecd);
	
//----------------------------------------------------------------------------
// Behavioral part of the code = memory subsystem "control unit"
//----------------------------------------------------------------------------

always @ (posedge clk0) begin

	if (Resetn == 0) begin

//----------------------------------------------------------------------------
// Memory subsystem initialization; after a reset the cache content is
//    random, and thus the miss signal is set to 1; this in turn will trigger
//    the transfer of the first block from PM into the cache.
//----------------------------------------------------------------------------

		miss = 1'b1; wren = 1'b0; transfer_count = 5'b0000;
	
		replace[0] = 2'h3; replace[1] = 2'h3; replace[2] = 2'h3; replace[3] = 2'h3;
		
		we_n0 = 1; we_n1 = 1; we_n2 = 1; we_n3 = 1; rd_n0 = 1; rd_n1 = 1; rd_n2 = 1; rd_n3 = 1;
		
		StValid[ 0] = 0; StValid[ 1] = 0;  StValid[ 2] = 0; StValid[ 3] = 0; StValid[ 4] = 0; StValid[ 5] = 0;
		StValid[ 6] = 0; StValid[ 7] = 0;  StValid[ 8] = 0; StValid[ 9] = 0; StValid[10] = 0; StValid[11] = 0;
		StValid[12] = 0; StValid[13] = 0;  StValid[14] = 0; StValid[15] = 0;
		
		StBusy = 1 ;
		
	end else begin
	
		GrpID = PM_address[5:4];
		
		we_n0 = 1; we_n1 = 1; we_n2 = 1; we_n3 = 1;
		
//----------------------------------------------------------------------------
// The HIT if statements
//----------------------------------------------------------------------------
// miss == 0 means we execute these statements under the assumption that we
//    have not yet discovered a miss.
//----------------------------------------------------------------------------

		if (miss == 0) begin

			
			
//----------------------------------------------------------------------------
// The condition logically ANDs each mbit with the coresponding group line;
// Then, all are logically OR-ed using the OR reduction operator.
//----------------------------------------------------------------------------

			if ( (|(mbits0 & GrpDecd)) && (StValid[({2'b00,GrpID})]==1'b1) ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				PMC_address = {2'b00, PM_address[5:0]}; 
				
				StBusy = 0 ;
				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else if ( (|(mbits1 & GrpDecd)) && (StValid[({2'b01,GrpID})] == 1'b1) ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				PMC_address = {2'b01, PM_address[5:0]}; 

				StBusy = 0 ;
				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else	if ( (|(mbits2 & GrpDecd)) && (StValid[({2'b10,GrpID})] == 1'b1) ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				PMC_address = {2'b10, PM_address[5:0]}; 

				StBusy = 0 ;
				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------
				
			end else	if ( (|(mbits3 & GrpDecd)) && (StValid[({2'b11,GrpID})] == 1'b1) ) begin
			
//----------------------------------------------------------------------------
// Concatenated group and word address fields.
//----------------------------------------------------------------------------

				PMC_address = {2'b11, PM_address[5:0]}; 

				StBusy = 0 ;
				
//----------------------------------------------------------------------------
// Apply the replacing strategy: if this block was accessed now and a 
//    replacement will be necessary next, replace the other block.
//----------------------------------------------------------------------------

			end else begin 
//----------------------------------------------------------------------------
// A miss has been discovered, and thus the MISS statements are executed next
//----------------------------------------------------------------------------
					
				miss = 1'b1; transfer_count = 5'b00000;
				
			end
			
		end
		
//----------------------------------------------------------------------------
// The MISS if statements
//----------------------------------------------------------------------------

		if (miss == 1) begin
		
			if (transfer_count == 5'b00000) begin
			
				replace[GrpID] = ((replace[GrpID] + 1)%4);
				
			end
		
			StBusy = 1 ;

//----------------------------------------------------------------------------
// The PMC_address is equal to the concatenation of the replace[GrpID] bit, the 
//    group address field, and the word address; replace[GrpID] is 0 or 1, and is
//    actually implementing a very simple replacement strategy: replace the 
//    block that was not used last of the two blocks in the cache.
//----------------------------------------------------------------------------

			PMC_address = {replace[GrpID], PM_address[5:4], transfer_count[3:0]};
			
//----------------------------------------------------------------------------
// The PMM_address is equal to the entire address generated by the CPU
//----------------------------------------------------------------------------

			PMM_address = {PM_address[13:4], transfer_count[3:0]};
			
//----------------------------------------------------------------------------
// This wren enables the writing of the next word into the cache.
//----------------------------------------------------------------------------

			wren = 1'b1;
			
//----------------------------------------------------------------------------
// The word address is incremented by 1 to point to the next word in the block
//----------------------------------------------------------------------------

			transfer_count = transfer_count + 1'b1;
		
		end
			
//----------------------------------------------------------------------------
// At the end of a block transfer, update the CAMs
//----------------------------------------------------------------------------
		
		if (transfer_count == 5'b10001) begin
		
			miss = 0; wren = 0; transfer_count = 5'b00000; StBusy = 0 ;
			
				if (replace[GrpID] == 0) begin

					din0 = PM_address[13:6]; cam_addrs0 = PM_address[5:4];  we_n0 = 0;
					
					StValid[{2'b00, PM_address[5:4]}] = 1;
				
				end else if (replace[GrpID] == 1) begin

					din1 = PM_address[13:6]; cam_addrs1 = PM_address[5:4]; we_n1 = 0;
					
					StValid[{2'h1, PM_address[5:4]}] = 1;
				
				end else if (replace[GrpID] == 2) begin

					din2 = PM_address[13:6]; cam_addrs2 = PM_address[5:4]; we_n2 = 0;
					
					StValid[{2'h2, PM_address[5:4]}] = 1;
				
				end else begin
				
					din3 = PM_address[13:6]; cam_addrs3 = PM_address[5:4]; we_n3 = 0;
					
					StValid[{2'h3, PM_address[5:4]}] = 1;
				
				end
		end
		
	end
	
end

endmodule
