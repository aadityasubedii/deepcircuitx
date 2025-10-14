module FilterDisplay(
  input wire [3:0] filtnum,        
  output wire [7:0] SevenSegment,
  output wire [2:0] SevenSegmentEnable
	);

reg [2:0]  enable;
reg [7:0]  bcd [0:15];  
