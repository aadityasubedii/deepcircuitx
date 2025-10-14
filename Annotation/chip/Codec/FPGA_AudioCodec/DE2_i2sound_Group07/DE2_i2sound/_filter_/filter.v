`timescale 1ns / 1ps
module filter#(parameter N = 65)(input sample_clock, input reset, input [15:0] input_sample1, output reg [15:0] output_sample1);

 //Specify the number of taps

reg [15:0] delayholder[N-1:0];
wire signed[31:0] summation[N-1:0];
reg signed[15:0] finsummations[N-1:0];
reg signed[15:0] finsummation;

//Specifying our coefficients
reg signed [15:0] coeffs[200:0];

integer x;
integer z;

always @(*)
begin

for (x=0; x<N; x=x+31)
begin

    coeffs[x+0] = 1;
    coeffs[x+1] = 1;
    coeffs[x+2] = 1;
    coeffs[x+3] = 1;
    coeffs[x+4] = 1;
    coeffs[x+5] = 1;
    coeffs[x+6] = 1;
    coeffs[x+7] = 1;
    coeffs[x+8] = 1;
    coeffs[x+9] = 1;
    coeffs[x+10] = 1;
    coeffs[x+11] = 1;
    coeffs[x+12] = 1;
    coeffs[x+13] = 1;
    coeffs[x+14] = 1;
    coeffs[x+15] = 1;
    coeffs[x+16] = 1;
    coeffs[x+17] = 1;
    coeffs[x+18] = 1;
    coeffs[x+19] = 1;
    coeffs[x+20] = 1;
    coeffs[x+21] = 1;
    coeffs[x+22] = 1;
    coeffs[x+23] = 1;
    coeffs[x+24] = 1;
    coeffs[x+25] = 1;
    coeffs[x+26] = 1;
    coeffs[x+27] = 1;
    coeffs[x+28] = 1;
    coeffs[x+29] = 1;
    coeffs[x+30] = 1;
	 end
end

generate
genvar i;
for (i=0; i<N; i=i+1)
    begin: mult1
        multiplier mult1(.dataa(coeffs[i]), .datab(delayholder[i]),.result(summation[i]));
    end
endgenerate

always @(posedge sample_clock or posedge reset)
begin
if(reset)
        begin
		  output_sample1 = 0;
		  for (z=0; z<N; z=z+1)
		  begin
		  delayholder[z] = 0;
		  end
end

else
        begin  
		  for (z=N-1; z>0; z=z-1)
		  begin
		  delayholder[z] = delayholder[z-1];
		  end
		  delayholder[0] = input_sample1;
end

	     for (z=0; z<N; z=z+1)
	     begin
        finsummations[z] = {summation[z][31], summation[z][29:15]};  //summation[z] >>> 15;
        end
	 
		  finsummation = 0;
	     for (z=0; z<N; z=z+1)
		  begin
		  finsummation = finsummation + finsummations[z];
		  end

		  output_sample1 = finsummation;
end

endmodule
