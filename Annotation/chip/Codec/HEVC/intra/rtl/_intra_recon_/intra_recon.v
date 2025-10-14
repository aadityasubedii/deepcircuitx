`timescale 1ns/1ps
 module intra_recon(
  clk,
  arst_n,
  rst_n,
  predSamples,
  predSamples_inter,
  residuals,
  tuSize,
  reconSamples
  ,opt_recon
  ,r_reconSamples
  ,gp_bitDepth
  );
  
  parameter nPixel = 16;
  parameter pixWidth = 8;
  parameter pixWidth_plus1 = pixWidth+1;
  
  input 						clk,arst_n,rst_n;
  input 	[nPixel*pixWidth-1:0] predSamples; 
  input 	[nPixel*pixWidth_plus1-1:0] residuals;
  input 	[2:0] tuSize;
  output reg [nPixel*pixWidth-1:0] 		reconSamples;
  input		[pixWidth*16-1:0] 		r_reconSamples;	
  input		[pixWidth*16-1:0]		predSamples_inter;
  input		[3:0]					gp_bitDepth;
  input 	[2:0]					opt_recon;
  
  
  reg 		[pixWidth-1:0] 				temp_pred[3:0][3:0]; 
  reg 		[pixWidth-1:0] 				pred[3:0][3:0];
  reg signed [pixWidth_plus1-1:0] 		resi[3:0][3:0];
  reg signed [pixWidth_plus1-1:0] 		result[3:0][3:0];
  reg 		[pixWidth-1:0]				recon[3:0][3:0];
  reg 		[1:0] 						opt1[3:0][3:0];
  
  wire      [1:0]   					opt_a;
  wire									en_recon;
  wire 		[3:0] 						bdepth_8_10 = gp_bitDepth[1]? 10:8;
  wire 		[pixWidth-1:0]				maxVal=(1<<bdepth_8_10)-1;			
 
  assign 	{opt_a,en_recon} 		= 	opt_recon;
  
generate genvar i,j;
	for(i=0;i<4; i=i+1)begin	:xi		//i: row
		for(j=0 ;j<4;j=j+1) begin: xj		//j: col
			always @(*)  begin   
				pred[i][j] =  predSamples[pixWidth*16-1-pixWidth*(4*i+j):pixWidth*15-pixWidth*(4*i+j)];
	
				case(opt_a)
				2'd0: temp_pred[i][j]  = pred[i][j];
				2'd1: temp_pred[i][j]  = pred[j][i];
				default: temp_pred[i][j] = predSamples_inter[pixWidth*16-1-pixWidth*(4*i+j):pixWidth*15-pixWidth*(4*i+j)];
				endcase
				
				resi[i][j] = residuals[16*pixWidth_plus1-1-pixWidth_plus1*(4*i+j): 15*pixWidth_plus1-pixWidth_plus1*(4*i+j)];
				  
				result[i][j] = {1'b0,temp_pred[i][j]}+resi[i][j];
			 
				if(en_recon)
					recon[i][j] =  (result[i][j]>>bdepth_8_10)%2==1? (resi[i][j][pixWidth_plus1-1]==1? 0:maxVal):(result[i][j][pixWidth-1:0]);
				else
					recon[i][j] = r_reconSamples[16*pixWidth-1-pixWidth*(4*i+j): 15*pixWidth-pixWidth*(4*i+j)];


			end
			
		end
		always @(*) begin
			reconSamples[16*pixWidth-1-pixWidth*(4*i): 12*pixWidth-pixWidth*(4*i)] = {recon[i][0],recon[i][1],recon[i][2],recon[i][3]}; 
		end
	end
endgenerate


  
endmodule
