module register_file (Aout,Bout,Cin,Aadd,Badd,Cadd,load,clear,clock);        

input[3:0] Aadd,Badd,Cadd;    
input[15:0] Cin;
input load,clear,clock;
output[15:0] Aout,Bout;

reg [15:0] registers [15:0];

	integer i;    
