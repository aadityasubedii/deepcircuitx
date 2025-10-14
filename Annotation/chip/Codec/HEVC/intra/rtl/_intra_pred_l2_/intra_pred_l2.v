`timescale 1ns/1ps


module intra_pred_l2
#(
  parameter 				ref_size = 8,
  parameter					bitDepth=8,
  parameter 				ref_DW = bitDepth*ref_size,			// ref_size*8
  parameter 				ANG_BDEPTH = bitDepth+5,
  parameter 				PLA_2_BDEPTH = bitDepth+3
  )
(
	clk
	,arst_n
	,rst_n
	,bStop
	,weight
	,mainRefReg
	,predSamples
	,mode
	,top_left_pixel
	,X
	,Y
	,preStage
	,DC_xxxx_data
	,isPredFilter
	,tuSize
	,gp_bitDepth
	,r_r0
	,r_r1
//	,r_ang_0
//	,r_ang_1
	,r_plan_0
	,r_plan_1
	,r_plan_2
	,r_plan_3
	,unFil_opt
);


  input							clk,arst_n,rst_n,bStop;
  input [2:0] 					tuSize;
  input [ref_size*bitDepth-1:0] mainRefReg; //  8x8
  input [bitDepth-1:0] 			top_left_pixel;
  input [5:0] 					mode;
  input 						isPredFilter;
  input [3:0]					gp_bitDepth;
  input [3:0]					preStage;
  input [1:0]					unFil_opt;
  
  input [19:0] weight;
  reg [4:0] w[3:0] ;
 
  output  reg [(bitDepth)*16-1:0] predSamples;     //9 x 16
  reg [(bitDepth-1):0] refm [ref_size-1:0];
  input [2:0]  X,Y;
  input	[(bitDepth+3)*2-1:0]   	DC_xxxx_data;
  
  reg [bitDepth-1:0] predPixel [3:0][3:0];
  
  wire [3:0] bdepth_8_10 = gp_bitDepth[1]? 10:8;
  	
  input [(bitDepth+1)*16-1:0]		r_r0,r_r1;		
  input [(bitDepth+4)*16-1:0]	 	r_plan_0,r_plan_1; 
  input [PLA_2_BDEPTH*16-1:0]	 	r_plan_2; 
  input [PLA_2_BDEPTH*16-1:0]	 	r_plan_3; 
//  input [ANG_BDEPTH*16-1:0]	 		r_ang_0,r_ang_1; 
 
 
generate genvar k;
	for(k=0;k<ref_size;k=k+1)begin: xk
		always @(*) begin
			refm[k] =mainRefReg[bitDepth*8-1-bitDepth*k:bitDepth*7-bitDepth*k];
		end
	end
endgenerate

generate genvar u;
   for(u=0;u<4;u=u+1)begin: xu
		always @(*) begin
			w[u]=weight[19-5*u:15-5*u];
		end
	end
endgenerate


	reg [bitDepth-1:0] a [3:0][3:0];
	reg [bitDepth-1:0] a_ [3:0][3:0];
	reg signed [bitDepth:0] b [3:0];
	reg signed [bitDepth:0] c [3:0];
	reg signed [bitDepth:0] r0[3:0][3:0], r1[3:0][3:0];
//	reg signed [bitDepth:0] r0_[3:0][3:0], r1_[3:0][3:0];
	reg [2:0] t0[3:0][3:0];
	reg  [5:0] w0[3:0][3:0], w1[3:0][3:0];
	reg signed [ANG_BDEPTH:0] mul2_sum [3:0][3:0]; 		//15：0
	reg signed [bitDepth+4:0] t [3:0][3:0]; 			//12：0
	reg signed [bitDepth+4:0] t1 [3:0][3:0]; 			//12：0
	reg signed [bitDepth+4:0] t2 [3:0][3:0]; 			//12：0
	reg  [1:0]  tm2; 



	reg signed	 [bitDepth+3:0]	plan_0[3:0][3:0], plan_1[3:0][3:0];
	reg  signed	 [PLA_2_BDEPTH-1:0]	plan_2[3:0][3:0];
	reg  signed	 [PLA_2_BDEPTH-1:0]	plan_3[3:0][3:0];
	reg  signed  [PLA_2_BDEPTH:0]	tmp [3:0][3:0];
	


reg [bitDepth+3:0] 					DC_xxxxx;
reg [bitDepth+7:0] 					DC_unShift;
reg [bitDepth+7:0] 					DC_unShift_temp;
reg [6:0] 							dev;
reg [2:0] 							shift;
reg [bitDepth-1:0] 					unFilDC;
reg [bitDepth-1:0]					unFilDC_;
reg [bitDepth-1:0]  				unFilDC_5,unFilDC_432;

reg signed [ANG_BDEPTH-1:0] 		ang_0[3:0][3:0],ang_1 [3:0][3:0]; 		//15：0
reg [bitDepth+1:0] 					dc1_9bit[3:0][3:0];
reg [bitDepth-1:0] 					dc2_8bit[3:0][3:0] ,dc3_8bit[3:0][3:0];
reg [bitDepth+2:0] 					DC_xxxx[1:0];

always @(posedge clk or negedge arst_n) begin
	if(~arst_n)
		{DC_unShift,unFilDC_} <= 0;
	else if(~rst_n)
		{DC_unShift,unFilDC_} <= 0;
	else begin
	    if(!bStop) begin
			if(preStage == 4'd0 || tuSize == 3'd3 || tuSize==3'd2)
				DC_unShift <= DC_xxxxx;
			else if(preStage[3]!=1)
				DC_unShift <= DC_unShift_temp; 
		
			case(unFil_opt)
			3'd1:unFilDC_ <= (DC_unShift+dev)>>shift;
			3'd2:unFilDC_ <= (DC_unShift_temp+dev)>>shift;
			default:;
			endcase
		end
	
	
	end
end




always @(*) begin
	tm2 = tuSize-2;
	{r0[0][0],r0[0][1],r0[0][2],r0[0][3],
	r0[1][0],r0[1][1],r0[1][2],r0[1][3],
	r0[2][0],r0[2][1],r0[2][2],r0[2][3],
	r0[3][0],r0[3][1],r0[3][2],r0[3][3]}   = r_r0;
	
	{r1[0][0],r1[0][1],r1[0][2],r1[0][3],
	r1[1][0],r1[1][1],r1[1][2],r1[1][3],
	r1[2][0],r1[2][1],r1[2][2],r1[2][3],
	r1[3][0],r1[3][1],r1[3][2],r1[3][3]}   = r_r1;
	
	
	{DC_xxxx[0],DC_xxxx[1]} = DC_xxxx_data;
	DC_xxxxx = DC_xxxx[0] + DC_xxxx[1];
	DC_unShift_temp = DC_unShift + DC_xxxxx;
	if(tuSize[1])	//tuSize==2 or 3; 
		DC_unShift_temp = DC_xxxxx;
	
	dev = (1<<tuSize);
	shift = tuSize+1;
	unFilDC_5 = (DC_unShift+dev)>>shift;
	unFilDC_432 = (DC_unShift_temp+dev)>>shift;
	unFilDC = unFilDC_;
	case(unFil_opt)
	3'd0:unFilDC = unFilDC_;
	3'd1:unFilDC = unFilDC_5;//(DC_unShift+dev)>>shift;
	default:unFilDC = unFilDC_432;//(DC_unShift_temp+dev)>>shift;
	endcase
	
	
	/*{r0_[0][0],r0_[0][1],r0_[0][2],r0_[0][3],
	r0_[1][0],r0_[1][1],r0_[1][2],r0_[1][3],
	r0_[2][0],r0_[2][1],r0_[2][2],r0_[2][3],
	r0_[3][0],r0_[3][1],r0_[3][2],r0_[3][3]} = r_r0_;
	
	{r1_[0][0],r1_[0][1],r1_[0][2],r1_[0][3],
	r1_[1][0],r1_[1][1],r1_[1][2],r1_[1][3],
	r1_[2][0],r1_[2][1],r1_[2][2],r1_[2][3],
	r1_[3][0],r1_[3][1],r1_[3][2],r1_[3][3]} = r_r1_;*/
/*	{plan_0[0][0],plan_0[0][1],plan_0[0][2],plan_0[0][3],
	plan_0[1][0],plan_0[1][1],plan_0[1][2],plan_0[1][3],
	plan_0[2][0],plan_0[2][1],plan_0[2][2],plan_0[2][3],
	plan_0[3][0],plan_0[3][1],plan_0[3][2],plan_0[3][3]} = r_plan_0;
	{plan_1[0][0],plan_1[0][1],plan_1[0][2],plan_1[0][3],
	plan_1[1][0],plan_1[1][1],plan_1[1][2],plan_1[1][3],
	plan_1[2][0],plan_1[2][1],plan_1[2][2],plan_1[2][3],
	plan_1[3][0],plan_1[3][1],plan_1[3][2],plan_1[3][3]} = r_plan_1;
	{plan_2[0][0],plan_2[0][1],plan_2[0][2],plan_2[0][3],
	plan_2[1][0],plan_2[1][1],plan_2[1][2],plan_2[1][3],
	plan_2[2][0],plan_2[2][1],plan_2[2][2],plan_2[2][3],
	plan_2[3][0],plan_2[3][1],plan_2[3][2],plan_2[3][3]} = r_plan_2;*/
end

generate genvar i,j;
	for(i=0;i<4; i=i+1)begin	:xi		//i: row
		always @(*)  begin
			c [i] = ($signed({1'b0,refm[4+i]}-{1'b0,top_left_pixel})>>>1);    // here has problem, about refm[4+i] in pixel_ctrl
			b [i] = a[i][0]+c[i];
			predSamples[bitDepth*16-1-bitDepth*(4*i):bitDepth*12-bitDepth*(4*i)] = {predPixel[i][0],predPixel[i][1],predPixel[i][2],predPixel[i][3]};
			 {plan_0[i][0],plan_0[i][1],plan_0[i][2],plan_0[i][3]}=r_plan_0[(bitDepth+4)*16-1-(bitDepth+4)*(4*i):(bitDepth+4)*12-(bitDepth+4)*(4*i)];
			 {plan_1[i][0],plan_1[i][1],plan_1[i][2],plan_1[i][3]}=r_plan_1[(bitDepth+4)*16-1-(bitDepth+4)*(4*i):(bitDepth+4)*12-(bitDepth+4)*(4*i)];
			 {plan_2[i][0],plan_2[i][1],plan_2[i][2],plan_2[i][3]}=r_plan_2[PLA_2_BDEPTH*16-1-PLA_2_BDEPTH*(4*i):PLA_2_BDEPTH*12-PLA_2_BDEPTH*(4*i)];
			 {plan_3[i][0],plan_3[i][1],plan_3[i][2],plan_3[i][3]}=r_plan_3[PLA_2_BDEPTH*16-1-PLA_2_BDEPTH*(4*i):PLA_2_BDEPTH*12-PLA_2_BDEPTH*(4*i)];
//			 {ang_0[i][0],ang_0[i][1],ang_0[i][2],ang_0[i][3]}=r_ang_0[ANG_BDEPTH*16-1-ANG_BDEPTH*(4*i):ANG_BDEPTH*12-ANG_BDEPTH*(4*i)];
//			 {ang_1[i][0],ang_1[i][1],ang_1[i][2],ang_1[i][3]}=r_ang_1[ANG_BDEPTH*16-1-ANG_BDEPTH*(4*i):ANG_BDEPTH*12-ANG_BDEPTH*(4*i)];
		//	 {ang_1[i][0],ang_1[i][1],ang_1[i][2],ang_1[i][3]}=r_ang_1[(bitDepth+6)*16-1-(bitDepth+6)*(4*i):(bitDepth+6)*12-(bitDepth+6)*(4*i)];

		end
		for(j=0 ;j<4;j=j+1) begin: xj		//j: col
			always @(*)  begin
				//angular modes	  
				w0[i][j]=32-w[i];
				w1[i][j]=w[i];
		//		r0[i][j]= r_r0[(bitDepth+1)*16-1-(bitDepth+1)*(4*i+j):15*(bitDepth+1)*(4*i+j)];		//refm[t0[i][j]];
		//		r1[i][j]= r_r1[(bitDepth+1)*16-1-(bitDepth+1)*(4*i+j):15*(bitDepth+1)*(4*i+j)];		//refm[t0[i][j]+1];
				mul2_sum[i][j] = $signed({1'b0,w0[i][j]})*r0[i][j]+ $signed({1'b0,w1[i][j]})*r1[i][j] ;
		//		mul2_sum[i][j] = ang_0[i][j]+ ang_1[i][j] ;
				a [i][j] = (mul2_sum[i][j]+16)>>5;   
				
				
				//planar modes
			//	r0_[i][j]= 	r_r0_[(bitDepth+1)*16-1-(bitDepth+1)*(4*i+j):15*(bitDepth+1)*(4*i+j)];	//$signed({1'b0,top_right_pixel}-{1'b0,refm[4+i]});
			//	r1_[i][j]=  r_r1_[(bitDepth+1)*16-1-(bitDepth+1)*(4*i+j):15*(bitDepth+1)*(4*i+j)];		//$signed({1'b0,bottom_left_pixel}-{1'b0,refm[j]});

				tmp[i][j] =  plan_2[i][j]+plan_3[i][j];
			//	t[i][j] = $signed({1'b0,X})*r0_[i][j] + $signed({1'b0,Y})*r1_[i][j] + (((r0_[i][j]*(j+1)) + (r1_[i][j]*(i+1))) >> 2);
				t[i][j] = plan_0[i][j] +(plan_1[i][j])+ (tmp[i][j]>>>2);
				t1[i][j]= tm2[1]? {2'b00,t[i][j][bitDepth+4:2]}:t[i][j];//  (mul2_sum_[i][j]>>4);
				t2[i][j]= tm2[0]? {1'b0,t1[i][j][bitDepth+4:1]}:t1[i][j];
				a_ [i][j] = (t2[i][j] + refm[4+i] + refm[j] + 1) >> 1; 
				
				
				dc2_8bit[i][j] =0; dc3_8bit[i][j] = 0;   dc1_9bit[i][j] = 0;   
				if(mode==1) begin
					if(i==0 && j==0 && X==0 && Y==0)
						begin  dc2_8bit[i][j] = refm[0];   dc3_8bit[i][j] = refm[4];   dc1_9bit[i][j] = ((unFilDC<<1)+2);     end
					else if  (i ==0 &&  Y==0)
						begin  dc2_8bit[i][j] = refm[j];   dc3_8bit[i][j] = unFilDC;   dc1_9bit[i][j] = ((unFilDC<<1)+2);     end
					else if  (j ==0 && !X ) 
						begin  dc2_8bit[i][j] = refm[4+i]; dc3_8bit[i][j] = unFilDC;   dc1_9bit[i][j] = ((unFilDC<<1)+2);   end
				end
			end 
   
		   always @ (*)begin			   //with intraPredAngle==0 filtering 
				predPixel[i][j] = {a_[i][j]};
				if(mode!=0)
					predPixel[i][j] = a [i][j]; 
					  // when planar, save the above[]
				if((mode == 10 || mode == 26) && isPredFilter)  begin      
					if(j==0 && X==0)
						if(c[i][bitDepth]==0)
							predPixel[i][0] = (b[i]>>bdepth_8_10)%2==1? ((1<<bdepth_8_10)-1): b[i][bitDepth-1:0];
						else
							predPixel[i][0] = b[i][bitDepth]==1? 0: b[i][bitDepth-1:0] ;
					else if(j!=0)
						predPixel[i][j] =  a [i][j];
					end
					
					if(mode == 1 && isPredFilter) begin
						if((j ==0 && X==0) || (i ==0 &&  Y==0 ))
							predPixel[i][j] = ((dc2_8bit[i][j]+dc3_8bit[i][j]+dc1_9bit[i][j])>>2);
						else 
							predPixel[i][j] = unFilDC;
						end
					else if(mode==1)
						predPixel[i][j] = unFilDC;  //((dc_ref_0123+HALF_PU_SIZE)>>2);
			end
		end 		
	end
endgenerate
  
endmodule

