`timescale 1ns/1ps
module intra_s3RefSubsti(
	data,
	data_tl,
	sub_data,
	sub_tl,
	byPa_P_DR_1,
	byPa_P_DR_1_cr
	,btRtSamples
	,substi_Opt
);
	parameter							isChroma =0;
	parameter 		 					bitDepth = 8;
	parameter						  	SRAMDW      = bitDepth*4;
	parameter 							nSRAMs 		=8;
	
	
	input [bitDepth*32-1:0]				data;
	input [bitDepth-1:0]				data_tl;
	input [bitDepth*4-1:0] 				byPa_P_DR_1;		// bitDepth*4
	input [bitDepth*4-1:0] 				byPa_P_DR_1_cr;
	input [3*8+1:0]						substi_Opt;


	input [bitDepth*2-1:0]				btRtSamples;

	
	output reg [bitDepth*32-1:0]		sub_data;
	output reg [bitDepth-1:0]			sub_tl;
	
	reg [bitDepth*4-1:0] 				srambank[7:0];
	reg [bitDepth-1:0] 					pixel[7:0][3:0];
	reg [bitDepth-1:0] 					sub_pixel[7:0][3:0];
	reg [bitDepth-1:0]					bp1_4samp[3:0];
	
	reg [bitDepth-1:0] 					temp_sub[7:0][3:0]; 
	reg [2:0]							opt[7:0];
	
	wire [bitDepth-1:0] 	   r_b;  
	wire [bitDepth-1:0] 	   r_rt;  
	reg 								is_topl_sub,channel_Cr;
	
	assign {r_b,r_rt}  =  btRtSamples;
	
	
	always@(*) begin	
				{channel_Cr,is_topl_sub,opt[0],opt[1],opt[2],opt[3],opt[4],opt[5],opt[6],opt[7]} = substi_Opt;
				
				if(!channel_Cr)
					{bp1_4samp[0],bp1_4samp[1],bp1_4samp[2],bp1_4samp[3]} = byPa_P_DR_1;	
				else	begin
					{bp1_4samp[0],bp1_4samp[1],bp1_4samp[2],bp1_4samp[3]} = byPa_P_DR_1_cr;	
					end
				end

				
				
always @(*)	begin

	if(is_topl_sub)
		sub_tl = bp1_4samp[0];
	else	
		sub_tl = data_tl;
end

generate
		genvar i,q;
		 for(i=0;i<8;i=i+1)begin: xi
			always @(*) begin	
				srambank[i] = data[bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i];			
				sub_data [bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i] = {sub_pixel[i][0],sub_pixel[i][1],sub_pixel[i][2],sub_pixel[i][3]};
							end	//end always
				for(q=0;q<4;q=q+1) begin: xq  //idx of pixel in chip[p]
					always @(*) begin	
						pixel[i][q] =  srambank[i][SRAMDW-1-bitDepth*q:SRAMDW-bitDepth*(q+1)];
						case(opt[i])
						3'd1: sub_pixel[i][q] =  bp1_4samp[q];
						3'd2: sub_pixel[i][q] =  bp1_4samp[0];
						3'd3: sub_pixel[i][q] =  bp1_4samp[3];
						3'd4: sub_pixel[i][q] =  r_b;
						3'd5: sub_pixel[i][q] =  r_rt;
						default: sub_pixel[i][q] = pixel[i][q];
						endcase
						
					end	//end always
				end		//end for	
		end
	endgenerate
	
endmodule




