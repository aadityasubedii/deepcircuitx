module topaudio_test;

	// Inputs
	reg clock;
	reg miso;

	// Outputs
	wire adconv;
	wire ready;
	wire sck;
	wire mosi;
	wire daccs;
	wire dacclr;
	wire spissb;
	wire sf_ce0;
	wire fpgainitb;
	wire ampcs;
	wire ampshdn;

	// Instantiate the Unit Under Test (UUT)
	topaudio uut (
		.clock(clock), 
		.miso(miso), 
		.adconv(adconv), 
		.ready(ready), 
		.sck(sck), 
		.mosi(mosi), 
		.daccs(daccs), 
		.dacclr(dacclr), 
		.spissb(spissb), 
		.sf_ce0(sf_ce0), 
		.fpgainitb(fpgainitb), 
		.ampcs(ampcs), 
		.ampshdn(ampshdn)
	);

	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(2500*10**3) begin
			clock=~clock;
			#50;
		end
	end
	
	initial begin
		clock = 0;
		miso = 0;
		#100;
		repeat(1250*10**2) begin
			miso=~miso;
			#1000;
		end
	end
      
endmodule