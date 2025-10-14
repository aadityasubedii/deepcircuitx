   always @(*)
		if (reset)
			begin
			nextstate <= `INSTUP;
			cnt_rst <= 0;
			end
		else
      begin
		cnt_rst <= 0;
         case(state) 
            `INSTUP:	  	if (initialized) nextstate <= `FETCH;
								else 					  nextstate <= `INSTUP;
			`FETCH:		nextstate <= `DECODE;
            `DECODE:  case(op)
						`REGISTER:	nextstate <= `RTYPEEX; 
						`ANDI:		nextstate <= `IMMEX;
						`ORI:		nextstate <= `IMMEX;
						`XORI:		nextstate <= `IMMEX;
						`SPECIAL:	nextstate <= `STYPEDECODE;
						`ADDI:		nextstate <= `IMMEX;
						`LOADI:		nextstate <= `LIORD;
						`STORI:		nextstate <= `SI;
						
						
						`SHIFT:		nextstate <= `SHIFTEX;
						`SUBI:		nextstate <= `IMMEX;
						`SUBCI:		nextstate <= `IMMEX;
						`CMPI:		nextstate <= `IMMEX;
						`BCOND:		nextstate <= `BTYPEEX; 
						`MOVI:		nextstate <= `IMMEX;
						`MULI:		nextstate <= `IMMEX;
						`LUI:		nextstate <= `IMMEX;
						default:	nextstate <= `INSTUP; 
					endcase
			`IMMEX:	nextstate <= `IMMWR; 
			`IMMWR:	nextstate <= `INSTUP; 
			`SHIFTEX:nextstate <= `SHIFTWR;
			`SHIFTWR:nextstate <= `INSTUP;
			`STYPEDECODE: case(ext)
							`LOAD:		nextstate <= `LBRD; 
							`STOR:		if ( cellram && state_time)	nextstate <= `WRSTALL; 
										else if (cellram) nextstate <= `STYPEDECODE;
										else 			nextstate <= `SBWR;
							`JAL:		nextstate <= `CHECKCOND; 
							`Jcond:		nextstate <= `CHECKCOND; 
							`Scond:		nextstate <= `CHECKCOND;
							`Jimm:		nextstate <= `CHECKCOND;
						default:		nextstate <= `INSTUP;
						endcase
			`BTYPEEX:	if(code_met)	nextstate <= `BTYPEWR; 
						else			nextstate <= `INSTUP; 
			`BTYPEWR:	nextstate <= `INSTUP;
			`LIORD:		nextstate <= `LIOWR;
			`LIOWR:		nextstate <= `INSTUP;
			`SI:		nextstate <= `INSTUP;
			`LBRD:		if(cellram && state_time) 	nextstate <= `RDSTALL;
						else if (cellram)			nextstate <= `LBRD;
						else			nextstate <= `LBWR;
			`LBWR:		nextstate <= `INSTUP;
			`SBWR:		nextstate <= `SBSTL;
			`SBSTL:		nextstate <= `INSTUP;
			`CHECKCOND:	if(code_met)
							case (ext)
								`Jcond:		nextstate <= `JEX; 
								`JAL:		nextstate <= `JALEX1; 
								`Scond:		nextstate <= `SWRITE;
								`Jimm:		nextstate <= `JIMMEX;
								default:	nextstate <= `INSTUP;
							endcase							
						else 				nextstate <= `INSTUP; 
			`JEX:		nextstate <= `INSTUP; 
			`JALEX1:	nextstate <= `JALEX2;
			`JALEX2: 	nextstate <= `INSTUP;
			`RTYPEEX:	nextstate <= `RTYPEWR; 
			`RTYPEWR:	nextstate <= `INSTUP; 
			`SWRITE:	nextstate <= `INSTUP;
			`JIMMEX:	nextstate <= `JIMMEX2;
			`JIMMEX2:	nextstate <= `INSTUP;
			`WRSTALL:	if (cr_ready) 	begin nextstate <= `SBWR;  cnt_rst <= 1; end
						else				nextstate <= `WRSTALL;
			`RDSTALL:	if (cr_ready)	begin nextstate <= `LBWR; cnt_rst <= 1; end
						else				nextstate <= `RDSTALL;
			default: nextstate <= `INSTUP; 
         endcase