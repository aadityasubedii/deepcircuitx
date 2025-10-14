module intra_util(
	clk,
	rst_n,
	arst_n,
	bStop,
	bStop1,
	mode,
	tuSize,
	X,
	Y,
	preStage,
	ref_pos,     //i
	ref_flag,   //i
	options,
	ramIdxMapping,
	idx_mapped_,
	isInter,
	modeHor,
	opt_recon,
	unFil_opt_
);
	parameter							isChroma=0;
	input					clk,rst_n,arst_n,bStop,bStop1;
	input [5:0]				mode;
	input [2:0]				tuSize;
	input [2:0]				X,Y;
	input [47:0] 			ref_pos;
	input [15:0] 			ref_flag;
	input [3*8-1:0]  		ramIdxMapping;
	input [3:0] 			preStage;
	input					isInter,modeHor;
	
	output	[53:0]   		options;
	output 	reg [3*24-1:0]	idx_mapped_;
	output	[2:0]			opt_recon;
	output 	[1:0]			unFil_opt_;
	
	reg 	[1:0]			opt_,opt;
	reg     				en_result;

	wire noFilter1= (tuSize ==2) || mode == 6'd1;
	wire noFilter22 = (mode== 6'd10) || (mode== 6'd9) || (mode== 6'd11) ;
	wire noFilter23 = (mode== 6'd25) || (mode== 6'd26) || (mode== 6'd27) ;
	wire noFilter2 = (tuSize ==4) && (noFilter23 || noFilter22);
	wire noFilter3 =  (tuSize ==5 ) && (mode == 10 || mode == 26) ;
	wire noFilter4 = ((tuSize == 3) && (mode!=0 && mode!=2)) && (mode!=18 && mode!=34);
	
	reg [5:0] pos [7:0];
	reg [5:0] pos_plus1 [7:0];
	reg [5:0] pos_minus1 [7:0];
	reg [1:0] flag [7:0];   //0 top,  1 left, 2 top_left 
	reg [1:0] midLtRt_opt[7:0];
	reg [15:0] midLtRt_opt_; 
	
	reg [2:0] ramIdx [7:0];
	reg [1:0] pixIdx [7:0];

	reg [2:0] ramIdx_left [7:0];
	reg [1:0] pixIdx_left [7:0];
	reg [2:0] ramIdx_right [7:0];
	reg [1:0] pixIdx_right [7:0];
	
	wire [2:0] idx_mapping[7:0];

	reg [2:0] idx_mapped[7:0],idx_mapped_lt[7:0],idx_mapped_rt[7:0];
	
	reg   isBuf,isBuf1,refFilter;
	
	reg   [2:0] bottomL_opt,topR_opt,DC_opt;
	reg   [2:0] bottomL_opt_,topR_opt_,DC_opt_;
	
	reg [1:0]		unFil_opt,unFil_opt_;
	reg	[7:0]		n_tl_n_63_,n_tl_n_63;
	
	wire x33 = (X==3 && Y==3);
	wire x11 = (X==1 && Y==1);
	wire dc5 = (tuSize == 3'd5 && preStage == 4'd8);
	wire dc4 = (tuSize == 3'd4 && x33);
	wire dc3 = (tuSize == 3'd3 && x11);
	wire  isBuf_ = (mode == 6'd0 && ( (tuSize==3'd5 && X!=4'd7)  || (tuSize==3'd4 && X!=4'd3) ||  (tuSize==3'd3 && X!=4'd1)  ));
	wire  isBuf1_ = (mode==6'd0 && (( tuSize ==3'd5 && X==4'd7 )|| (tuSize==3'd4 && X==4'd3) 
							|| (tuSize==3'd3 && X==4'd1 && Y!=1) ));
	wire  refFilter_ = ( (noFilter1 || noFilter2) || (noFilter3 || noFilter4 ) || isChroma)? 0:1;
	assign {idx_mapping[0],idx_mapping[1],idx_mapping[2],idx_mapping[3],
			idx_mapping[4],idx_mapping[5],idx_mapping[6],idx_mapping[7]} = ramIdxMapping;
	
	wire [5:0]   maxIdx = (((1<<tuSize)<<1)-1);
	wire [7:0]	 pos_neq_maxIdx = {pos[7]!=maxIdx,pos[6]!=maxIdx,pos[5]!=maxIdx,pos[4]!=maxIdx,pos[3]!=maxIdx,pos[2]!=maxIdx,pos[1]!=maxIdx,pos[0]!=maxIdx};
	reg [7:0]	 pos_neq_maxIdx_buf1, pos_neq_maxIdx_buf;
	reg			 n_isBuf_refFilter,n_isBuf1_refFilter;
	always @(posedge clk or negedge arst_n)	begin
		if(!arst_n)	begin
			{isBuf,isBuf1,refFilter,midLtRt_opt_,idx_mapped_,topR_opt_,bottomL_opt_,DC_opt_,
			n_isBuf_refFilter,n_isBuf1_refFilter,pos_neq_maxIdx_buf,pos_neq_maxIdx_buf1,
			n_tl_n_63} <= 0;
			{opt_,en_result} <= 0;
			unFil_opt_ <= 0;
			end
		else if(!rst_n)	begin
			{isBuf,isBuf1,refFilter,midLtRt_opt_,idx_mapped_,topR_opt_,bottomL_opt_,DC_opt_,
			n_isBuf_refFilter,n_isBuf1_refFilter,pos_neq_maxIdx_buf,pos_neq_maxIdx_buf1,
			n_tl_n_63} <= 0;
			{opt_,en_result} <= 0;
			unFil_opt_ <= 0;
			end
		else	begin
			if(!bStop)	begin
				isBuf <= isBuf_;
				isBuf1	<= isBuf1_;
				refFilter <= refFilter_;
				midLtRt_opt_ <= {midLtRt_opt[0],midLtRt_opt[1],midLtRt_opt[2],midLtRt_opt[3]
								 ,midLtRt_opt[4],midLtRt_opt[5],midLtRt_opt[6],midLtRt_opt[7]};
				idx_mapped_ <= {idx_mapped[0],idx_mapped[1],idx_mapped[2],idx_mapped[3],
							idx_mapped[4],idx_mapped[5],idx_mapped[6],idx_mapped[7],
							idx_mapped_lt[0],idx_mapped_lt[1],idx_mapped_lt[2],idx_mapped_lt[3],
							idx_mapped_lt[4],idx_mapped_lt[5],idx_mapped_lt[6],idx_mapped_lt[7],
							idx_mapped_rt[0],idx_mapped_rt[1],idx_mapped_rt[2],idx_mapped_rt[3],
							idx_mapped_rt[4],idx_mapped_rt[5],idx_mapped_rt[6],idx_mapped_rt[7]};
				topR_opt_ <= topR_opt;
				bottomL_opt_ <= bottomL_opt;
				DC_opt_ <= DC_opt;
				n_isBuf_refFilter <= !isBuf_  && refFilter_;
				n_isBuf1_refFilter <= !isBuf1_  && refFilter_;
				pos_neq_maxIdx_buf <=  {!isBuf_&& refFilter_ && pos_neq_maxIdx[7],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[6],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[5],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[4],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[3],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[2],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[1],
										!isBuf_&& refFilter_ && pos_neq_maxIdx[0]};
				pos_neq_maxIdx_buf1 <=  {!isBuf1_ && refFilter_ && pos_neq_maxIdx[7],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[6],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[5],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[4],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[3],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[2],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[1],
										!isBuf1_ && refFilter_ && pos_neq_maxIdx[0]};	
				unFil_opt_ <= unFil_opt;				//###
				n_tl_n_63 <= n_tl_n_63_;
				{opt_,en_result} <= {opt,!bStop1 && preStage[3]};
			end
		end
	end
	
	
	
	always@(*)	begin
			bottomL_opt = 4;
			topR_opt = 4;
		if (preStage == 4'd2 && mode==0 && tuSize == 5) 
			bottomL_opt = 0;// temp_ref[4]; 
		if (preStage == 4'd3 && mode==0 && tuSize == 5)
			topR_opt= 0;	
			
		if (dc4) 
			bottomL_opt = 1;//bottom_left_pixel = isChroma?refm[2]:refm_121FIR[2]; 
		if (preStage == 4'd0 && mode!=6'd1 && tuSize == 4)
			topR_opt=1;
			
		if (dc3)	begin
			bottomL_opt = 2;
			topR_opt = 2;
			end
		if (tuSize==2) begin
			bottomL_opt = 3;
			topR_opt =3;
			end
			
		
		if((tuSize==5 ) && (preStage[0]==preStage[1]))
			DC_opt = 0;//DC_x[d] = pixel[idx_mapping[d[3:2]]][d[1:0]];
		else if(((tuSize==5 ) && (preStage[0]!=preStage[1])) || (dc4 && preStage[3]) ) 
			DC_opt = 1;//DC_x[d] = pixel[idx_mapping[{1'b1,d[3:2]}]][d[1:0]];  
		else if (tuSize ==4 && preStage==0)
			DC_opt = 2;//DC_x[d] = pixel[idx_mapping[d[3:2]]][d[1:0]];
		else if(dc3)
			DC_opt = 3;
		else if (tuSize==3'd2)
			DC_opt = 4;
		else
			DC_opt = 5;
			
		unFil_opt =0;
		if(dc5)
			unFil_opt =1;
		if(dc4 || dc3 || tuSize==3'd2)
			unFil_opt =2;

	end
	
	generate genvar t;
	for(t=0;t<8;t=t+1)begin: xt
		always @(*) begin 
			pos[t]   =  ref_pos[(47-6*t):(42-6*t)] ; 
			pos_plus1[t] = pos[t]+1;
			pos_minus1[t] = pos[t]-1;
			flag[t]  =  ref_flag[(15-2*t):(14-2*t)] ;
			pixIdx[t] = (pos[t]%4);
			pixIdx_left[t] = (pos_minus1[t]%4);
			pixIdx_right[t] = (pos_plus1[t]%4);
	
			if(flag[t]==3'd2)   begin
				midLtRt_opt [t] = 0;
			end 
			else  if(flag[t]==3'd0 && pos[t]==0) begin
				midLtRt_opt [t] = 1;
			end 
			else if (flag[t]==3'd1 && pos[t]==0) begin
				midLtRt_opt [t] = 2;
			end
			else begin
				midLtRt_opt [t] = 3;     
			end    
			
			if(flag[t]!=2 && pos[t]!=63)
			    n_tl_n_63_[t] = 1;
			else 
				n_tl_n_63_[t] = 0;
				
				
			case(flag[t])
			2'd0:begin 
				ramIdx[t] = ((pos[t]>>2)%8);
				ramIdx_right[t] = ((pos_plus1[t]>>2)%8);
				ramIdx_left[t] = ((pos_minus1[t]>>2)%8);
			end
			2'd1:begin
				ramIdx[t] = 7-((pos[t]>>2)%8);
				ramIdx_right[t] = 7-((pos_plus1[t]>>2)%8);
				ramIdx_left[t] = 7-((pos_minus1[t]>>2)%8);
			end
			default :begin
				ramIdx[t] = 0;
				ramIdx_right[t] = 0;
				ramIdx_left[t] = 0;
			end
			endcase
			
			idx_mapped[t] = idx_mapping[(ramIdx[t])];
			idx_mapped_lt[t] = idx_mapping[(ramIdx_left[t])];
			idx_mapped_rt[t] = idx_mapping[(ramIdx_right[t])];
			
		end	// end of always block
	end	// end of for 0-7
	endgenerate

	assign options = {isBuf,isBuf1,refFilter,midLtRt_opt_,topR_opt_,bottomL_opt_,DC_opt_,
	n_isBuf_refFilter,n_isBuf1_refFilter,pos_neq_maxIdx_buf,pos_neq_maxIdx_buf1,n_tl_n_63};
	
always @(*) begin
	opt = 0;
	if(!isInter && modeHor)
		opt =1;
	if(isInter)
		opt =2;
end

	assign  opt_recon = {opt_,en_result};
endmodule