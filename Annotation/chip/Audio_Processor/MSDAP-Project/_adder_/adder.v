module adder(
    input Sclk,
	input [39:0] a,
    input [39:0] b,
    input add_sub,
	input adder_en,
    output [39:0] sum
    );
   reg [39:0] temp;
	always@(posedge Sclk)
	begin
	  if(adder_en)
	   begin
		if(add_sub == 1'b1)
           temp=b - a;
		else
            temp=b + a;
	   end
	   else
	    temp = temp;
    end
	assign sum = temp;
endmodule