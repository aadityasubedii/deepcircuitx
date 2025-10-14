
module intra_stopCtrl(
	clk,
	rst_n,
	arst_n,
	l_awkCnt,
	resi_val,
	cabad_intra_val,
	isLastCycInTb,
	cIdx,
	isLast32In64_inter,
	
	bStop,
	bStopz,
	bStop0,
	bStop1,
	bStop1_1,
	bStop2,
	bStop3,
	bStop_z,
	bStop_0,
	bStop_1,
	bStop_1_1,
	bStop_2,
	bStop_3,
	cabad_intra_rdy
	
);

	parameter   			SLP_CYC = 3;

	input					clk,rst_n,arst_n;
	input					cabad_intra_val,resi_val;
	input					isLastCycInTb;
	input 					cIdx;
	input					isLast32In64_inter;
	

	wire	 				bStop_cabad_;
	wire 					bStop_pre;

		
	reg						bSleep;
	reg						lz_ladderStop,l0_ladderStop,l_ladderStop,l1_ladderStop,l2_ladderStop;
	reg						bStop_cabad;
	reg	  [1:0]				p;
	reg	  [2:0]				slpCnt;
	reg						lz_bStop,l0_bStop,l_bStop,l1_bStop,l2_bStop,l3_bStop;
	reg	  [2:0]				awkCnt,l0_awkCnt,lz_awkCnt;
	
	output reg [2:0]		l_awkCnt;
	output reg				cabad_intra_rdy;
	output 		bStop,bStopz,bStop0,bStop1,bStop1_1,bStop2,bStop3,bStop_z,bStop_0,bStop_1,bStop_1_1,bStop_2,bStop_3;
	wire		ladderStop;

	assign 		bStop_cabad_ = bStop_cabad || bSleep  || !resi_val;
	assign      bStop = !resi_val  || bStop_cabad_;
	assign  	ladderStop   =		bStop_cabad_ ;
	
	assign      bStop_z = (ladderStop? lz_bStop: bStop)|| !resi_val;
	assign      bStop_0 = (lz_ladderStop? l0_bStop: lz_bStop)|| !resi_val;
	assign      bStop_1 = (l0_ladderStop? l_bStop: l0_bStop) || !resi_val;
	assign      bStop_1_1 = (l_ladderStop? l1_bStop: l_bStop) || !resi_val;
	assign      bStop_2 = (l1_ladderStop? l2_bStop: l1_bStop) || !resi_val;
	assign      bStop_3 = (l2_ladderStop? l3_bStop: l2_bStop) || !resi_val;
	
	assign		bStopz = lz_bStop || !resi_val;
	assign		bStop0 = l0_bStop || !resi_val;
	assign      bStop1 = l_bStop || !resi_val;
	assign      bStop1_1 = l1_bStop || !resi_val;
	assign      bStop2 = l2_bStop || !resi_val;
	assign      bStop3 = l3_bStop || !resi_val;	
	
	
	
	assign 		bStop_pre = !cabad_intra_val && cabad_intra_rdy ;		//i

	
	always @(posedge clk or negedge arst_n) begin
		if(!arst_n)	
			p <= -1;
		else if(!rst_n)
			p <= -1;
		else
			if(p!=2 && resi_val)
				p <= p+1;
	end
	
	always @(*)	begin
	
		if((((isLastCycInTb && !cIdx  && !bStop && isLast32In64_inter)    ||  slpCnt==SLP_CYC || p==0) && resi_val)  )
			cabad_intra_rdy = 1;
		else 
			cabad_intra_rdy = 0;
		
	
		
	
	end
	
	always @(posedge clk or negedge arst_n) begin
		if(!arst_n)	
			bStop_cabad <= 0;
		else if(!rst_n)
			bStop_cabad <= 0;
		else	begin
			if(resi_val)
				bStop_cabad <= bStop_pre;
		end
	end

	 



always @(posedge clk or negedge arst_n) begin
	if(!arst_n)	begin
		bSleep 	<= 0; 
		slpCnt 	<= 0;
		awkCnt  <= 0;
		lz_awkCnt  <= 0;
		l0_awkCnt <= 0;
		l_awkCnt <= 0;
		
		lz_ladderStop <=1;
		l0_ladderStop <=1;
		l_ladderStop <= 1;
		l1_ladderStop <= 1;
		l2_ladderStop<= 1;	
		
		lz_bStop <= 1;		
		l0_bStop <= 1;		
		l_bStop <=1;
		l1_bStop <=1;
		l2_bStop <=1;
		l3_bStop <=1;
		
	end
	else if(!rst_n)	begin
		bSleep 	<= 0; 
		slpCnt 	<= 0;
		awkCnt  <= 0;	
		lz_awkCnt  <= 0;
		l0_awkCnt<= 0;
		l_awkCnt <= 0;
		
		lz_ladderStop <=1;		
		l0_ladderStop <=1;		
		l_ladderStop <= 1;
		l1_ladderStop <= 1;
		l2_ladderStop<= 1;
		
		lz_bStop <= 1;
		l0_bStop <= 1;
		l_bStop <=1;
		l1_bStop <=1;
		l2_bStop <=1;
		l3_bStop <=1;	
		
	
	end
	else
		begin
		
		if(resi_val)	begin 
			lz_ladderStop <= ladderStop;
			l0_ladderStop <= lz_ladderStop;
			l_ladderStop <= l0_ladderStop;
			l1_ladderStop <= l_ladderStop;
			l2_ladderStop <= l1_ladderStop;
			lz_awkCnt	<= awkCnt;
			l0_awkCnt	<= lz_awkCnt;
			l_awkCnt	<= l0_awkCnt;
			lz_bStop <= bStop;
			l0_bStop <= lz_bStop;
			l_bStop <= l0_bStop;
			l1_bStop <= l_bStop;
			l2_bStop <= l1_bStop;
			l3_bStop <= l2_bStop;

				if(bStop_cabad_  && slpCnt<SLP_CYC )	begin
						bSleep 	<= 1; 
						slpCnt 	<= slpCnt+1;	
					end
				else
					begin
						bSleep <= 0 ;
						slpCnt <= 0;
					end
					
				if(!bSleep && !bStop_cabad_)
					awkCnt <= bStop?awkCnt:(awkCnt<SLP_CYC? (awkCnt +1): SLP_CYC);			
				else 
					awkCnt <= 0;
		end
	
	end
end


endmodule