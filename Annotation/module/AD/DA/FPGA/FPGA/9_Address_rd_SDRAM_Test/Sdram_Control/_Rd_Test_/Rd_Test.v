module Rd_Test
(
		iCLK,
		iRST_n,
		iBUTTON,
		address_in,
		
	   read,
		readdata,

		c_state,
		outdata,
		outack,
		RD_LOAD,
		address_out
		
);

parameter      ADDR_W             =     25;
parameter      DATA_W             =     16;

input          iCLK;
input          iRST_n;
input          iBUTTON;
input  [ADDR_W-1:0]    address_in;  
output	      read;
input	 [DATA_W-1:0]  readdata;
	
output [3:0]   c_state;	
output reg	[DATA_W-1:0]  	outdata;
output reg						outack;
output reg						RD_LOAD;
output reg	[ADDR_W-1:0]   address_out; 

//=======================================================
//  Signal declarations
//=======================================================

reg  [1:0]           pre_button;
(* preserve *)reg                  trigger;
reg  [3:0]           c_state;		
reg	               read; 
reg  [4:0]           write_count;

always@(posedge iCLK)
begin
	if (!iRST_n)
	begin 
		pre_button <= 2'b11;
		trigger <= 1'b0;
		write_count <= 5'b0;
		c_state <= 4'b0;
		read <= 1'b0;
		outdata<={DATA_W{1'b0}};
		RD_LOAD<=1'b1;
		outack<=1'b0;
	 end
	else
	begin
	   pre_button <= {pre_button[0], iBUTTON};
		trigger <= !pre_button[0] && pre_button[1];

	  case (c_state)
	  	0 : begin //idle
			RD_LOAD<=1'b0;
			read <= 0;
			outack<=1'b0;
	  			if (trigger)
	  		begin
				address_out <= address_in;
	  			c_state <= 10;
				RD_LOAD<=1'b1;
	  		end

	  	end
			
		10 : 
		begin
			c_state <= 11;
			RD_LOAD<=1'b0;
		end
		11 : c_state <= 4;
	  	4 : begin //read
	  			read <= 1;
			
	       if (!write_count[3])
	  			write_count <= write_count + 1'b1;
	  		
	  		   c_state <= 5;
	  	end
	  	5 : begin //latch read data
	  		read <= 0;
		  
		  if (!write_count[3])
	  			write_count <= write_count + 5'b1;

	  	   c_state <= 6;
       end
	  	6 : begin //finish compare one data
	  		if (write_count[3])
	  		begin
	  			write_count <= 5'b0;
				outdata <= readdata;
	  			c_state <= 7;
        end
        else
        	write_count <= write_count + 1'b1;
	  	end
	  	7 : begin
			   c_state <= 9;
  		 end
		9 : c_state <= 12;
		12 : c_state <= 13;
		13 :
		begin
			if (write_count==5'd3)
	  		begin
	  			write_count <= 5'b0;
				read <= 1;
	  			c_state <= 14;
			end
			else
			begin
				write_count <= write_count + 1'b1;
				read <= 0;
			end
		end
		14 : 
		begin
			read <= 0;
			c_state <= 15;
		end
		15 : 
		begin
			c_state <= 0;
			read <= 0;
			outdata <= readdata;
			outack<=1'b1;
		end
	    default : c_state <= 0;
	  endcase
  end
end
		
// test result


endmodule
