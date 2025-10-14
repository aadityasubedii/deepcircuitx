module sxrRISC621_cam (we_n, rd_n, din, argin, addrs, dout, mbits);

//----------------------------------------------------------------------------
//-- Declare input and output port types
//----------------------------------------------------------------------------

	input						we_n, rd_n;		// write and read enables

	input				[7:0]	din, argin;		// data input and argument input busses

	input				[1:0]	addrs;			// address input bus; points to 8 locations

	output	reg	[7:0]	dout;				// data output

	output	reg	[3:0]	mbits;			// mbits = match bits

//----------------------------------------------------------------------------
//-- Declare internal memory array
//----------------------------------------------------------------------------

	reg		[7:0] cam_mem [3:0]; //an array of 2x8 bit locations

//----------------------------------------------------------------------------
//-- The WRITE procedural block.
//-- This enables a new tag value to be written at a specific location, 
//--    using a WE, data input and address input busses as with any
//--    other memory.
//-- In the context of a cache, this happens when a new block is 
//--    uploaded in the cache.
//----------------------------------------------------------------------------

	always @ (we_n, din, addrs)	begin
		if (we_n == 0)
					cam_mem[addrs] = din;
	end
	
//----------------------------------------------------------------------------
//-- The READ procedural block.
//-- This allows a value at a specific location to be read out, 
//--    using a RD, data output and address input busses as with any
//--    other memory.
//-- In the context of a cache, this is not necessary. This functionality 
//--    is provided here for reference and debugging purposes.
//----------------------------------------------------------------------------
	always @ (rd_n, addrs, cam_mem) begin
			if (rd_n == 0)
					dout = cam_mem[addrs];
			else
					dout = 8'bzzzzzzzz;
	end

//----------------------------------------------------------------------------
//-- The MATCH procedural block.
//-- This implements the actual CAM function.
//-- An mbit is 1 if the argument value is equal to the content of the 
//--    memory location associated with it.
//----------------------------------------------------------------------------

	always @ (argin, cam_mem) begin

	mbits = 4'h0;
			if (argin == cam_mem[0])
				mbits[0] = 1'b1;
			
			if (argin == cam_mem[1])
				mbits[1] = 1'b1;
			
			if (argin == cam_mem[2])
				mbits[2] = 1'b1;
			
			if (argin == cam_mem[3])
				mbits[3] = 1'b1;
			
	end

endmodule