`timescale 1ns/1ps


module intra_pred_l1
#(
  parameter 				ref_size = 8,
  parameter					bitDepth=8,
  parameter 				ref_DW = bitDepth*ref_size,			// ref_size*8
  parameter 				ANG_BDEPTH = bitDepth+5,
  parameter 				PLA_2_BDEPTH = bitDepth+3
)
(
	clk,
	arst_n,
	rst_n,
	bStop,
	weight
	,mainRefReg
	,move
	,X
	,Y
	,top_right_pixel
	,bottom_left_pixel
	,r_r0
	,r_r1
	//,r_r0_
	//,r_r1_ 
	,r_plan_0
	,r_plan_1
	,r_plan_2
	,r_plan_3
//	,r_ang_0
//	,r_ang_1
);

  input clk,arst_n,rst_n,bStop;
  input [ref_size*bitDepth-1:0] mainRefReg; //  8x8
  input [bitDepth-1:0] top_right_pixel,bottom_left_pixel;
  input [11:0] move;      // this value comes from LUT2_1    2bits x 4
  
  input [19:0] weight;
  reg [4:0] w[3:0] ;
 
 

 
	reg [(bitDepth-1):0] refm [ref_size-1:0];
	reg  [2:0] mov[3:0];
	input [2:0]  X,Y;

 
	//output reg[(bitDepth+1)*16-1:0]	 r_r0,r_r1,r_r0_,r_r1_; 
	output reg[(bitDepth+1)*16-1:0]	 r_r0,r_r1; 
	output reg [(bitDepth+4)*16-1:0]	 r_plan_0,r_plan_1; 
	output reg [PLA_2_BDEPTH*16-1:0]	 r_plan_2; 
	output reg [PLA_2_BDEPTH*16-1:0]	 r_plan_3; 
//	output reg [(ANG_BDEPTH)*16-1:0] 	 r_ang_0,r_ang_1; 		//15：0
	wire[((bitDepth+4)*16-1):0]	 plan_0_,plan_1_; 
	wire[(PLA_2_BDEPTH*16-1):0]	 plan_2_; 
	wire[(PLA_2_BDEPTH*16-1):0]	 plan_3_; 
//	wire[(ANG_BDEPTH*16-1):0]	 ang_0_,ang_1_; 
  
  
generate genvar p;
	for(p=0; p<4;p=p+1) begin :xp
		always @(*) begin
			mov[p] = move[11-p*3:9-p*3];
		end
	end
 endgenerate
 
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


	reg signed [bitDepth:0] 	r0[3:0][3:0], r1[3:0][3:0];
	reg signed [bitDepth:0] 	r0_[3:0][3:0], r1_[3:0][3:0];
	reg signed [bitDepth+3:0]	plan_0[3:0][3:0], plan_1[3:0][3:0];
	reg signed [PLA_2_BDEPTH-1:0]	plan_2[3:0][3:0];
	reg signed [PLA_2_BDEPTH-1:0]	plan_3[3:0][3:0];
//	reg signed [ANG_BDEPTH-1:0] 	ang_0[3:0][3:0] ,ang_1 [3:0][3:0]; 		//15：0
	
	
//	reg signed [bitDepth:0]	 	r0_[3:0][3:0], r1_[3:0][3:0];
	reg [2:0] t0[3:0][3:0];
	reg  [6:0] w0[3:0][3:0], w1[3:0][3:0];
	
always @(posedge clk or negedge arst_n) begin
	if(!arst_n) begin
		r_r0 <=0;
		r_r1 <=0;
	//	{r_ang_0,r_ang_1} <=0;
		{r_plan_0,r_plan_1,r_plan_2,r_plan_3} <= 0;
	//	r_r0_ <=0;
	//	r_r0_ <=0;
	end
	else if(!rst_n) begin
		r_r0 <=0;
		r_r1 <=0;
	//	{r_ang_0,r_ang_1} <=0;
		{r_plan_0,r_plan_1,r_plan_2,r_plan_3} <= 0;
//		r_r0_ <=0;
	//	r_r0_ <=0;
		
	end
	else begin
		if(!bStop)	begin
			r_r0<= {r0[0][0],r0[0][1],r0[0][2],r0[0][3],
					r0[1][0],r0[1][1],r0[1][2],r0[1][3],
					r0[2][0],r0[2][1],r0[2][2],r0[2][3],
					r0[3][0],r0[3][1],r0[3][2],r0[3][3]};
			r_r1<= {r1[0][0],r1[0][1],r1[0][2],r1[0][3],
					r1[1][0],r1[1][1],r1[1][2],r1[1][3],
					r1[2][0],r1[2][1],r1[2][2],r1[2][3],
					r1[3][0],r1[3][1],r1[3][2],r1[3][3]};
		
		/*	r_r0_<= {r0_[0][0],r0_[0][1],r0_[0][2],r0_[0][3],
					r0_[1][0],r0_[1][1],r0_[1][2],r0_[1][3],
					r0_[2][0],r0_[2][1],r0_[2][2],r0_[2][3],
					r0_[3][0],r0_[3][1],r0_[3][2],r0_[3][3]};
			r_r1_<= {r1_[0][0],r1_[0][1],r1_[0][2],r1_[0][3],
					r1_[1][0],r1_[1][1],r1_[1][2],r1_[1][3],
					r1_[2][0],r1_[2][1],r1_[2][2],r1_[2][3],
					r1_[3][0],r1_[3][1],r1_[3][2],r1_[3][3]};*/
					
		/*	r_plan_0<= {plan_0[0][0],plan_0[0][1],plan_0[0][2],plan_0[0][3],
					plan_0[1][0],plan_0[1][1],plan_0[1][2],plan_0[1][3],
					plan_0[2][0],plan_0[2][1],plan_0[2][2],plan_0[2][3],
					plan_0[3][0],plan_0[3][1],plan_0[3][2],plan_0[3][3]};
			r_plan_1<= {plan_1[0][0],plan_1[0][1],plan_1[0][2],plan_1[0][3],
					plan_1[1][0],plan_1[1][1],plan_1[1][2],plan_1[1][3],
					plan_1[2][0],plan_1[2][1],plan_1[2][2],plan_1[2][3],
					plan_1[3][0],plan_1[3][1],plan_1[3][2],plan_1[3][3]};
			r_plan_2<= {plan_2[0][0],plan_2[0][1],plan_2[0][2],plan_2[0][3],
					plan_2[1][0],plan_2[1][1],plan_2[1][2],plan_2[1][3],
					plan_2[2][0],plan_2[2][1],plan_2[2][2],plan_2[2][3],
					plan_2[3][0],plan_2[3][1],plan_2[3][2],plan_2[3][3]};*/
	//		{r_ang_0,r_ang_1} <={ang_0_,ang_1_};
			r_plan_0 <= plan_0_;
			r_plan_1 <= plan_1_;
			r_plan_2 <= plan_2_;
			r_plan_3 <= plan_3_;
		end
	end
end
		

	
generate genvar i,j;
	for(i=0;i<4; i=i+1)begin	:xi		//i: row
		//always @(*) begin
		assign	plan_0_[(bitDepth+4)*16-1-(bitDepth+4)*(4*i):(bitDepth+4)*12-(bitDepth+4)*(4*i)] = {plan_0[i][0],plan_0[i][1],plan_0[i][2],plan_0[i][3]};
		assign	plan_1_[(bitDepth+4)*16-1-(bitDepth+4)*(4*i):(bitDepth+4)*12-(bitDepth+4)*(4*i)] = {plan_1[i][0],plan_1[i][1],plan_1[i][2],plan_1[i][3]};
		assign	plan_2_[PLA_2_BDEPTH*16-1-PLA_2_BDEPTH*(4*i):PLA_2_BDEPTH*12-PLA_2_BDEPTH*(4*i)] = {plan_2[i][0],plan_2[i][1],plan_2[i][2],plan_2[i][3]};
		assign	plan_3_[PLA_2_BDEPTH*16-1-PLA_2_BDEPTH*(4*i):PLA_2_BDEPTH*12-PLA_2_BDEPTH*(4*i)] = {plan_3[i][0],plan_3[i][1],plan_3[i][2],plan_3[i][3]};
	//	assign	ang_0_ [ANG_BDEPTH*16-1-ANG_BDEPTH*(4*i):ANG_BDEPTH*12-ANG_BDEPTH*(4*i)] = {ang_0[i][0],ang_0[i][1],ang_0[i][2],ang_0[i][3]};
	//	assign	ang_1_ [ANG_BDEPTH*16-1-ANG_BDEPTH*(4*i):ANG_BDEPTH*12-ANG_BDEPTH*(4*i)] = {ang_1[i][0],ang_1[i][1],ang_1[i][2],ang_1[i][3]};
		//end
		for(j=0 ;j<4;j=j+1) begin: xj		//j: col
			always @(*)  begin
				//angular modes
				t0[i][j] = mov[i]+j;		  
				w0[i][j]=32-w[i];
				w1[i][j]=w[i];
				r0[i][j]=refm[t0[i][j]];
				r1[i][j]=refm[t0[i][j]+1];
				
		//		ang_0[i][j] = $signed({1'b0,w0[i][j]})*r0[i][j];
		//		ang_1[i][j] = $signed({1'b0,w1[i][j]})*r1[i][j];
				//planar modes
			//	r0_[i][j]= $signed(top_right_pixel-refm[4+i]);
			//	r1_[i][j]= $signed(bottom_left_pixel-refm[j]);
				r0_[i][j]= $signed({1'b0,top_right_pixel}-{1'b0,refm[4+i]});
				r1_[i][j]= $signed({1'b0,bottom_left_pixel}-{1'b0,refm[j]});

				plan_0[i][j] = $signed({1'b0,X})*r0_[i][j];
				plan_1[i][j] = $signed({1'b0,Y})*r1_[i][j];
			//	plan_0[i][j] = $signed(X*r0_[i][j]);
			//	plan_1[i][j] = $signed(Y*r1_[i][j]);
				plan_2[i][j] = $signed(r0_[i][j]*(j+1));
				plan_3[i][j] = $signed(r1_[i][j]*(i+1));
				
				
			end 
			
		end 		
	end
endgenerate
  
endmodule

