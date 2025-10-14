`timescale 1ns / 1ps

module ALU_Controller(Sclk,Dclk,Frame,read_rjl,read_rjr,read_coeffl,read_coeffr,cont_address,signoutL,signoutR,
		sign_statusL,sign_statusR,index_rjL,index_coeffL,index_inL,add_statusL,addip1L,addip2L,addorsubL,addopL,
		shift_statusL,shiftipL,shiftopL,index_rjR,index_coeffR,index_inR,add_statusR,addip1R,addip2R,addorsubR,
		addopR,shift_statusR,shiftipR,shiftopR,alu_status, P2S_status,OutputdataL,OutputdataR,set,Reset_n);

input Sclk,Frame,alu_status,Dclk,Reset_n;
input [15:0]read_rjl;
input [15:0]read_rjr;
input [15:0]read_coeffl;
input [15:0]read_coeffr;
input [12:0]cont_address;
input [39:0]signoutL;
input [39:0]addopL;
input [39:0]shiftopL;
input [39:0]signoutR;
input [39:0]addopR;
input [39:0]shiftopR;
input [12:0]set;

output reg sign_statusL,add_statusL,addorsubL,shift_statusL, P2S_status;
output reg sign_statusR,add_statusR,addorsubR,shift_statusR;
output reg [39:0] addip1L,addip2L,shiftipL;
output reg [3:0]index_rjL;
output reg [8:0]index_coeffL;
output reg [8:0]index_inL;
output reg [39:0]OutputdataL;
output reg [39:0] addip1R,addip2R,shiftipR;
output reg [3:0]index_rjR;
output reg [8:0]index_coeffR;
output reg [8:0]index_inR;
output reg [39:0]OutputdataR;

integer il,ir,pL,pR,jL,jR,flagL,flagR;
reg [15:0]L;
reg [15:0]R;
reg [39:0]ul;
reg [39:0]ur;
reg [39:0]yl;
reg [39:0]yr;
reg [7:0]kL;
reg signbitL;
reg [7:0]kR;
reg signbitR;


initial begin
	flagL=1;
	yl=40'h0;
	shift_statusL=0;
	il=0;
	index_rjL=il;
	pL = 0;
	jL = pL;
	index_coeffL=jL;
	ul = 40'b0;
	sign_statusL=0;
	
	flagR=1;
	yr=40'h0;
	shift_statusR=0;
	ir=0;
	index_rjR=ir;
	pR = 0;
	jR = pR;
	index_coeffR=jR;
	ur = 40'b0;
	sign_statusR=0;
end

always @(posedge Sclk)
begin
	if(Reset_n==1'b0)
	begin
		//InReady=1'b0;
		//state=7;
		yl=40'b0;
		yr=40'b0;
		ur=40'b0;
		ul=40'b0;
		
		flagL=1;
		shift_statusL= 0;
		il=0;
		P2S_status=0;
		index_rjL=il;
		pL = 0;
		jL = pL;
		index_coeffL=jL;
		yl=40'b0;
		ul = 40'b0;
		sign_statusL=0;
		
		flagR=1;
		shift_statusR= 0;
		ir=0;
		P2S_status=0;
		index_rjR=ir;
		pR = 0;
		jR = pR;
		index_coeffR=jR;
		yr=40'b0;
		ur = 40'b0;
		sign_statusR=0;
		
	end
end


//--------------LEFT CHANNEL-------------------------
always @(negedge Frame)
begin
	if(il==16)
	begin
		shift_statusL= 0;
		il=0;
		P2S_status=0;
		index_rjL=il;
		pL = 0;
		jL = pL;
		index_coeffL=jL;
		yl=40'b0;
		ul = 40'b0;
		sign_statusL=0;
		flagL=1;
	end
end

always @(posedge Sclk)
begin
	
	if(alu_status == 1)
	begin
		case (flagL)	
		
		1:
		begin
			if(il<16)
			begin
				L = read_rjl;
				kL = read_coeffl[7:0];
				signbitL = read_coeffl[8];
				if(jL<(pL+L))
				begin

					add_statusL=0;
					flagL=2;
					if(cont_address >= kL)
					begin
						sign_statusL=1;
						index_inL=cont_address-kL;
						if(index_inL > 511)
						begin
							index_inL = index_inL  - set;
							if(index_inL < 0)
							begin
								index_inL = index_inL + 512;
							end
						end
					end
				end				
			end
		end
		
		2:
		begin
			if(cont_address >= kL)
			begin
				if(signbitL == 1'b1)
				begin
					addorsubL=1;
					addip1L=ul;
					flagL = 3;
				end
				else
				begin
					addorsubL=0;
					addip1L=ul;
					flagL = 3;
				end
			end
			else 
			begin
			jL=jL+1;
			if(jL==(pL+L))
			begin
				addorsubL=0;
				addip1L=yl;
				addip2L=ul;
				flagL=5;
			end
			else 
				flagL=1;
				index_coeffL=jL;
			end
		end
		
		3:
		begin
		addip2L=signoutL;
		flagL=4;
		end
				
		4:
		begin
			ul=addopL;
			addorsubL=0;
			jL=jL+1;
			if(jL==(pL+L))
			begin
				addorsubL=0;
				addip1L=yl;
				addip2L=ul;
				flagL=5;
			end
			else 
				flagL=1;
				index_coeffL=jL;
		end
		
		5:
		begin
			shift_statusL=1;
			shiftipL=addopL;
			flagL=6;
		end
	
		6:
		begin
			yl=shiftopL;
			if(jL==(pL+L))
			begin
				flagL=1;
				pL = pL+L;
				il=il+1;
				index_rjL=il;
				jL = pL;
				index_coeffL=jL;
				ul = 40'b0;
				/*ur = 40'b0;*/
				L = read_rjl;				
				sign_statusL=0;
			end
			if(il==16)
				flagL=7;
		end
		
		7:
		begin
			OutputdataL = yl;
			P2S_status=1;
		end
		
		endcase
	end
	
end

//--------------RIGHT CHANNEL-------------------------

always @(negedge Frame)
begin
	if(ir==16)
	begin
		shift_statusR= 0;
		ir=0;
		P2S_status=0;
		index_rjR=ir;
		pR = 0;
		jR = pR;
		index_coeffR=jR;
		yr=40'b0;
		ur = 40'b0;
		sign_statusR=0;
		flagR=1;
	end
end

always @(posedge Sclk)
begin
	
	if(alu_status == 1)
	begin
		case (flagR)	
		
		1:
		begin
			if(ir<16)
			begin
				R = read_rjr;
				kR = read_coeffr[7:0];
				signbitR = read_coeffr[8];
				if(jR<(pR+R))
				begin

					add_statusR=0;
					flagR=2;
					if(cont_address >= kR)
					begin
						sign_statusR=1;
						index_inR=cont_address-kR;
						if(index_inR > 511)
						begin
							index_inR = index_inR  - set;
							if(index_inR < 0)
							begin
								index_inR = index_inR + 512;
							end
						end
					end
				end				
			end
		end
		
		2:
		begin
			if(cont_address >= kR)
			begin
				if(signbitR == 1'b1)
				begin
					addorsubR=1;
					addip1R=ur;
					flagR = 3;
				end
				else
				begin
					addorsubR=0;
					addip1R=ur;
					flagR = 3;
				end
			end
			else 
			begin
			jR=jR+1;
			if(jR==(pR+R))
			begin
				addorsubR=0;
				addip1R=yr;
				addip2R=ur;
				flagR=5;
			end
			else 
				flagR=1;
				index_coeffR=jR;
			end
		end
		
		3:
		begin
		addip2R=signoutR;
		flagR=4;
		end
				
		4:
		begin
			ur=addopR;
			addorsubR=0;
			jR=jR+1;
			if(jR==(pR+R))
			begin
				addorsubR=0;
				addip1R=yr;
				addip2R=ur;
				flagR=5;
			end
			else 
				flagR=1;
				index_coeffR=jR;
		end
		
		5:
		begin
			shift_statusR=1;
			shiftipR=addopR;
			flagR=6;
		end
	
		6:
		begin
			yr=shiftopR;
			if(jR==(pR+R))
			begin
				flagR=1;
				pR = pR+R;
				ir=ir+1;
				index_rjR=ir;
				jR = pR;
				index_coeffR=jR;
				//ul = 40'b0;
				ur = 40'b0;
				R = read_rjr;				
				sign_statusR=0;
			end
			if(ir==16)
				flagR=7;
		end
		
		7:
		begin
			OutputdataR = yr;
			P2S_status=1;
		end
		
		endcase
	end
	
end
endmodule
