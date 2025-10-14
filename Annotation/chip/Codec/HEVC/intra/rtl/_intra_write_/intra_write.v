`timescale 1ns/1ps
module intra_write(
	clk,
	rst_n,
	arst_n,
	bStop,
	bStop_pre,
	reconSamples		//i
	,xTb
	,yTb
	,X
	,Y
	,tuSize
	,partIdx
	,nMaxCUlog2
	,verFlag
	,horFlag
	,isLastCycInTb
	,r_tl_data
	,isCalStage
	,cIdx
	
	,w_data				//o
	,w_data_TL
	,w_addr
	,w_addr_TL
	,wE_n 
	,bDelayWrite
	
	,opt_w_tl
	,opt_w
	,w_TL_rela_
);

	parameter					isChroma=0;
	parameter 					bitDepth = 8;
	parameter AW = 8;
	parameter SRAMDW = bitDepth*4;
	parameter AW_TL = 11;
	parameter nSRAMs = 8;
	
	parameter 							PIC_WIDTH = 7680;
	parameter							ADR_BASE = PIC_WIDTH>>5;
	parameter							ADR_BASE_TL = PIC_WIDTH>>2;
	
	input 								clk,rst_n,arst_n,bStop,bStop_pre;
	input [16*bitDepth-1:0]  			reconSamples;
	input [12:0]						xTb;
	input [12:0]						yTb;
	input [2:0]							X,Y;
	input [2:0] 						tuSize;
	input [bitDepth*2-1:0]  			r_tl_data;
	reg [bitDepth-1:0]  				r_tl_4,r_tl_4_cr;
	
	input [1:0]							partIdx;
	input [2:0]							nMaxCUlog2;
	input [15:0]						verFlag,horFlag;
	input								isLastCycInTb;
	input								isCalStage;
	input [1:0]							cIdx;
	
	input [3*8-1:0]						opt_w;
	input [2:0]							opt_w_tl;	
	input [4:0]							w_TL_rela_;
	
	output reg [SRAMDW*8-1:0]			w_data;
	output reg [bitDepth-1:0]			w_data_TL;
	output reg [AW*8-1:0]				w_addr;
	output reg [AW_TL-1:0]				w_addr_TL;
	output reg [8:0]                    wE_n;
	output reg 							bDelayWrite;
	
	reg [12:0] 							w_TL_base ;
	reg signed [4:0]					w_TL_rela ;

	reg [AW_TL-1:0]						reg_TL_adr,reg_TL_adr_cr;
	reg	[13:0]							xTbPlusXmin1;
	reg [bitDepth-1:0] 					recon[3:0][3:0];
	reg [bitDepth-1:0]					sramPix[7:0][3:0];
	reg [AW-1:0]			 			adr[7:0];


		
	
	reg [3:0] 							x_4inMaxCb,y_4inMaxCb; 
	reg [AW-1:0] 						adrShift[7:0];
	reg [AW-1:0] 						relaAdr[7:0];
	reg [6:0] 							nPB,nMaxCb;
	reg [6:0]							y_bar,x_bar;
	reg [5:0] 							Xplus1sf2,Yplus1sf2;
	reg 	  							addrYUVSel;
	reg									isLastTu;
	
	reg [2:0]							opt_tl;
	reg [2:0]							opt[7:0];	
	

	
	always @(*)	begin
		Xplus1sf2 = (X+1)<<2;
		Yplus1sf2 = (Y+1)<<2;
		addrYUVSel  = (cIdx[0]||cIdx[1]);
	
		nPB = 1<<tuSize;
		x_4inMaxCb = (xTb%nMaxCb>>2)+X;
		y_4inMaxCb = (yTb%nMaxCb>>2)+Y;
	
		xTbPlusXmin1 = xTb+Xplus1sf2-1;
		x_bar = xTbPlusXmin1%nMaxCb;
		y_bar = (yTb+Yplus1sf2-1)%nMaxCb;
		nMaxCb = (1<<nMaxCUlog2);
		isLastTu = (yTb%nMaxCb+nPB)==nMaxCb && (xTb%nMaxCb+nPB==nMaxCb);
		{r_tl_4,r_tl_4_cr} = r_tl_data;
		{opt_tl,opt[0],opt[1],opt[2],opt[3],opt[4],opt[5],opt[6],opt[7]} = {opt_w_tl,opt_w};
	end

	generate
	  genvar i,j;
	  for(i=0;i<4; i=i+1)begin: xi		//i: row
		  for(j=0 ;j<4;j=j+1) begin: xj		//j: col
		   always @(*)  begin   
		      recon[i][j] =  reconSamples[16*bitDepth-1-bitDepth*(4*i+j):15*bitDepth-bitDepth*(4*i+j)];
		  end
		 end
		end
		
	  genvar k,l;
	  for(k=0;k<8; k=k+1)begin	:xk		//k: row
		  for(l=0 ;l<4;l=l+1) begin: xl		//l: col
		   always @(*)  begin   
			  w_data [bitDepth*32-1-bitDepth*(4*k+l):bitDepth*31-bitDepth*(4*k+l)] =  sramPix[k][l];
		  end
		 end
		 always @(*)     
		    w_addr [8*AW-1 - AW*k : 7*AW - AW*k ]  = adr[k];		//[63 - AW*k : 56 - AW*k ]
		 
		end
		
		
	endgenerate

	/*<--------  write to SRAM TL*/
	always @(posedge clk or negedge arst_n)	begin
		if(~arst_n)	begin
			reg_TL_adr <=0 ;
			reg_TL_adr_cr <=0 ;
			bDelayWrite <= 0;
			end
		else if(!rst_n)	begin
			reg_TL_adr <=0 ;
			reg_TL_adr_cr <=0 ;
			bDelayWrite <= 0;
			end
		else 	begin
			if((tuSize!= 2 && X==Y && Xplus1sf2 == nPB) ||(tuSize==2 && cIdx!=0 && isCalStage))
				if(cIdx!=2)
					reg_TL_adr <= bStop? reg_TL_adr : w_addr_TL;
				else
					reg_TL_adr_cr <= bStop? reg_TL_adr_cr : w_addr_TL;
				
			if(isLastCycInTb && isLastTu && bStop_pre && !bStop)
				bDelayWrite <=1 ;
			if(bDelayWrite && !bStop_pre) 
				bDelayWrite <= 0;
			end
			
	end
	

	
	always @(*) begin
	
		w_TL_rela = 0;
		w_TL_base = 0;
		if(isLastCycInTb && (tuSize!=2 || isChroma))	begin
			w_TL_base = cIdx==0?reg_TL_adr:((cIdx==1)?reg_TL_adr_cr:reg_TL_adr);
			w_TL_rela = 0;
		end
		else  begin
			case(opt_tl)
			1:begin	
				w_TL_base = (!isChroma || cIdx==1)?(xTbPlusXmin1>>2): (ADR_BASE_TL>>1)+(xTbPlusXmin1>>2);   	//1024
				w_TL_rela = 0;			end
			2:begin
				w_TL_base = (!isChroma || cIdx==1)? ADR_BASE_TL+1:ADR_BASE_TL+9;				//2049:2057;		ADR_BASE_TL+1:ADR_BASE_TL+9
				w_TL_rela = w_TL_rela_;//((x_bar>>2)-(y_bar>>2));
			end
			3:begin
				w_TL_base =(!isChroma || cIdx==1)?  ADR_BASE_TL+32:ADR_BASE_TL+24;			//2080:2072;   ADR_BASE_TL+32:ADR_BASE_TL+24
				w_TL_rela = w_TL_rela_;//((y_bar>>2)-(x_bar>>2));
			end
			4:begin
				w_TL_base = (!isChroma || cIdx==1)?ADR_BASE_TL+32:ADR_BASE_TL+48;		//2080:2096   ADR_BASE_TL+32:ADR_BASE_TL+48
				w_TL_rela = 0;
			end
			5:begin
				w_TL_base = (!isChroma || cIdx==1)?ADR_BASE_TL+32:ADR_BASE_TL+41;			//2080:2089   ADR_BASE_TL+32:ADR_BASE_TL+48
				w_TL_rela = w_TL_rela_;//((y_bar>>2)-(x_bar>>2));
			end
			default: begin
				w_TL_rela = 0;
				w_TL_base = 0;
			end
			endcase

		end

		w_addr_TL = $signed(w_TL_base)+w_TL_rela;
		
		wE_n[8] = 1;
		if((bDelayWrite && !bStop_pre) )	begin
			wE_n[8] = 0;
			if(cIdx==0)
				w_data_TL = (tuSize==2)? recon[3][3]:r_tl_4;
			else if(cIdx==1)
				w_data_TL = r_tl_4;
			else 
				w_data_TL = r_tl_4_cr;
		end
		else begin
			if(isLastCycInTb && tuSize==2 )	begin
				w_data_TL = cIdx==0?recon[3][3]:(cIdx==1?r_tl_4_cr:r_tl_4);
				
				if(  (!isLastTu ) || (isLastTu && !bStop_pre))	begin
					wE_n[8] = !bStop? 0:1;
				end
				else 
					wE_n[8] = 1;
			end
			else if(isLastCycInTb )	begin
				w_data_TL = !cIdx[0]?r_tl_4:r_tl_4_cr;
				if( (!isLastTu ) || (isLastTu && !bStop_pre))	begin
					wE_n[8] = !bStop? 0:1;
				end
				else 
					wE_n[8] = 1;
				end
			else if((Xplus1sf2 == nPB || Yplus1sf2 == nPB) && (X!=Y) && isCalStage)	begin
				w_data_TL = recon[3][3];
				wE_n[8] = !bStop? 0:1;
				end
			else begin
				w_data_TL = 8'd0;
				wE_n[8] = 1;
			end
		end
		
		
		
	end

	
	
	
	/* write to SRAM TL     --------> */

	/*<--------  write to SRAM 0 to 7*/
	generate
		genvar t;
		for(t=0;t<8; t=t+1)begin		:xt
			always @(*) begin
			
				case(opt[t])
				1: begin
					adrShift[t] = ADR_BASE+2 ;			//258	ADR_BASE+2
					relaAdr[t] = (cIdx!=2'd2)?y_4inMaxCb[3]:1;
				end
				2:begin
					adrShift[t] = ADR_BASE+6;			//262	ADR_BASE+6
					relaAdr[t] = (cIdx!=2'd2)?y_4inMaxCb[3]:1;				
				end
				3:begin
					adrShift[t] = ADR_BASE+10;			//266:	ADR_BASE+10
					relaAdr[t] = (cIdx!=2'd2)?y_4inMaxCb[3]:1;
				end
				4:begin
					adrShift[t] = ADR_BASE+12;			//268:	ADR_BASE+12
					relaAdr[t] = (cIdx!=2'd2)?y_4inMaxCb[3]:1;
				end
				5:begin
					adrShift[t] = (cIdx==2'd2)?(ADR_BASE>>1):0; 		//128: ADR_BASE>>1;
					relaAdr[t]  =((xTb+(X<<2))>>5);
				end
				6:begin
					adrShift[t] = ADR_BASE+8;			//264:   ADR_BASE+8
					relaAdr[t] = (cIdx!=2'd2)?x_4inMaxCb[3]:1;
				end
				7:begin
					adrShift[t] = ADR_BASE+4;				//260:	ADR_BASE+4
					relaAdr[t] = (cIdx!=2'd2)?x_4inMaxCb[3]:1;
				end
				default:begin
					adrShift[t]=ADR_BASE+1;		//257:		ADR_BASE+1
					relaAdr[t]=0;
				end
				endcase
				adr[t] = (adrShift[t]+relaAdr[t]);
				// Can not be written in this way.
				sramPix[t][0] =  0;
				sramPix[t][1] =  0;
				sramPix[t][2] =  0;
				sramPix[t][3] =  0;
				 if(( Xplus1sf2 == nPB || Yplus1sf2 == nPB) && isCalStage ) begin			//opt##: if( ((X+1)<<2) == (1<<tuSize) || (Y+1)<<2) == (1<<tuSize) )
					  if(t == (~y_4inMaxCb)%8  && Xplus1sf2 == nPB &&  (tuSize!=2 || (tuSize==2 && partIdx[0]==1)))
							begin																									// write zone b or d or  b', d'			
								wE_n[t]= (bStop)? 1:0; 
								sramPix[t][0] =  recon[0][3];
								sramPix[t][1] =  recon[1][3];
								sramPix[t][2] =  recon[2][3];
								sramPix[t][3] =  recon[3][3];
	 
						end
					 else if(t== ((~y_4inMaxCb)%8+4)%8 && (Xplus1sf2 == nPB) && (tuSize!=2 || (tuSize==2 && partIdx[0]==1)))
							begin
								wE_n[t]= (bStop)? 1:0; 
								sramPix[t][0] =  recon[0][3];
								sramPix[t][1] =  recon[1][3];
								sramPix[t][2] =  recon[2][3];
								sramPix[t][3] =  recon[3][3];
							end
					else if(t == x_4inMaxCb%8 && Yplus1sf2 == nPB && (tuSize!=2 ||  (tuSize==2  && partIdx!=1))) 
						begin
					// write zone a or c  or e			
							wE_n[t]= (bStop)? 1:0; 
							sramPix[t][0] =  recon[3][0];
							sramPix[t][1] =  recon[3][1];
							sramPix[t][2] =  recon[3][2];
							sramPix[t][3] =  recon[3][3];
					end
					
					else 
						wE_n[t]= 1;				
				end	
				else
					wE_n[t]= 1;			
			end
		end
	endgenerate
	/* write to SRAM 0 to 7     --------> */

endmodule
