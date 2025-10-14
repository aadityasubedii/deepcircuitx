`timescale 1ns/1ps
module intra_read(
	clk,
	arst_n,
	rst_n,
	bStop,
	bStop_,
	pseuAdr,		//i
	pIdx,
	X,
	Y,
	xTb,
	yTb,
	tuSize,
	r_addr,		//o
	r_addr_TL,
	rE_n,
	horFlag,
	verFlag,
	verLevel_o,
	horLevel_o,
	isCalStage,
	nMaxCUlog2,
	isFirstCycInTb,
	cIdx,
	isRtBorder,
	isBtBorder,
	o_modiPsAdr,
	o_modiPosIn4,
	o_ram_idx,
	posRtBorderIn4,
	posBtBorderIn4
	);

	parameter						isChroma = 0;
	parameter AW = 8;
	parameter AW_TL = 11;
	parameter nSRAMs = 9;
	
	parameter 							PIC_WIDTH = 7680;
	parameter							ADR_BASE = PIC_WIDTH>>5;		//240
	parameter							ADR_BASE_TL = PIC_WIDTH>>2;		//1920
	
	input							clk,rst_n,arst_n,bStop,bStop_;
    input [8*3-1:0] 				pseuAdr;
	input [1:0]						pIdx; 
	input [12:0]   					xTb;
	input [12:0]   					yTb;
	input [2:0]						nMaxCUlog2;
	input [2:0]						X,Y;	
	input [2:0]						tuSize;
	input							isCalStage;
	input							isFirstCycInTb;
	input [1:0]						cIdx;
	input							isRtBorder;
	input							isBtBorder;
	input  [4:0]					posRtBorderIn4,posBtBorderIn4;
	
    
    reg [2:0]   					s_adr[7:0];
	reg [2:0]   					modi_psAdr[7:0];
	reg [AW-1:0]        			adrVal[7:0];     
	output reg [AW_TL-1:0]  		r_addr_TL;
	output reg [AW*8-1:0] 			r_addr;
	output reg [nSRAMs-1:0]  		rE_n;
	output reg [15:0]				horFlag,verFlag;
	output reg [16*4-1:0] 			verLevel_o,horLevel_o;
	output reg [8*3-1:0] 			o_modiPsAdr;
	output reg [8*5-1:0]			o_modiPosIn4;
	output reg [8*3-1:0]			o_ram_idx;

	
	reg [4:0] 						horLevel[15:0];
	reg [4:0] 						verLevel[15:0];
	reg [5:0]						xTbModMaxCu,yTbModMaxCu;
	reg [3:0]						xTbModMaxCuRSft2,yTbModMaxCuRSft2;

	reg [6:0] 						y_bar,x_bar;
	reg [5:0]						cor_x,cor_y;
	reg [5:0] 						Xplus1sf2,Yplus1sf2;
	reg [6:0]						nTB,nMaxCU;
	reg [4:0]						nMaxCU4;
	reg 							isWhite;
	reg [1:0]						x_16,y_16;
	reg								tu3Npid3;

	always @(*) begin
		Xplus1sf2 = (X+1)<<2;
		Yplus1sf2 = (Y+1)<<2;	
		nTB = 1<<tuSize;
		y_bar = yTb%nMaxCU+Yplus1sf2;
		x_bar = xTb%nMaxCU+Xplus1sf2;
		cor_y = ((yTb%nMaxCU)>>2)+(nTB>>2);
		cor_x = ((xTb%nMaxCU)>>2)+(nTB>>2);
		xTbModMaxCu = xTb%nMaxCU;
		yTbModMaxCu = yTb%nMaxCU;
		nMaxCU = (1<<nMaxCUlog2);
		nMaxCU4 = (nMaxCU>>2);
		x_16 = (xTbModMaxCu)>>4;
		y_16 = (yTbModMaxCu)>>4;
		tu3Npid3 = (tuSize==3 && pIdx ==3) || (tuSize==2 && (xTbModMaxCu>>3)%2==1 && (yTbModMaxCu>>3)%2==1 );
		
		isWhite = ((x_16-y_16)%2==0)?1:0;
		
		xTbModMaxCuRSft2 = xTbModMaxCu>>2;
		yTbModMaxCuRSft2 = yTbModMaxCu>>2;
	end
	
	reg [3:0] 			rela_tl_adr;
	reg [AW_TL-1:0]  		base_tl_adr;
	
	always @(*) begin
	
		if((isFirstCycInTb))
			rE_n[8] = 0;
		else 
			rE_n[8] = 1;
		
		if(yTbModMaxCu==0)	begin			//TL_a zone
			rela_tl_adr = 0;
			base_tl_adr = (!isChroma || !cIdx[1])?((xTb>>2)-1): ((ADR_BASE_TL>>1)-1+(xTb>>2));		//1023
			end
		else if( xTbModMaxCu==0  && ((xTb>>nMaxCUlog2)%2 == 1 || yTbModMaxCu!=(nMaxCU>>1) ))	begin	//TL_c zone    xTb[6]==0 <==> (xTb>>6)[0]==0
			base_tl_adr = (!isChroma)? ADR_BASE_TL+16:(cIdx==1?ADR_BASE_TL+24:ADR_BASE_TL+16);			//cIdx==0? 2064:(cIdx==1?2072:2064);
			rela_tl_adr = (yTbModMaxCuRSft2-xTbModMaxCuRSft2);
			end
		else if( xTbModMaxCu==0 && yTbModMaxCu==(nMaxCU>>1) && (xTb>>nMaxCUlog2)%2==0)	begin			//TL_c_odd zone 
			base_tl_adr = (!isChroma || !cIdx[1])? ADR_BASE_TL+32:ADR_BASE_TL+48;		//2080:2096
			rela_tl_adr = 0;
			end
			
		else if ( (xTbModMaxCu >= yTbModMaxCu) && yTbModMaxCu!=0) 	begin	//TL_b zone			yTb[5:0]!=0 <==> yTb%64!=0
			base_tl_adr = (!isChroma || !cIdx[1])? ADR_BASE_TL+1:ADR_BASE_TL+9;		//2049:2057;
			rela_tl_adr = (xTbModMaxCuRSft2-yTbModMaxCuRSft2);
			end
		else if (xTbModMaxCu!=0 && (xTbModMaxCu < yTbModMaxCu) && xTbModMaxCu!=0)		begin		//TL_d zone 
			base_tl_adr = (!isChroma || !cIdx[1])? ADR_BASE_TL+32:ADR_BASE_TL+41;		//2080:2089;
			rela_tl_adr =(yTbModMaxCuRSft2-xTbModMaxCuRSft2);
			end
		else	begin
			base_tl_adr = 0;
			rela_tl_adr =0;
		end
		
		
		r_addr_TL = rela_tl_adr + base_tl_adr;
	end
	
	
	reg [AW-1:0] 			adrShift[7:0];
	reg [4:0]				posIn4[7:0];
	reg [4:0]				modiPosIn4[7:0];
	reg [3:0]				ram_idx[7:0];
	reg [6:0]				s32[7:0];
	generate
	  genvar i;
	  for(i=0;i<8;i=i+1) begin	:xi
	    always @(*) begin
		  
		  s_adr [i] = pseuAdr[(23-3*i):(21-3*i)];
		  if(s_adr[i][0] == 0)
			posIn4[i] = xTbModMaxCuRSft2+i+(s_adr[i][1]<<3);
		  else if(s_adr[i]!= 7)
			posIn4[i] = yTbModMaxCuRSft2+(7-i)+(s_adr[i][1]<<3);
		  else 
			posIn4[i] = 25;
		
		  if(s_adr[i][0]==1 && s_adr[i]!= 7 && !(isWhite^tu3Npid3))			//s_adr[i][0]==1 && s_adr[i]!= 7 && !(isWhite^tu3Npid3)
			ram_idx[i] = ((7-posIn4[i]%8)+4)%8;
		  else if(s_adr[i][0]==1 && s_adr[i]!= 7 && (isWhite^tu3Npid3))
			ram_idx[i] = (7-posIn4[i]%8);
		  else if(s_adr[i][0]==0)
			ram_idx[i] = posIn4[i]%8;
		  else 
			ram_idx[i] = 10;
			
			
		case ({ram_idx[7]==i,ram_idx[6]==i,ram_idx[5]==i,ram_idx[4]==i,ram_idx[3]==i,ram_idx[2]==i,ram_idx[1]==i,ram_idx[0]==i})
		8'b00000001:	begin	
			rE_n[i] = 0;
				if(s_adr[0][0]==0 && yTbModMaxCu==0)
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[0] )>>3):((ADR_BASE>>1)+((posIn4[0] )>>3)); 	//(!isChroma || !cIdx[1])?((posIn4[0] )>>3):(128+((posIn4[0] )>>3));
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[0] )>>3):1;
					
				if(s_adr[0][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);

				else if(s_adr[0][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[0]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[0][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[0]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[0][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[0]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
			modi_psAdr[i] = s_adr[0];
			modiPosIn4[i] = posIn4[0];
				
		end
		8'b00000010:begin	
				rE_n[i] = 0;
				if(s_adr[1][0]==0 && yTbModMaxCu==0)
					s32[i] =  (!isChroma || !cIdx[1])?((posIn4[1] )>>3):((ADR_BASE>>1)+((posIn4[1] )>>3));  
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[1] )>>3):1;
					
				if(s_adr[1][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	

				else if(s_adr[1][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[1]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[1][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[1]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[1][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[1]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
			modi_psAdr[i] = s_adr[1];	
			modiPosIn4[i] = posIn4[1];
				
		end
		8'b00000100:begin	
				rE_n[i] = 0;
				if(s_adr[2][0]==0 && yTbModMaxCu==0)
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[2] )>>3):((ADR_BASE>>1)+((posIn4[2] )>>3));  
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[2] )>>3):1;
					
				if(s_adr[2][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	

				else if(s_adr[2][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[2]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[2][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[2]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[2][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[2]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
			modi_psAdr[i] = s_adr[2];		
			modiPosIn4[i] = posIn4[2];	
		end
		8'b00001000:begin		
				rE_n[i] = 0;
				if(s_adr[3][0]==0 && yTbModMaxCu==0)
					s32[i] =  (!isChroma || !cIdx[1])?((posIn4[3] )>>3):((ADR_BASE>>1)+((posIn4[3] )>>3)); 
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[3] )>>3):1;
					
				if(s_adr[3][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	

				else if(s_adr[3][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[3]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[3][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[3]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[3][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[3]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
			modi_psAdr[i] = s_adr[3];		
			modiPosIn4[i] = posIn4[3];	
		end
		8'b00010000:begin	
				rE_n[i] = 0;
				if(s_adr[4][0]==0 && yTbModMaxCu==0)
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[4] )>>3):((ADR_BASE>>1)+((posIn4[4] )>>3)); 
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[4] )>>3):1;
					
				if(s_adr[4][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	 

				else if(s_adr[4][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[4]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[4][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[4]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[4][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[4]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
			modi_psAdr[i] = s_adr[4];		
			modiPosIn4[i] = posIn4[4];	
		end
		8'b00100000:begin	
					rE_n[i] = 0;
						if(s_adr[5][0]==0 && yTbModMaxCu==0)
							s32[i] = (!isChroma || !cIdx[1])?((posIn4[5] )>>3):((ADR_BASE>>1)+((posIn4[5] )>>3)); 
						else 
							s32[i] = (!isChroma || !cIdx[1])?((posIn4[5] )>>3):1;
							
						if(s_adr[5][0]== 0 && yTbModMaxCu==0 )	
							adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	 

						else if(s_adr[5][0]==0)					//zone c or e
							adrShift[i] = (horFlag[posIn4[5]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
					
						else if(s_adr[5][0]==1 && (isWhite^tu3Npid3))		//  zone d or b		if((isWhite && !tu3Npid3) || (!isWhite && tu3Npid3))
							adrShift[i] = (verFlag[posIn4[5]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
							
						else if(s_adr[5][0]==1 && !(isWhite^tu3Npid3))				//	if((!isWhite && !tu3Npid3) || (isWhite && tu3Npid3))
							adrShift[i] = (verFlag[posIn4[5]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
							
						else 
							adrShift[i] = 0;				
				modi_psAdr[i] = s_adr[5];			
				modiPosIn4[i] = posIn4[5];		
				end
		8'b01000000:begin	rE_n[i] = 0;
					if(s_adr[6][0]==0 && yTbModMaxCu==0)
						s32[i] = (!isChroma || !cIdx[1])?((posIn4[6] )>>3):((ADR_BASE>>1)+((posIn4[6] )>>3)); 
					else 
						s32[i] = (!isChroma || !cIdx[1])?((posIn4[6] )>>3):1;
						
					if(s_adr[6][0]== 0 && yTbModMaxCu==0 )	
						adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	 

					else if(s_adr[6][0]==0)					//zone c or e
						adrShift[i] = (horFlag[posIn4[6]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
				
					else if(s_adr[6][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
						adrShift[i] = (verFlag[posIn4[6]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
						
					else if(s_adr[6][0]==1 && !(isWhite^tu3Npid3))
						adrShift[i] = (verFlag[posIn4[6]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
						
					else 
						adrShift[i] = 0;				
				modi_psAdr[i] = s_adr[6];		
				modiPosIn4[i] = posIn4[6];	
				end
		8'b10000000:begin	
				rE_n[i] = 0;
				if(s_adr[7][0]==0 && yTbModMaxCu==0)
					s32[i] =  (!isChroma || !cIdx[1])?((posIn4[7] )>>3):((ADR_BASE>>1)+((posIn4[7] )>>3)); 
				else 
					s32[i] = (!isChroma || !cIdx[1])?((posIn4[7] )>>3):1;
					
				if(s_adr[7][0]== 0 && yTbModMaxCu==0 )	
					adrShift[i] = (((xTb>>nMaxCUlog2)<<nMaxCUlog2)>>5);	

				else if(s_adr[7][0]==0)					//zone c or e
					adrShift[i] = (horFlag[posIn4[7]%nMaxCU4]==1)?(ADR_BASE+4 ):(ADR_BASE+8);
			
				else if(s_adr[7][0]==1 && (isWhite^tu3Npid3))		//  zone d or b
					adrShift[i] = (verFlag[posIn4[7]%nMaxCU4]==1)? (ADR_BASE+6):(ADR_BASE+2);
					
				else if(s_adr[7][0]==1 && !(isWhite^tu3Npid3))
					adrShift[i] = (verFlag[posIn4[7]%nMaxCU4]==1)? (ADR_BASE+12):(ADR_BASE+10);
					
				else 
					adrShift[i] = 0;				
				modi_psAdr[i] = s_adr[7];	
				modiPosIn4[i] = posIn4[7];
				end
					
		default :  begin 
					s32[i] = 0;
					modiPosIn4[i] = 0;
					adrShift[i] = ADR_BASE+1;
					rE_n[i] = 1;
					modi_psAdr[i] = 7;
					end
		
		endcase		
		
		
		  adrVal[i] = adrShift[i]+s32[i];
		  r_addr [(8*AW-1-AW*i):(7*AW-AW*i)] = adrVal[i];
		  
		 end
	 end
    endgenerate
		
		
	
	
	/*<--------  update the horFlag,verFlag, horLevel,verLevel*/
	
	always @(posedge clk or negedge arst_n)	begin
				if(~arst_n)	begin
					o_modiPsAdr <= 0;
					o_modiPosIn4 <= 0;
					o_ram_idx <= 0;
				end
				else if(~rst_n)	begin
					o_modiPsAdr <= 0;
					o_modiPosIn4 <= 0;
					o_ram_idx <= 0;
				end
				else	begin
					if(!bStop_) begin
						o_modiPsAdr <= {modi_psAdr[0],modi_psAdr[1],modi_psAdr[2],modi_psAdr[3],modi_psAdr[4],modi_psAdr[5],modi_psAdr[6],modi_psAdr[7]};
						o_modiPosIn4 <= {modiPosIn4[0],modiPosIn4[1],modiPosIn4[2],modiPosIn4[3],modiPosIn4[4],modiPosIn4[5],modiPosIn4[6],modiPosIn4[7]};
						o_ram_idx <= {ram_idx[0][2:0],ram_idx[1][2:0],ram_idx[2][2:0],ram_idx[3][2:0],ram_idx[4][2:0],ram_idx[5][2:0],ram_idx[6][2:0],ram_idx[7][2:0]};
					end
				end
				
		end
		
	wire 			bBt,bRt;
	assign    bBt =   isBtBorder && yTbModMaxCuRSft2+(nTB>>2) == posBtBorderIn4;
	assign    bRt =    (isRtBorder && xTbModMaxCuRSft2+(nTB>>2)==posRtBorderIn4);
		
	generate 
		genvar v;
		for(v=0;v<16;v=v+1)	begin	:xv
			always @(*) begin
				verLevel_o [63-4*v:60-4*v] =  verLevel[v];
				horLevel_o [63-4*v:60-4*v] =  horLevel[v];
			end
			always @(posedge clk or negedge arst_n)	begin
				if(~arst_n)	begin
					horFlag[v] <= 0; 
					horLevel[v] <= 0;
					verFlag[v] <= 0; 
					verLevel[v] <= 0;
					
				end
				else if(~rst_n)	begin
					horFlag[v] <= 0; 
					horLevel[v] <= 0;
					verFlag[v] <= 0; 
					verLevel[v] <= 0;
				end 
				else	begin
																			//y_bar = yTb%nMaxCU+Yplus1sf2;   x_bar = xTb%nMaxCU+Xplus1sf2;
		
				if(!cIdx[0] && !bStop)	begin		//cIdx ==0 or cIdx==2;
						if(Y==0 && X==0 && ((((y_bar==x_bar) || bBt) && x_bar+nTB==nMaxCU+4) ||  (bRt && y_bar+nTB==nMaxCU+4) ||  (bRt && bBt)   ))	begin
							horFlag[v] <= 0; 
							horLevel[v] <= 0;
							verLevel[v] <=  0; 
							
						end
						else if(Y==0 && X==0 && isCalStage)
							begin
								if(v>=xTbModMaxCuRSft2 && v< (xTbModMaxCuRSft2+((nTB>>2))))	begin
									horFlag[v] <= !horFlag[v]; 
									horLevel[v] <= ( horLevel[v]+(nTB>>2)); 
								end
							
								if(v>=yTbModMaxCuRSft2 && v< (yTbModMaxCuRSft2+((nTB>>2))))	begin
									verLevel[v] <=(verLevel[v]+(nTB>>2)); 
								end
							end
						
						if(Y==0 && X==0 && (bRt && (y_bar+nTB==nMaxCU+4 || bBt)))	begin
							verFlag[v] <=  0; 
						end
						else if(Y==0 && X==0 && isCalStage)
							begin
								if(v>=yTbModMaxCuRSft2 && v< (yTbModMaxCuRSft2+((nTB>>2))))	
									verFlag[v] <= !verFlag[v]; 	
							end
					end		//end if (!cIdx[0])
				
				end
			end
		end
	endgenerate
	/* write to specific registers    --------> */
	
	
	
endmodule