`timescale 1ns / 1ps

//2:4 decoder module
module decoder(y, w, En);

	
input wire [1:0] w;
input wire En;
output reg [3:0] y;

	
always @ (*)
	
begin

	if (En == 1)
		
	
	case (w)
			
        2'b00 : y = 4'b0001;
		
	    2'b01 : y = 4'b0010;
		
	    2'b10 : y = 4'b0100;
		
     	2'b11 : y = 4'b1000;
	
	endcase


	else
		
        y = 4'b0000;
end

endmodule


/////////////////////////////////////////////////////////////


//2-4 decoder test bench
`timescale 1ns / 1ps



module two_four_decoder_tb();

	reg [1:0] w;
	reg En;
    wire [3:0] y;


	decoder uut(
	
    .y(y),
	.w(w),
	.En(En)
	);

	
    initial 
    $monitor ("En=%b, w=%b, y=%b", En, w, y);

	

    initial 
    begin
		

        #0	
            w = 2'b00;
	        En = 1'b1;

		
        #10	w = 2'b01;
			En = 1'b1;

		
        #10	w = 2'b10;
	        En = 1'b1;

	
	    #10	w = 2'b11;
	        En = 1'b1;
		
	
		#10 w = 2'b10;
		    En = 1'b0;	

	
	   #10	$stop;
	 
    end
endmodule
