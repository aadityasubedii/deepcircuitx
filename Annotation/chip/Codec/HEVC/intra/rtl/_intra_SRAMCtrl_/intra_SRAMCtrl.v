`timescale 1ns/1ps
module intra_SRAMCtrl(
	 rclk,
	 wclk,
	 rAdr,
	 rAdr_TL,
	 wAdr,
	 wAdr_TL,
	 wData,
	 wData_TL,
	 rE_n,
	 wE_n,
	 rData,
	 rData_TL,
	 bStop_r
);	
	parameter bitDepth = 8;
	parameter SRAMDW = bitDepth*4;
	parameter AW = 8;		//9
	parameter AW_TL = 11;	//12
	parameter DEPTH = 254;
	parameter DEPTH_TL = 1970;	

	input 									rclk,wclk;
	input 	[AW*8-1:0] 						rAdr;
	input 	[AW_TL-1:0]						rAdr_TL,wAdr_TL;
	input 	[AW*8-1:0]						wAdr;
	input 	[bitDepth*32-1:0] 				wData;
	input 	[bitDepth-1:0]					wData_TL;
	input 	[8:0]							rE_n;
	input 	[8:0]							wE_n;
	input									bStop_r;
	
	
	output  [bitDepth*32-1:0]				rData;
	output 	[bitDepth-1:0]					rData_TL;

	reg 	[SRAMDW-1:0]					sram_w[7:0];
	wire 	[SRAMDW-1:0]					sram_r[7:0];
	reg 	[AW-1:0]						r_Adr[7:0];
	reg 	[AW-1:0]						w_Adr[7:0];
	
	reg [8:0]								rE_n_;
		
	always @(*)	begin
	
		if(bStop_r)	
			rE_n_[8] = 1;
		else 
			rE_n_[8] = rE_n[8];
	end
	generate 
		genvar i;
		for(i=0;  i<8 ; i=i+1)	begin: SRAM
			always @(*)	begin
				sram_w[i] = wData[bitDepth*32-1-SRAMDW*i:bitDepth*28-SRAMDW*i];
				r_Adr[i] = rAdr[(8*AW-1-AW*i):(7*AW-AW*i)]; 		//(71-AW*i):(63-AW*i)
				w_Adr[i] = wAdr[(8*AW-1-AW*i):(7*AW-AW*i)];		//[(71-AW*i):(63-AW*i)]
				if(bStop_r)	
					rE_n_[i] = 1;
				else 
					rE_n_[i] = rE_n[i];

			end
			stdcore_2prf #(SRAMDW,AW,DEPTH) mem(
				  .wclk(wclk),
				  .wdata(sram_w[i]),
				  .waddr(w_Adr[i]),
				  .we_n(wE_n[i]),
				  
				  .rclk(rclk),
				  .rdata(sram_r[i]),
				  .raddr(r_Adr[i]),
				  .re_n(rE_n_[i])
				);
			
		end
	endgenerate
	
	assign rData= {sram_r[0],sram_r[1],sram_r[2],sram_r[3],sram_r[4],sram_r[5],sram_r[6],sram_r[7]};

stdcore_2prf #(bitDepth,AW_TL,DEPTH_TL) SRAM_TL(
  .wclk(wclk),
  .wdata(wData_TL),
  .waddr(wAdr_TL),
  .we_n(wE_n[8]),
  
  .rclk(rclk),
  .rdata(rData_TL),
  .raddr(rAdr_TL),
  .re_n(rE_n_[8])
);
endmodule